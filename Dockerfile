FROM mcr.microsoft.com/dotnet/core/sdk:3.1 as microsoft-sdk
RUN mkdir /home/postgres 
COPY sandbox.csproj /src/
COPY *.cs /src/
WORKDIR /src/
RUN ["dotnet", "build"]
RUN useradd -u 8877 postgres && chown -R postgres:postgres /home/postgres /src/* /tmp/NuGetScratch/*
USER postgres
CMD [ "dotnet", "test" ]