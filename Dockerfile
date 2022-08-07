FROM debian:bullseye-slim as build

WORKDIR /download

RUN apt-get update
RUN apt-get install wget unzip -y
RUN wget https://aka.ms/sqlpackage-linux 
RUN unzip sqlpackage-linux
RUN rm -f sqlpackage-linux


FROM debian:bullseye-slim as run

WORKDIR /sqlpackage

COPY --from=build /download ./
RUN chmod +x ./sqlpackage

RUN apt-get update
RUN apt-get install libicu-dev -y

CMD [ "/bin/bash" ]