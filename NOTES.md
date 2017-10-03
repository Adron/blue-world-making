Had to kill previous Minikube port usage/running. Even after stopping the service. Realized I needed to setup multi-use accounts for each of the kuby clusters for the repo.

However, for killing old port usage.

netstat -vanp tcp | grep 8001
lsof -i tcp:8001
kill -9 <pid>


