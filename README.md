Superpattern Data
-----------------

Run stats:

    $ cat simplified-table.csv | awk -F, '{print $5}' | sort | uniq -c | sort -rn
