# massiveinfinity-fastlane-android

This is a Docker image currently being used to build the mobile Android versions.

The image is preinstalled with Ruby and other tools for support of

- Java
- Fastlane
- Firebase App Distribution via Firebase Tools

## Build

```
docker build -t mi-fastlane-android .
```

## Testing locally

Use the command below to remotely login to the image

```
docker run -it -u root mi-fastlane-android sh
```

## Deploy

(Work in progress)
