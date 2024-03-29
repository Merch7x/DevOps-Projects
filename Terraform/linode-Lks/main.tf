resource "linode_lke_cluster" "dev" {
    k8s_version = var.k8s_version
    label = var.label
    region = var.region
    tags = var.tags

    dynamic "pool" {
        for_each = var.pools
        content {
            type  = pool.value["type"]
            count = pool.value["count"]
        }
    }
}

# resource "linode_lke_cluster" "second-cluster" {
#     k8s_version = var.k8s_version
#     label = var.label
#     region = var.region
#     tags = var.tags

#     dynamic "pool" {
#         for_each = var.pools
#         content {
#             type  = pool.value["type"]
#             count = pool.value["count"]
#         }
#     }
# }


