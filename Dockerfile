# Stage 1 - BUILD
FROM mcr.microsoft.com/dotnet/framework/sdk:4.8 AS build
WORKDIR /app
COPY . .
RUN nuget restore
WORKDIR /app/ProductLaunch.Web
RUN msbuild

# Stage 2 - RUNTIME
FROM mcr.microsoft.com/dotnet/framework/aspnet:4.8 AS runtime
WORKDIR /inetpub/wwwroot
COPY --from=build /app/ProductLaunch.Web/. ./