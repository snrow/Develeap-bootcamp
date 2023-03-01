# !/bin/sh
# until [ -z $(echo "$(mysqladmin ping --password=1234 -h mysql)" | grep -q 'mysqld is alive') ]; do
#         sleep 10
#         echo "DB is not ready yet"
# done
cd /project/ && java -Ddatasource.dialect=MYSQL -Ddatasource.url=jdbc:mysql://mysql:3306/lavagna?useSSL=false -Ddatasource.username=root -Ddatasource.password=1234 -Dspring.profile.active=dev -jar lavagna-jetty-console.war
