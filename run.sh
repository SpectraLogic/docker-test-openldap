#!/bin/sh
set -e

ulimit -n 1024

echo "starting slapd on port 389 and 636..."
chown -R openldap:openldap /etc/ldap
exec /usr/sbin/slapd -h "ldap:/// ldapi:/// ldaps:///" \
  -u openldap \
  -g openldap \
  -d ${LDAP_DEBUG_LEVEL}
