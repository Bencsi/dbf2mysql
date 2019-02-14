#!/bin/bash
. config.ini

path_length=${#DBF_RELATIVE_PATH}
path_length=$((path_length+1))

for file in $DBF_RELATIVE_PATH/*; do
	file_name_without_extension=$(echo "$file" | cut -f 1 -d '.')
	table_name=${file_name_without_extension:$path_length}
	echo "Creating TABLE '$table_name'"
    	dbf2mysql -U ${DB_USER} -P ${DB_PASS} -t $table_name -h ${DB_HOST} -d ${DB_NAME} -c ./files/$(basename "$file")
done

echo "[DONE] Check your database! :)"
