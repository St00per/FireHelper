# FireHelper
Pod is helping to move data documents around firebase

Installation

   1.Create New Firebase Project

   2.Select iOS App

   3.Add your App BundleID

 4.Receive GoogleService-Info.plist and add it to your xcode project

For more information about Firebase you can follow the next link:
https://www.youtube.com/watch?v=iMkifTEaefE&t=146s

5. Import FireHelper pod

6. Add to your AppDelegate class in launch option func two next lines:

FireHelper.default.configure() 

and 

FireHelper.default.setReference(collectionName: "YOUR COLLECTION NAME")

7. Now you can use FireHelper.default as a singleton in all of your project

For more FireHelper functionality, proceed to class public protocols and functions.


usage example: https://github.com/St00per/SettingsLoader
