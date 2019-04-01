bash stop.sh

docker build -t load-balance-nginx  .
docker run -p 9090:80 -d --name nginx load-balance-nginx

num=9091+$n

for (( i=9091; i<num; i++ ))
do
docker run -dt -p $i:80 --cpus="0.25" --memory="128m" --memory-swap="128m" --name do1819-03-api$i migcassan1/do1819-03
done

docker logs nginx --follow