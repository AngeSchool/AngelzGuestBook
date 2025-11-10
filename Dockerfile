# Build stage
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /app
COPY ./GuestBookApp/GuestBookApp.csproj ./GuestBookApp/
WORKDIR /app/GuestBookApp
RUN dotnet restore "GuestBookApp.csproj"
COPY ./GuestBookApp/. ./
RUN dotnet publish "GuestBookApp.csproj" -c Release -o /publish

# Runtime stage
FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS runtime
WORKDIR /app
COPY --from=build /publish .
ENV ASPNETCORE_URLS=http://+:80
EXPOSE 80
ENTRYPOINT ["dotnet", "GuestBookApp.dll"]