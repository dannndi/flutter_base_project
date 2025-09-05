# Base Project
Flutter Base Project

---

## Getting Started
Clone using copy_template
```sh
dart pub global activate copy_template
copy_template <project_name> https://github.com/dannndi/flutter_base_project <path>
```

or 

```sh
dart pub global activate copy_template
copy_template 
```

Simply run for initial setup
```sh
./script/setup.sh
```

Rename / Change (Manually)
1. all remaining "com.example.base_project" to "your.bundle.id"
2. all "base_project" to your "package_name"

---

## Script
Getting started
```sh
./script/setup.sh
```
Simple build runner
```sh
./script/build_runner.sh
```
Create module
```sh
./script/create_module.sh
```
Generate translation
```sh
./script/gen_translate.sh
```
---
## Feature

### 1. App Event Broadcaster
`AppEventBroadcaster` allows you to **broadcast events across your app**, from any page, widget, or function, and listen to them anywhere.

#### Example usage:
##### Push Event
```dart
AppEventBroadcaster.I.push(MyEvent());
```
##### Listen Event
```dart
final sub = AppEventBroadcaster.I.listen((event) {
  print('Received event: $event');
});

// Later, cancel when done
sub.cancel();
```

### 2. Safe API Call
`handleRequest` allows you to **call APIs safely**, automatically handling network errors and returning a `FutureResult<T>` (`Either<Failure, T>`).

**Note:** The API response JSON must follow this format:

```json
{
  "status": 200,
  "message": "Success",
  "payload": { /* your data here, e.g., object or list */ }
}
```

#### Example usage:
```dart
// Call API
final result = await handleRequest(
  execute: () async => apiService.getBanners(),
);

// Handle result
result.fold(
  (failure) => print('Error: ${failure.message}'),
  (banners) => print('Got ${banners.length} banners'),
);
````