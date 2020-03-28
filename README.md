# Bazel ECR Example

```
docker build -t bazel-ecr .

docker run \
  -e DOCKER_REGISTRY='' \
  -e AWS_ACCESS_KEY_ID='' \
  -e AWS_SECRET_ACCESS_KEY='' \
  bazel-ecr run --workspace_status_command ./scripts/workspace_status.sh :push_test
```
