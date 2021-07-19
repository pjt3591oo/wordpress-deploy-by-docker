# docker로 wordpress 배포하기 예제

* cli이용하여 컨테이너 띄우기
* docker-compose 이용하여 컨테이너 자동화

## 네트워크 시작

* cli 이용

```sh
$ ./createNetwork.sh

$ ./db.sh

$ ./wordpress.sh
```

각각의 스크립트는 다음과 같습니다.

```sh
# 네트워크 생성
$ docker network create wordpressNetwork

# 생성된 네트워크 영역에 db 추가
# 다른 컨테이너에서 해당 컨테이너 이름으로 통신하기 위해 생성한 bridge 네트워크 모드인 wordpressNetwork에 추가
$ docker run -i -t -v $PWD/mysql:/var/lib/mysql --net wordpressNetwork -e MYSQL_ROOT_PASSWORD=wordpress -e MYSQL_DATABASE=wordpress -e MYSQL_USER=wordpress -e MYSQL_PASSWORD=wordpress --name db mysql:5.7

# 생성된 네트워크 영역에 wordpress 추가
# 같은 브릿지 네트워크에 포함해야 컨테이너 이름으로 통신가능
$ docker run -i -t -v $PWD/html:/var/www/html --net wordpressNetwork -e WORDPRESS_DB_HOST=db:3306 -e WORDPRESS_DB_USER=wordpress -e WORDPRESS_DB_PASSWORD=wordpress -e WORDPRESS_DB_NAME=wordpress --name wordpress -p 8000:80 wordpress:latest
```

* docker-compose 이용

```sh
$ docker-compose up
```

## 네트워크 정리

* cli 이용

```sh
$ ./clean.sh
```

* docker-compose 이용

```sh
$ docker-compose down
```