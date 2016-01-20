#!/bin/sh

export NAME=${NAME:-mail}
export DBURL=${DBURL:-sqlite:///data/mail.db}
export DOMAIN=${DOMAIN:-mydomain.com}

echo "--- Configuring modoboa ---"
echo "Instance Name: ${NAME}"
echo "Database URL : ${DBURL}"
echo "Domain Name  : ${DOMAIN}"
echo

modoboa-admin.py deploy \
	"${NAME}" \
	--collectstatic \
	--dburl "${DBURL}" \
	--domain "${DOMAIN}"

echo "DONE!"
echo

echo "Starting modoboa ..."
exec "${@}"
