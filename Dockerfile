FROM mcr.microsoft.com/dotnet/sdk:6.0

RUN apt-get update && apt-get install unzip -y

RUN mkdir sqlpackage

# Install SQLPackage for Linux and make it executable
RUN wget -progress=bar:force -q -O sqlpackage.zip https://aka.ms/sqlpackage-linux \
    && unzip -qq sqlpackage.zip -d /opt/sqlpackage \
    && chmod +x /opt/sqlpackage/sqlpackage