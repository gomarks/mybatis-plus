BASE_PATH=$(
  cd "$(dirname "$0")"
  pwd
)

# URL=http://192.168.131.36:8088/repository/releases/
URL=http://192.168.131.36:8088/repository/snapshots/
# repositoryId=releases
repositoryId=snapshots
version=3.5.2-SNAPSHOT

gradle clean build -x test

artifactId=mybatis-plus-annotation
mvn deploy:deploy-file -Dpackaging=jar -DgroupId=cn.bjca.footstone -DartifactId="$artifactId" -Dversion="$version" -DpomFile="$BASE_PATH/$artifactId/build/publications/mavenJava/pom-default.xml" -Dfile="$BASE_PATH/$artifactId/build/libs/$artifactId-$version.jar" -Durl="$URL" -DrepositoryId="$repositoryId"
artifactId=mybatis-plus-core
mvn deploy:deploy-file -Dpackaging=jar -DgroupId=cn.bjca.footstone -DartifactId="$artifactId" -Dversion="$version" -DpomFile="$BASE_PATH/$artifactId/build/publications/mavenJava/pom-default.xml" -Dfile="$BASE_PATH/$artifactId/build/libs/$artifactId-$version.jar" -Durl="$URL" -DrepositoryId="$repositoryId"
