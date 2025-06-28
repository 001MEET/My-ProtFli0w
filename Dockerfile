# Use official .NET SDK image to build the app
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /app

# Copy project files and restore
COPY *.csproj ./
RUN dotnet restore

# Copy the rest of the source
COPY . ./
RUN dotnet publish -c Release -o out

# Use ASP.NET runtime to run the app
FROM mcr.microsoft.com/dotnet/aspnet:8.0
WORKDIR /app
COPY --from=build /app/out .

EXPOSE 80
ENTRYPOINT ["dotnet", "My_ProtFli0w.dll"]
