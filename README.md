# graalvm simple test

```bash
# para o guest additions
dnf install gcc
dnf install kernel-devel
dnf update kernel kernel-headers
dnf install -y kernel-devel kernel-headers gcc make perl elfutils-libelf-devel
reboot now

# para buildar a app java
sudo ln -sf /run/user/$(id -u)/podman/podman.sock /var/run/docker.sock
systemctl --user restart podman.socket

mvn spring-boot:build-image -Pnative

docker rm teste
docker run --name teste -p 8080:8080 spring-boot-native-hello:0.0.1-SNAPSHOT 

docker run --name teste -e "JAVA_TOOL_OPTIONS=-Ddebug" -p 8080:8080 spring-boot-native-hello:0.0.1-SNAPSHOT

docker run --name teste -p 8080:8080 teste-java-17-graalvm:latest

# para rodar o link simbolico sem senha...

sudo visudo

# adicionar a linha abaixo:
gaspar ALL=(root) NOPASSWD: /usr/bin/ln -sf /run/user/[0-9]*/podman/podman.sock /var/run/docker.sock
gaspar ALL=(root) NOPASSWD: /usr/bin/mkdir -p /run/user/[0-9]*/podman/
gaspar ALL=(root) NOPASSWD: /usr/bin/touch /run/user/[0-9]*/podman/podman.sock 
```

pack build paketo-demo-app --builder paketobuildpacks/builder-jammy-base

pack inspect-image my-app-image

https://github.com/paketo-buildpacks/samples/tree/main/java/maven

https://paketo.io/docs/