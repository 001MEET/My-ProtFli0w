# 🔧 Build stage
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /app

# Copy the project file and restore
COPY My_ProtFli0w.csproj ./
RUN dotnet restore My_ProtFli0w.csproj

# Copy the entire source and publish the project
COPY . ./
RUN dotnet publish My_ProtFli0w.csproj -c Release -o /app/publish

# 🚀 Runtime stage
FROM mcr.microsoft.com/dotnet/aspnet:8.0
WORKDIR /app
COPY --from=build /app/publish .

EXPOSE 80
ENTRYPOINT ["dotnet", "My_ProtFli0w.dll"]
