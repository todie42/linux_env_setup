#!/usr/bin/env python 

#	Copyright 2018 Battelle Energy Alliance, LLC

import os
import argparse
import getpass
import sys
import textwrap
from argparse import RawTextHelpFormatter
import subprocess

sys.path.append(os.path.join(os.path.dirname(os.path.realpath(__file__)), '../lib'))
gen_file = "/path/to/gen_pass.pyc"
import myldap

### Arguments ############################################################
parser = argparse.ArgumentParser(
    description='Create LDAP project',
    epilog=textwrap.dedent('''
        Examples:

        %(prog)s -u USERNAME -a ATTRIBUTE '''),
    formatter_class=RawTextHelpFormatter
)

parser.add_argument('-u', '--userid', help="user id like USERNAME")
parser.add_argument('-a', '--attribute', help="Case sensitive name of attribute")

if len(sys.argv)==1:
    parser.print_help()
    sys.exit(1)
args = parser.parse_args()

if not (args.userid):
    parser.error('Must supply a user id  with -i or --userid')
if not (args.attribute):
    parser.error('Must supply an attribute -a or --attribute')

##########################################################################

### set variables ############################################################################
base_pass = getpass.getpass('Please Enter Password:')
ldap_pass = subprocess.check_output(['python', gen_file, base_pass, 'LDAPHOSTNAME']).rstrip()
##############################################################################################

### create ldap object #################################
ldap_obj = myldap.MyLDAP()
conn = ldap_obj.manager_login(provided_passwd=ldap_pass)

entries = ldap_obj.people_search(conn, args.userid)
ldap_obj.check_for_more_than_one_entry(entries)
user_entry_obj = entries[0]
user_dn = user_entry_obj.dn
uid = user_entry_obj.uid

ldap_obj.delete_ldap_attribute(conn, user_dn, args.attribute, uid)

