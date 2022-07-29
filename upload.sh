#


BASE_PATH=$(
  cd "$(dirname "$0")"
  pwd
)


cd $BASE_PATH

# 1 build
gradle clean build -x test

# 2 upload
URL=http://192.168.131.36:8088/repository/releases/
repositoryId=releases


projectVersion=`cat build.gradle|grep "version = "|sed 's/version//'|sed 's/=//'|sed 's/"//g'|sed 's/[[:space:]]//g'`
releaseVersion=`echo $projectVersion|sed 's/-SNAPSHOT//;'`

echo "$projectVersion"
echo "$releaseVersion"

if [ "$projectVersion" != "$version" ]; then
  URL=http://192.168.131.36:8088/repository/snapshots/
  repositoryId=snapshots
fi


version=$projectVersion



artifactId=mybatis-plus-annotation
mvn deploy:deploy-file -Dpackaging=jar -DgroupId=cn.bjca.footstone -DartifactId="$artifactId" -Dversion="$version" -DpomFile="$BASE_PATH/$artifactId/build/publications/mavenJava/pom-default.xml" -Dfile="$BASE_PATH/$artifactId/build/libs/$artifactId-$version.jar" -Durl="$URL" -DrepositoryId="$repositoryId"
artifactId=mybatis-plus-core
mvn deploy:deploy-file -Dpackaging=jar -DgroupId=cn.bjca.footstone -DartifactId="$artifactId" -Dversion="$version" -DpomFile="$BASE_PATH/$artifactId/build/publications/mavenJava/pom-default.xml" -Dfile="$BASE_PATH/$artifactId/build/libs/$artifactId-$version.jar" -Durl="$URL" -DrepositoryId="$repositoryId"
