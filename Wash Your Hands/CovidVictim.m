//
//  CovidItem.m
//  Wash Your Hands
//
//  Created by Designerfuzzi on 01.03.20.
//  Copyright © by Designerfuzzi. All rights reserved.
//

#import "CovidVictim.h"

@implementation CovidVictim

- (instancetype)initWithDate:(NSDate*)date
                      State:(NSString*)state
                       City:(NSString*)city
                     Amount:(NSUInteger)amount
                     Gender:(NSUInteger)g
                  Longitude:(CLLocationDegrees)longitude
                   Latitude:(CLLocationDegrees)latitude
{
    self = [super init];
    if (self)
    {
        _date = date;
        _state = state;
        _city = city;
        _amount = amount;
        _gender = g; //0=womanXX, 1=manXY, 2=both||unknown
        _coord = [NSValue valueWithMKCoordinate:CLLocationCoordinate2DMake(latitude, longitude)];
    }
    return self;
}

+ (CovidVictim*)itemWithDate:(NSDate*)date
                      State:(NSString *)state
                       City:(NSString *)city
                     Amount:(NSUInteger)amount
                     Gender:(NSUInteger)g
                  Longitude:(CLLocationDegrees)longitude
                   Latitude:(CLLocationDegrees)latitude
{
    
    CovidVictim *item = [[CovidVictim alloc] initWithDate:(NSDate*)date State:state City:city Amount:amount Gender:g Longitude:longitude Latitude:latitude];
    
    return item;
}

@end
