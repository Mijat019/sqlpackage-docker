FROM alpine as build

WORKDIR /download

RUN apk add --no-cache  wget unzip
RUN wget https://aka.ms/sqlpackage-linux 
RUN unzip sqlpackage-linux
RUN rm -f sqlpackage-linux

FROM alpine as run

ENV DOTNET_SYSTEM_GLOBALIZATION_INVARIANT=1

WORKDIR /sqlpackage
COPY --from=build /download ./
RUN chmod +x ./sqlpackage
RUN apk add --no-cache libstdc++ gcompat

CMD [ "/bin/bash" ]