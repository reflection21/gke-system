# Создаём namespace argocd
resource "kubernetes_namespace" "argocd" {
  metadata {
    name = "argocd"
  }
}

# Ставим ArgoCD через Helm
resource "helm_release" "argocd" {
  name       = "argocd"
  namespace  = kubernetes_namespace.argocd.metadata[0].name
  repository = "https://argoproj.github.io/argo-helm"
  chart      = "argo-cd"
  version    = "6.20.0"

  values = [
    file("${path.module}/values.yaml") # кастомные значения, например ingress, RBAC, resource limits
  ]

  depends_on = [kubernetes_namespace.argocd]
}
