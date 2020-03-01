//
//  AppDelegate.h
//  Wash Your Hands
//
//  Created by Designerfuzzi on 29.02.20.
//  Copyright © by Designerfuzzi. All rights reserved.
//
/**
 
 Made this simple map-view app to show geolocations
 based on github:iceweasel1's csv data layout for german covid-19 cases,
 which he kindly created out of manually parsing german news reports the last days (end of feb2020).
 
 The csv-entrys are meant to express citys and countryside geolocations where people did or are struggeling
 with covid-19 pneumonia or are fighting / avoiding to become victims of the 2019/2020 Coronavirus infection.
 The longitude and latitute data is NOT expressing exact personal data of any kind, for obvious privacy reasons.
 The data expresses ONLY centerpoints of areas where help is needed and people fight the virus.
 This includes logicaly that the given data does not include any guarantee to be valid at all.
 It may only help you to remember that you should wash your hands much more often then usually of course.
 And if somehow possible help the people captured in their homes, please.
 At least dont stigmatise the victims - otherwise it may hit yourself the very next day and you may regret
 your thoughts. Take care.
 
 //https://www.ksta.de/panorama/newsblog-zum-coronavirus-polizei-stoppt-zug-in-nrw-wegen-virusverdacht-33802408
 //https://www.sueddeutsche.de/panorama/coronavirus-heinsberg-nrw-karneval-1.4826251
 //https://github.com/iceweasel1/COVID-19-Germany
 
 ps:
 When touching city-entrys from the pre-parsed master-list you may see debug messages like:
 "[VKDefault] TextureAtlasPage: Atlas page destroyed with outstanding references.: Assertion with expression - _textureRefs == 0 : Failed in file - /BuildRoot/Library/Caches/com.apple.xbs/Sources/VectorKit/VectorKit-1606.33.12.10.2/src/TextureAtlas.cpp line - 604"
 which is basicaly a vectorkit bug known in iOS13.
 if you found a solution to circumvent this logging,
 let me know or make a pull request for this repo
 */

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>


@end

