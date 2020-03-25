FROM mcr.microsoft.com/dotnet/core/sdk:3.1 as microsoft-sdk
RUN mkdir /home/postgres 
RUN useradd postgres 
RUN chown -R postgres:postgres /home/postgres
COPY sandbox.csproj /src/
COPY *.cs /src/
WORKDIR /src/
RUN ["dotnet", "build"]
CMD [ "su", "-", "postgres", "-c", "cd", "/src" ,"&&", "dotnet", "test" ]