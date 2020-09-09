# Docker setting tutorial

## Change storage backend

### Halt your container
```bash
docker stop <container_name>
```

### Commit and save your old Docker containers/images
```bash
docker ps -a
# for each container you care for, stop and then commit it
docker commit e198aac7112d export/local_discourse_app 
```
`docker save <image_name> -o <image_name>.tar.gz
`

### Change Docker storage location
Add `"data-root": "<new storage location>"` into `/etc/docker/daemon.json`.

Example
```bash
sudo /etc/docker/daemon.json

{
    "default-runtime": "nvidia",
    "runtimes": {
        "nvidia": {
            "path": "nvidia-container-runtime",
            "runtimeArgs": []
        }
    },
    "data-root": "<new storage location>"
}
```

### Load old image
```bash
docker load -i <image_name>
```