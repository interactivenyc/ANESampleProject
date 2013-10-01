ANESampleProject
================
This project was created in conjunction with this tutorial:
http://www.adobe.com/devnet/air/articles/ane-android-devices.html

This is a work in progress to create an ANE that facilitates the sending of an intent from an Android Native App to and AIR Android App. Any help or feedback would be immensely appreciated!

You can email me at steve@speakaboos.com.

================
Project Info
================

ANESampleSWC is an ActionScript Library Project, and creates the SWC interface for the ANE

ANESampleJava is the Java code for the ANE. ANESampleContext is the ANE interface on the Java side. SendIntentActivity.java is the Activity meant to receive the intent from the TEST_AndroidNative app.

ANESampleBuild is the project that builds the ANE from ANESampleSWC and ANESampleJava. There is a shell script called buildANE.sh that does the work. You must open that file in a text editor and set the two variables at the top to be appropriate for your project setup.

TEST_AndroidNative is the app that sends the intent to the TEST_AndroidAIR app. The only button that is set up to work at the moment is the [ EXPLICIT Intent ] button. It calls a function in MainActivity.java called sendExplicitIntent.

TEST_AndroidAIR is the AIR app that receives the intent. It must have the swc libraries in the libs folder included, as well as the ANE in the libs_ane folder. Currently it displays some traces in a log window and has a button that's not doing anything right now. When the intent is received, I would like it to display the data in the log window.

