# launch_at_login

After installing `launch_at_login` by adding to the pubspec.yaml and running `flutter pub get -v`

It will return the path of the `launch_at_login` lib (something like: `~/.pub-cache/hosted/pub.dartlang.org/launch_at_login-0.0.3/lib/`) in which there will be an assets folder with a file called `copy-login-helper.sh`.

Add to your `macos` Xcode project in the `Build Phases` -> `Run Script`:
```
/bin/sh ~/.pub-cache/hosted/pub.dartlang.org/launch_at_login-0.0.3/lib/assets/copy-login-helper.sh
```
this builds the helper app to launch your MacOS app on login.

Then you can run:
```
$ flutter run -d macos
```
