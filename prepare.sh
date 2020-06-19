cd src
javac Example.java
jar cmf META-INF/MANIFEST.MF ../target/example.jar Example.class
cd ..
jpackage --input target/ --name example  --main-jar example.jar --type dmg
open example-1.0.dmg
cp -r /Volumes/example/example.app .
ln -s example.app/Contents/MacOS/example example