# 생성된 네트워크 영역에 wordpress 추가
# 같은 브릿지 네트워크에 포함해야 컨테이너 이름으로 통신가능
docker run -i -t -v $PWD/html:/var/www/html --net wordpressNetwork -e WORDPRESS_DB_HOST=db:3306 -e WORDPRESS_DB_USER=wordpress -e WORDPRESS_DB_PASSWORD=wordpress -e WORDPRESS_DB_NAME=wordpress --name wordpress -p 8000:80 wordpress:latest