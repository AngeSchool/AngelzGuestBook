# Build stage
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /app
ENV LANG sv_SE.UTF-8
ENV LC_ALL sv_SE.UTF-8
COPY . ./
RUN dotnet restore "GuestBookApp.csproj"
RUN dotnet publish "GuestBookApp.csproj" -c Release -o /publish

# Runtime stage
FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS runtime
WORKDIR /app
ENV LANG sv_SE.UTF-8
ENV LC_ALL sv_SE.UTF-8
COPY --from=build /publish .
ENV ASPNETCORE_URLS=http://+:80
EXPOSE 80
ENTRYPOINT ["dotnet", "AngelinasGuestbook.dll"]