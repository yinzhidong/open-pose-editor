# first time, build image and run it, next time just docker run
docker build -t echo/ai:open-pose-ui .

# -d: A flag that runs the container in detached mode, meaning it will run in the background without tying up the terminal.
# -p 2222:1111: The -p flag is used to map a host port (2222) to a container port (1111). This allows you to access the application running inside the container on port 1111 through port 2222 on the host machine.
# second time, just run below, image will be pulled, then go to http://localhost:2222

# docker push weialexchen/dashboardui:main-dashboard
# docker run --name openpose-ui -dp 3100:3000 echo/ai:open-pose-ui


# docker swarm
# docker service create -dp 3000:3000 \
#     --name openpose-ui \
#     --replicas 4 \
#     echo/ai:open-pose-ui