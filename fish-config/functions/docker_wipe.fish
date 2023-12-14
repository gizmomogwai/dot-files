function docker_wipe -d "wiping docker containers and images"
  docker ps -q --all | xargs docker rm
  docker images -q --all | xargs docker rmi -f
  docker volume ls | awk '{print $2}' | xargs docker volume rm
  rm -rf ~/Library/Containers/com.docker.docker/Data/*
end
