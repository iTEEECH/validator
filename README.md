# Validator

## Summary
- 🚀 Platforms
- 📃 Description
- ⚙️ Setup
- 💻 Use case

## Platforms
| Android | iOS | Web |
|:-------:|:---:|:---:|
|    ✅    |  ✅  |  ✅   |

## Description

This package provides a set of commonly used validation functions for form fields in Flutter applications.

## Setup

Add in this file ```pubspec.yaml```.

```yaml
  validator:
    git:
      url: git@github.com:iTEEECH/validator.git
      ref: main
```

## Use case

**Import**

```dart
import 'package:validator/validator.dart';
```

**Code**

```dart
final validators = MultiValidator<String>([
  RequiredValidator(errorText: 'Required.'),
  EmailValidator(errorText: 'Wrong email format.')
]);
````
