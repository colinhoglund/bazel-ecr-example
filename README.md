# Bazel ECR Example

```
docker build -t bazel-ecr .

docker run \
  -e DOCKER_REGISTRY='' \
  -e AWS_ACCESS_KEY_ID='' \
  -e AWS_SECRET_ACCESS_KEY='' \
  bazel-ecr run --workspace_status_command ./scripts/workspace_status.sh :push_test
```

Official Bazel Image
	- https://console.cloud.google.com/gcr/images/cloud-marketplace-containers/GLOBAL/google/bazel
	- https://github.com/bazelbuild/bazel/issues/4661#issuecomment-420033092

Using Bazel Image
	- https://docs.bazel.build/versions/2.0.0/bazel-container.html

Bazel Docker Rules
	- https://github.com/bazelbuild/rules_docker
