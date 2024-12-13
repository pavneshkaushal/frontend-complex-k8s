docker build -t panak4572/frontend-complex-k8s-client:latest -t panak4572/frontend-complex-k8s-client:$SHA -f ./client/Dockerfile ./client
docker build -t panak4572/frontend-complex-k8s-server:latest -t panak4572/frontend-complex-k8s-server:$SHA -f ./server/Dockerfile ./server
docker build -t panak4572/frontend-complex-k8s-worker:latest -t panak4572/frontend-complex-k8s-worker:$SHA -f ./worker/Dockerfile ./worker

docker push panak4572/frontend-complex-k8s-client:latest
docker push panak4572/frontend-complex-k8s-server:latest
docker push panak4572/frontend-complex-k8s-worker:latest

docker push panak4572/frontend-complex-k8s-client:$SHA
docker push panak4572/frontend-complex-k8s-server:$SHA
docker push panak4572/frontend-complex-k8s-worker:$SHA

kubectl apply -f k8s
kubectl set image deployments/server-deployment server=panak4572/multi-server-k8s:$SHA
kubectl set image deployments/client-deployment client=panak4572/multi-client-k8s:$SHA
kubectl set image deployments/worker-deployment worker=panak4572/multi-worker-k8s:$SHA


