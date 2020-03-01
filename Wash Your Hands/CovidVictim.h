//
//  CovidItem.h
//  Wash Your Hands
//
//  Created by Designerfuzzi on 01.03.20.
//  Copyright © by Designerfuzzi. All rights reserved.
//

#import <Foundation/Foundation.h>
//#import <MapKit/MKGeometry.h>
//#import <MapKit/MKAnnotation.h>
#import <MapKit/MapKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, CovidStatus) {
    CovidStatusPatientNull = 0,
    CovidStatusQuarantaine,
    CovidStatusConfirmed,
    CovidStatusRecovered,
    CovidStatusDeath
};

@interface CovidVictim : NSObject <MKAnnotation>

- (instancetype)initWithDate:(NSDate*)date
                      State:(NSString*)state
                       City:(NSString*)city
                     Amount:(NSUInteger)amount
                     Gender:(NSUInteger)g
                  Longitude:(CLLocationDegrees)longitude
                   Latitude:(CLLocationDegrees)latitude;

/**
  convinience method to create an item
 */
+ (CovidVictim*)itemWithDate:(NSDate*)date
                      State:(NSString*)state
                       City:(NSString*)city
                     Amount:(NSUInteger)amount
                     Gender:(NSUInteger)g
                  Longitude:(CLLocationDegrees)longitude
                   Latitude:(CLLocationDegrees)latitude;

@property (nonatomic) NSDate *date;

@property (nonatomic) NSString *state;

@property (nonatomic) NSString *city;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *subtitle;

/** amount,
 * people involved with this item
*/
@property (nonatomic) NSUInteger amount;
/** gender data
 * 0=womanXX,
 * 1=manXY,
 * 2=both||unknown
 */
@property (nonatomic) NSUInteger gender;

@property (nonatomic) CovidStatus status;

/** coord
 NSValue keeping CLLocationCoordinates Longitude & Latitude
 the valueWithMKCoordinate extension is part of <MapKit/MKGeometry.h>
*/
@property (nonatomic) NSValue *coord;

- (MKMapItem*)mapItem;

@end

NS_ASSUME_NONNULL_END
