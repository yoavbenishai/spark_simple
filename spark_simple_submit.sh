export SPARK_HOME=~/apps/spark-3.5.0-bin-hadoop3
export PATH=$PATH:$SPARK_HOME/bin
K8S_SERVER=$(kubectl config view -o jsonpath='{.clusters[?(@.name == "colima")].cluster.server}')
export K8S_SERVER
export POD_NAME=spark-simple
export IMAGE_NAME=$POD_NAME:0.0.1

spark-submit \
  --master=k8s://$K8S_SERVER \
  --deploy-mode cluster \
  --name $POD_NAME \
  --conf spark.kubernetes.container.image=$IMAGE_NAME \
  --conf spark.kubernetes.authenticate.driver.serviceAccountName=spark \
  local:///app/spark_simple.py