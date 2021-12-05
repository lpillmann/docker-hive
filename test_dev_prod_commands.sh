# create and see prod table
hive -e "CREATE TABLE pokes (foo INT, bar STRING);";
hive -e "show tables";

# create and see dev table
hive -e "CREATE TABLE pokes (foo INT, bar STRING);" \
-hiveconf hive.metastore.uris=thrift://hive-metastore-dev:9084 \
-hiveconf javax.jdo.option.ConnectionURL=jdbc:postgresql://hive-metastore-postgresql-dev/metastore \
-hiveconf hive.metastore.warehouse.dir=/user/hive/dev/warehouse \
;
hive -e "show tables" \
-hiveconf hive.metastore.uris=thrift://hive-metastore-dev:9084 \
-hiveconf javax.jdo.option.ConnectionURL=jdbc:postgresql://hive-metastore-postgresql-dev/metastore \
-hiveconf hive.metastore.warehouse.dir=/user/hive/dev/warehouse \
;

# see directories in hdfs
hdfs dfs -ls /user/hive/prod/warehouse;
hdfs dfs -ls /user/hive/dev/warehouse;
