BASE_PATH=$(
  cd "$(dirname "$0")"
  pwd
)
HOME_PATH="$HOME"

URL=http://192.168.131.36:8088/repository/releases/
repositoryId=releases
version=3.5.2

gradle clean build -x test


mvn deploy:deploy-file -Dpackaging=jar -DgroupId=cn.bjca.footstone -DartifactId=mybatis-plus-annotation -Dversion="$version" -DpomFile="$HOME_PATH/mybatis-plus-annotation/build/publications/mavenJava/pom-default.xml" -Dfile="$HOME_PATH/mybatis-plus-annotation/build/libs/mybatis-plus-annotation-3.5.2.jar" -Durl="$URL" -DrepositoryId="$repositoryId"

mvn deploy:deploy-file -Dpackaging=jar -DgroupId=cn.bjca.footstone -DartifactId=mybatis-plus-core -Dversion="$version" -DpomFile="$HOME_PATH/mybatis-plus-core/build/publications/mavenJava/pom-default.xml" -Dfile="$HOME_PATH/mybatis-plus-core/build/libs/mybatis-plus-core-3.5.2.jar"  -Durl="$URL" -DrepositoryId="$repositoryId"
