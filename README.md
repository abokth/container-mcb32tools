# container-mcb32tools
Container based build of mcb32tools

Images can be found at https://quay.io/repository/abokth/mcb32tools

To extract the tarball containing the binary, use podman and buildah:

```bash
podman pull quay.io/abokth/mcb32tools:latest
cd $(mktemp -d)
container=$(buildah from quay.io/abokth/mcb32tools:latest)
buildah unshare bash -c 'mnt=$(buildah mount '"$container"'); cp $mnt/opt/mcb32tools-bin-2.2.tar.gz .; buildah umount '"$container"
buildah rm $container
```
