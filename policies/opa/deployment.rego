package main

deny[msg] {
  input.kind == "Deployment"
  input.spec.template.spec.containers[_].image
  endswith(input.spec.template.spec.containers[_].image, ":latest")
  msg := "container images must not use the ':latest' tag"
}

deny[msg] {
  input.kind == "Deployment"
  container := input.spec.template.spec.containers[_]
  not container.resources.limits
  msg := sprintf("container '%s' must define resource limits", [container.name])
}

deny[msg] {
  input.kind == "Deployment"
  container := input.spec.template.spec.containers[_]
  container.securityContext.privileged == true
  msg := sprintf("container '%s' must not run as privileged", [container.name])
}
