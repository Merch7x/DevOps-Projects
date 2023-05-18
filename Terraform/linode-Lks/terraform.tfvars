label = "istio-cluster"
k8s_version = "1.26"
region = "eu-west"
pools = [
  {
    type : "g6-standard-2"
    count : 2
  }
]