# Build stage
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src

# Copy csproj and restore
COPY ["GuestBookApp.csproj", "./"]
RUN dotnet restore "GuestBookApp.csproj"

# Copy rest and publish
COPY . .
RUN dotnet publish "GuestBookApp.csproj" -c Release -o /app/publish /p:UseAppHost=false

# Runtime image
FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS runtime
WORKDIR /app
COPY --from=build /app/publish .
ENV ASPNETCORE_URLS=http://+:80
EXPOSE 80

# Use the ENTRYPOINT you requested
ENTRYPOINT ["dotnet", "GuestBookApp.dll"].dll"]