       vim data.sql
   93  docker build -t img:v2 .
   94  pwd
   95  vim Dockerfile
   96  docker build -t img:v2 .
   97  vim Dockerfile
   98  docker build -t img:v2 .
   99  docker run -d --name cont2 --mount src=mydata,destination=/var/lib/mysql img:v2
  100  docker exec -it cont2 bash
  101  cd myapp
  102  vim Dockerfile
  103  docker build -t img:v3 .
  104  docker volume create infodb
  105  docker run -d --name cont6 -p 1113:3306 --mount src=infodb,destination=/var/lib/mysql img:v3
  106  docker exec -it cont6 bash
  107  docker run -d --name cont7 -p 1112:3306 --mount src=infodb,destination=/var/lib/mysql img:v3
  108  docker run -d --name cont8 -p 1114:3306 --mount src=infodb,destination=/var/lib/mysql img:v3
  109  cd /var/lib/docker/volumes
  110  ll
  111  cd infodb
  112  ls
  113  cd _data
  114  ls
  115  ll
  116  cd tfi_heroes
  117  ll
  118  vim heroes.frm
  119  vim heroes.ibd
  120  cd
  121  cd myapp
  122  docker exec -it cont5 bash
  123  docker ps
  124* docker run -itd --name cont7 -p 1115:3306 --mount src=infodb,destination=/var/lib/mysql img:v3
  125  docker ps
  126  docker ps -a
  127  docker rm $(docker ps -a)
  128  docker ps -a
  129  docker exec -it 
  130  docker ps -a
  131  docker run -itd --name cont2 ubuntu
  132  docker run -itd --name cont3 --mount src=infodb,destination=/src/lib/mysql ubuntu
  133  docker run -itd --name cont4 --mount src=infodb,destination=/src/lib/mysql ubuntu
  134  docker ps -a
  135  docker exec -it cont8 bash
  136  docker exec -it cont2 bash
  137  docker exec -it cont3 bash
  138  docker exec -it cont8 bash
  139  docker exec -it cont3 bash
  140  ls
  141  vim data.sql
  142  vim Dockerfile
