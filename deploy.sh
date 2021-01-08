docker build -t epjjk/multi-client:latest -t epjjk/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t epjjk/multi-server:latest -t epjjk/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t epjjk/multi-worker:latest -t epjjk/multi-worker:$SHA -f ./worker/Dockerfile ./worker

docker push epjjk/multi-client:latest
docker push epjjk/multi-server:latest
docker push epjjk/multi-worker:latest
docker push epjjk/multi-client:$SHA
docker push epjjk/multi-server:$SHA
docker push epjjk/multi-worker:$SHA

kubectl apply -f k8s

kubectl set image deployments/client-deployments client=epjjk/multi-client:$SHA
kubectl set image deployments/server-deployments server=epjjk/multi-server:$SHA
kubectl set image deployments/worker-deployments worker=epjjk/multi-worker:$SHA
