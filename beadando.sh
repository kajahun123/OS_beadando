#! /bin/bash

files_dir=$1

files="$( find ${files_dir} -type f )"
for file1 in $files; do
    for file2 in $files; do
       if [[ "$file1" != "$file2" && -e "$file1" && -e "$file2" ]]; then
          if diff "$file1" "$file2" > /dev/null; then
              echo "$file1 es $file2 duplikalva vannak"
                 read -p "Kiszeretned oket torolni?: "
                        if [ ${REPLY} == "Igen" ]; then
                                rm -v "$file2"

                        elif [ ${REPLY} == "Nem" ]; then
                                exit
                        fi
         fi
       fi
    done
done
