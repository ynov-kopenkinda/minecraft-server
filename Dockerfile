FROM ubuntu:latest

# Install Java
RUN apt-get update && apt-get install -y openjdk-19-jre-headless

# Install Minecraft Server
RUN mkdir /minecraft
WORKDIR /minecraft

COPY spigot.jar /minecraft/spigot.jar
COPY start.sh /minecraft/start.sh

RUN chmod +x /minecraft/start.sh
RUN /bin/sh /minecraft/start.sh

RUN echo "eula=true" > /minecraft/eula.txt
COPY authme-plugin.jar /minecraft/plugins/authme-plugin.jar
COPY GSit-1.4.1.jar /minecraft/plugins/GSit-1.4.1.jar
COPY worldedit-bukkit-7.2.14.jar /minecraft/plugins/worldedit-bukkit-7.2.14.jar
COPY CustomStructures-1.9.0.1.jar /minecraft/plugins/CustomStructures-1.9.0.1.jar

EXPOSE 25565

CMD ["/bin/sh", "/minecraft/start.sh"]