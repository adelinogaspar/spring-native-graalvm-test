# graalvm simple test

```bash
mvn spring-boot:build-image -Pnative

docker rm teste
docker run --name teste -p 8080:8080 spring-boot-native-hello:0.0.1-SNAPSHOT 

docker run --name teste -e "JAVA_TOOL_OPTIONS=-Ddebug" -p 8080:8080 spring-boot-native-hello:0.0.1-SNAPSHOT
```

mvn spring-boot:build-image \
-Dspring-boot.build-image.pullPolicy=always \
-Dspring-boot.build-image.verbose=true