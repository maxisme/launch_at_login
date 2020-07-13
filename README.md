# launch_at_login

After installing `launch_at_login` by adding to the pubspec.yaml and running `flutter pub get -v`

It will return the path of this lib in which there will be an assets folder with a file called `copy-login-helper.sh`.

Add to your MacOS project in the `Run Scripts` the path of this file like:
```
/bin/sh ~/launch_at_login/lib/assets/copy-login-helper.sh
```

