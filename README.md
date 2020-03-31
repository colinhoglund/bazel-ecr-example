# Drone Bazel ECR

Build Image and push to a docker registry
```
docker build -t bazelisk-ecr .
```

Setup a secrets file for `drone exec` in _src/secrets.txt_
```
ecr_registry=
ecr_access_key=
ecr_secret_key=
```

```
cd src/
drone exec --secret-file secrets.txt
```

Official Bazel Image
- https://console.cloud.google.com/gcr/images/cloud-marketplace-containers/GLOBAL/google/bazel
- https://github.com/bazelbuild/bazel/issues/4661#issuecomment-420033092

Using Bazel Image
- https://docs.bazel.build/versions/2.0.0/bazel-container.html

Bazel Docker Rules
- https://github.com/bazelbuild/rules_docker
