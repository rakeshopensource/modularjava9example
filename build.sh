export JAVA_HOME=$(/usr/libexec/java_home -v 9)
export PATH="$JAVA_HOME/bin:$PATH"

/bin/rm -rf output

mkdir -p output/mlib


javac -p output/mlib -d output/classes `find com.hello -name *.java`
jar -c -f output/mlib/hello.jar  -C output/classes .
/bin/rm -rf output/classes

jar -f output/mlib/hello.jar -d


javac -p output/mlib -d output/classes `find com.hello.client -name *.java`
jar -c -f output/mlib/helloclient.jar --main-class com.hello.client.HelloClient -C output/classes .
/bin/rm -rf output/classes


#java -p output/mlib -m com.hello.client.HelloClient
java -p output/mlib -m com.hello.client/com.hello.client.HelloClient


/bin/rm -rf helloclientimage/
jlink --module-path /Library/Java/JavaVirtualMachines/jdk-9.0.4.jdk/Contents/Home/jmods:output/mlib --add-modules com.hello --add-modules com.hello.client --output helloclientimage --launcher=helloclient=com.hello.client

./helloclientimage/bin/java --list-modules
./helloclientimage/bin/java -m com.hello.client
./helloclientimage/bin/helloclient

