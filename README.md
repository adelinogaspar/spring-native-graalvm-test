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
```
