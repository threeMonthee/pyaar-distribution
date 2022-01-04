FROM skywalking-agent:8.9.0

WORKDIR /app

ENV JVM_OPTIONS="-Xmx1024m -Xms1024m -Xmn384m"

COPY build/libs/pyaar-service-user-1.2.0.jar app.jar

ENTRYPOINT java $JVM_OPTIONS -javaagent:/skywalking-agent/skywalking-agent.jar -Dskywalking.agent.service_name=pyaar-service-user -Dskywalking.collector.backend_service=127.0.0.1:11800 -Dnacos.config.addr=192.168.0.1:8848 -Dnacos.config.namespace=pyaar-pro -Dnacos.config.group=pyaar -jar app.jar