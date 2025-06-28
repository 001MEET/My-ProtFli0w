# ---------------- BUILD STAGE ----------------
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src

# Copy only the .csproj file and restore dependencies
COPY My_ProtFli0w.csproj ./
RUN dotnet restore ./My_ProtFli0w.csproj

# Copy everything and publish the app
COPY /root-folder .
WORKDIR /src/My_ProtFli0w
RUN dotnet publish -c Release -o /app/publish

# ---------------- RUNTIME STAGE ----------------
FROM mcr.microsoft.com/dotnet/aspnet:8.0
WORKDIR /app
COPY --from=build /app/publish .

EXPOSE 80
ENTRYPOINT ["dotnet", "My_ProtFli0w.dll"]

# Build the Docker image
# Command to build the image: docker build -t myapp .