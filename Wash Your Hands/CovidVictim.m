//
//  CovidItem.m
//  Wash Your Hands
//
//  Created by Designerfuzzi on 01.03.20.
//  Copyright © by Designerfuzzi. All rights reserved.
//

#import "CovidVictim.h"

@implementation CovidVictim

@synthesize coordinate;

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
        _status = CovidStatusQuarantaine;
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

-(CLLocationCoordinate2D)coordinate {
    return _coord.MKCoordinateValue;
}
-(void)setCoordinate:(CLLocationCoordinate2D)newCoordinate {
    //CLLocationCoordinate2DMake(latitude, longitude)
    _coord = [NSValue valueWithMKCoordinate:newCoordinate];
}

-(MKMapItem *)mapItem {
    //NSDictionary *addressDict = @{(NSString*)kABPersonAddressStreetKey : _address};
    //MKPlacemark *placemark = [[MKPlacemark alloc] initWithCoordinate:self.coord addressDictionary:addressDict];
    
    MKPlacemark *placemark = [[MKPlacemark alloc] initWithCoordinate:self.coordinate];
    
    MKMapItem *mapItem = [[MKMapItem alloc] initWithPlacemark:placemark];
    mapItem.name = self.title;
    
    return mapItem;
}

-(NSString *)title {
    return [_city stringByAppendingFormat:@" (%lu)", _amount];
}

-(NSString *)subtitle {
    NSString *sub = @"";
    switch (self.status) {
        case CovidStatusPatientNull:
        case CovidStatusQuarantaine:
            sub = @"Quarantaine";
            break;
        case CovidStatusConfirmed:
            sub = @"Confirmed";
            break;
        case CovidStatusRecovered:
            sub = @"Recovered";
            break;
        case CovidStatusDeath:
            sub = @"Death";
            break;
        default:
            break;
    }
    return [sub stringByAppendingFormat:@" (%@)", _date];
}

@end
