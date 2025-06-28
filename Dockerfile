# Build stage
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /app

# Copy project files
COPY My_ProtFli0w/My_ProtFli0w.csproj ./My_ProtFli0w/
RUN dotnet restore My_ProtFli0w/My_ProtFli0w.csproj

# Copy everything and build
COPY . ./
RUN dotnet publish My_ProtFli0w/My_ProtFli0w.csproj -c Release -o /app/publish

# Runtime stage
FROM mcr.microsoft.com/dotnet/aspnet:8.0
WORKDIR /app
COPY --from=build /app/publish .

EXPOSE 80
ENTRYPOINT ["dotnet", "My_ProtFli0w.dll"]
