#!/usr/bin/env bash

dir=`dirname "$(readlink -f "$0")"`
echo "Directory " ${dir}
dumpdir=${dir}/roles/database/files
echo "Dump directory " ${dumpdir}
args="'$*'"

dump_db() {
	docker exec db sh -c 'exec mysqldump '$args' --skip-add-drop-table --databases '$1' -uroot -p"$MYSQL_ROOT_PASSWORD"' > ${dumpdir}/$1.sql
	sed -i 's/CREATE TABLE/CREATE TABLE IF NOT EXISTS/g' "${dumpdir}/$1.sql"
	sed -i '/CREATE DATABASE/d' "${dumpdir}/$1.sql"
}

resources=$(cat ${dir}/vars.yml | yq -r -c '.resources[]')
echo "Dumping resources " ${resources}

for resource in ${resources}; do
	dump_db ${resource}
done
