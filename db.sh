# 생성된 네트워크 영역에 db 추가
# 다른 컨테이너에서 해당 컨테이너 이름으로 통신하기 위해 생성한 bridge 네트워크에 추가
docker run -i -t -v $PWD/mysql:/var/lib/mysql --net wordpressNetwork -e MYSQL_ROOT_PASSWORD=wordpress -e MYSQL_DATABASE=wordpress -e MYSQL_USER=wordpress -e MYSQL_PASSWORD=wordpress --name db mysql:5.7