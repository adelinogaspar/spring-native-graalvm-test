./pack build teste-java-17-graalvm \
--builder paketobuildpacks/builder:tiny \
--env BP_NATIVE_IMAGE=true \
--env BP_JAVA_VERSION=17 \
--env BP_NATIVE_IMAGE_BUILD_ARGUMENTS="--no-fallback" 
--verbose

#--buildpack paketo-buildpacks/bellsoft-liberica \
#--buildpack paketo-buildpacks/java-native-image \
