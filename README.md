Demo project that illustrates a problem with jpackage on macOS

Steps to reproduce:
1. Run `./prepare.sh` on macOS to build dmg
2. Run `example.app/Contents/MacOS/example` - program launches as expected
3. Run `./example` (symlink to the executable above) - program fails to launch:
```
2020-06-19 12:43:10.006 example[57638:6219480] Contents/MacOS/libapplauncher.dylib not found.
```

Setting `DYLD_LIBRARY_PATH=example.app/Contents/MacOS/` changes error to
```
2020-06-19 13:34:31.706 example[60238:6273511] example:No main class specified
2020-06-19 13:34:31.706 example[60238:6273511] example:Failed to launch JVM
```
This maybe a potential security problem as symlinked executable will try to load libraries from unexpected place.


#### JDK 15
JDK 15 gives another error:
```
Error opening "Contents/app/example.cfg" file: No such file or directory
```
