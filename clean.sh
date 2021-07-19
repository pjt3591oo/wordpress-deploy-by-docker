 docker stop $(docker ps -qa)
 docker rm $(docker ps -qa)

 rm -rf mysql
 rm -rf html

 docker volume prune
 docker network prune