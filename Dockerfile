# ---------------- BUILD STAGE ----------------
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src

# Copy and restore
COPY MeetPortfolio.csproj ./
RUN dotnet restore MeetPortfolio.csproj

# Copy rest of the source and publish
COPY . ./
RUN dotnet publish MeetPortfolio.csproj -c Release -o /app/publish

# ---------------- RUNTIME STAGE ----------------
FROM mcr.microsoft.com/dotnet/aspnet:8.0
WORKDIR /app
COPY --from=build /app/publish .

EXPOSE 80
ENTRYPOINT ["dotnet", "MeetPortfolio.dll"]
