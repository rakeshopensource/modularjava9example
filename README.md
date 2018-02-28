# modularjava9example

This demonstrates modules and custom jre creation in JAVA 9.

#### create directory to hold modules
````
$ mkdir -p output/mlib
````

#### compile hello module and make hello.jar
```
$ javac -p output/mlib -d output/classes `find com.hello -name *.java`
$ jar -c -f output/mlib/hello.jar  -C output/classes .
$ /bin/rm -rf output/classes

````

#### compile helloclient module using hello module and make helloclient.jar
```
$ javac -p output/mlib -d output/classes `find com.hello.client -name *.java`
$ jar -c -f output/mlib/helloclient.jar --main-class com.hello.client.HelloClient -C output/classes .
$ /bin/rm -rf output/classes
```


#### program execution
```
$ java -p output/mlib -m com.hello.client/com.hello.client.HelloClient
```


#### Create custom JRE
```
$ /bin/rm -rf helloclientimage/
jlink --module-path /Library/Java/JavaVirtualMachines/jdk-9.0.4.jdk/Contents/Home/jmods:output/mlib --add-modules com.hello --add-modules com.hello.client --output helloclientimage --launcher=helloclient=com.hello.client
```
#### list custom jre modules 
```
$ ./helloclientimage/bin/java --list-modules
```

#### custom jre exection
```
$ ./helloclientimage/bin/java -m com.hello.client

```

