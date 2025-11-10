# Build stage
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src

# Copy csproj and restore
COPY GuestBookApp/GuestBookApp.csproj GuestBookApp/
WORKDIR /src/GuestBookApp
RUN dotnet restore "GuestBookApp.csproj"

# Copy rest and publish
COPY . .
RUN dotnet publish "GuestBookApp.csproj" -c Release -o /app/publish

# Runtime stage
FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS runtime
WORKDIR /app
COPY --from=build /app/publish .
ENV ASPNETCORE_URLS=http://+:80
EXPOSE 80

ENTRYPOINT ["dotnet", "GuestBookApp.dll"]