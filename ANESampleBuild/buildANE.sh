adt="/Applications/Adobe Flash Builder 4.7/eclipse/plugins/com.adobe.flash.compiler_4.7.0.349722/AIRSDK/bin/adt"
nativedir="/Users/stevewarren/Clients/Speakaboos/git_repositories/ANESample_java"

echo "********************************************************************"
echo " - creating ANE package"

rm -rf Android-ARM/*
rm -f SampleASExtension.ane library.swf
mkdir -p Android-ARM

unzip ../ANESample/bin/ANESample.swc library.swf
cp library.swf Android-ARM
cp "$nativedir"/ANESample.jar Android-ARM
cp -r "$nativedir"/res Android-ARM

"$adt" -package -target ane SampleASExtension.ane extension.xml -swc ../ANESample/bin/ANESample.swc -platform Android-ARM -C Android-ARM .

#TO PACKAGE WITH CODE SIGNING
#"$adt" -package -storetype PKCS12 -keystore cer.p12 -storepass password -target ane SampleASExtension.ane extension.xml -swc ../ANESample/bin/ANESample.swc -platform Android-ARM -C Android-ARM .
