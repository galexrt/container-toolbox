# container-toolbox

A toolbox container for debugging and stuff in containers.

Container Image available from:

* [Quay.io](https://quay.io/repository/galexrt/container-toolbox)
* [GHCR.io](https://github.com/users/galexrt/packages/container/package/container-toolbox)

Container Image Tags:

* `main` - Latest build of the `main` branch.
* `vYYYYmmdd-HHMMSS-NNN` - Latest build of the application with date of the build.

## Why does this project exist?

To have one container image with all them utilities in it for debugging of "anything".

## How to run / use the container image?

Just spin it up using Docker, Kubernetes or any other thing that can run a container image.
Be sure to give the container at least `privileged` (and allow running as `root`) as otherwise most tools won't
make fun.

If you run it using something like Kubernetes, be sure to put something like `["sleep", "360000"]` as the command.

Besides that just `docker exec`, `kubectl exec` or whatever other execs there are into the container and use the
tools as you like.
