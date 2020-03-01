//
//  DetailViewController.h
//  Wash Your Hands
//
//  Created by Designerfuzzi on 29.02.20.
//  Copyright © by Designerfuzzi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "CovidVictim.h"

@interface DetailViewController : UIViewController

@property (nonatomic) NSMutableArray *objects;
@property (nonatomic) BOOL annotationsAdded;

@property (strong, nonatomic) CovidVictim *detail;
//@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@property (nonatomic) IBOutlet MKMapView *map;

@end

