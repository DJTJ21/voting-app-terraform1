resource "kubernetes_service" "nodeport" {
  for_each = var.nodePort

  metadata {
    labels = {
      app = each.key
    }
    name = each.key
  }

  spec {
    type = "NodePort"
    
    port {
      name       = each.value.service_name
      port       = each.value.port
      target_port = each.value.target_port
      node_port = each.value.nodeport
    }

    selector = {
      app = each.key
    }
  }
}
