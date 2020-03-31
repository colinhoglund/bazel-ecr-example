# drone-bazelisk-ecr

Build Image and push to a docker registry
```
docker build -t drone-bazelisk-ecr .
```

Setup a secrets file for `drone exec` in _example/secrets.env_
```
ecr_registry=
ecr_access_key=
ecr_secret_key=
```

```
cd example/
drone exec --secret-file secrets.env
```

## Useful Links

- [Amazon ECR Docker Credential Helper](https://github.com/awslabs/amazon-ecr-credential-helper)
- [bazelisk](https://github.com/bazelbuild/bazelisk)
- [Bazel Docker Rules](https://github.com/bazelbuild/rules_docker)
