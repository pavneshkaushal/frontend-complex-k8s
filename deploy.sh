docker build -t panak4572/frontend-complex-k8s-client:latest -t panak4572/frontend-complex-k8s-client:$SHA -f ./client/Dockerfile ./client
docker build -t panak4572/frontend-complex-k8s-server:latest -t panak4572/frontend-complex-k8s-server:$SHA -f ./server/Dockerfile ./server
docker build -t panak4572/frontend-complex-k8s-worker:latest -t panak4572/frontend-complex-k8s-worker:$SHA -f ./worker/Dockerfile ./worker

docker push panak4572/frontend-complex-k8s-client:latest
docker push panak4572/frontend-complex-k8s-server:latest
docker push panak4572/frontend-complex-k8s-worker:latest
docker push panak4572/frontend-complex-k8s-client:$SHA
docker push panak4572/frontend-complex-k8s-server:$SHA
docker push panak4572/frontend-complex-k8s-worker:$SHA

kuberctl apply -f k8s

kubectl set image deployments/client-deployments/client client=panak4572/frontend-complex-k8s-client:$SHA
kubectl set image deployments/server-deployments/server server=panak4572/frontend-complex-k8s-server:$SHA
kubectl set image deployments/worker-deployments/worker worker=panak4572/frontend-complex-k8s-worker:$SHA
