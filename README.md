# xtrip_mobile

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

Configuration for development enviroment

```
{
            "name": "xtrip_mobile",
            "request": "launch",
            "type": "dart",
            "toolArgs": [
                "--dart-define",
                "APP_SSL=true", // set to false if not use http
                "--dart-define",
                "API_URL=d249-42-113-144-191.ap.ngrok.io" // we should change to local api
            ]
        },
```

build for staging enviroment
```
flutter run --dart-define=API_URL=xtrip-staging.atastay.com
```
