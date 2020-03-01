//
//  DetailViewController.m
//  Wash Your Hands
//
//  Created by Designerfuzzi on 29.02.20.
//  Copyright © by Designerfuzzi. All rights reserved.
//

#import "DetailViewController.h"
#import <MapKit/MapKit.h>
#define METERS_PER_MILE 1609.344

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)configureView {
    // Update the user interface for the detail item.
    if (self.detail) {

        //self.detailDescriptionLabel.text = [self.detail city];
        if (self.map) {
            
            float latitude = _detail.coord.MKCoordinateValue.latitude;
            float longitude = _detail.coord.MKCoordinateValue.longitude;
            CLLocationCoordinate2D centerCoordinate = CLLocationCoordinate2DMake(latitude, longitude);
            MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance( centerCoordinate, 20000, 20000);
            //MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(centerCoordinate, 0.5*METERS_PER_MILE, 0.5*METERS_PER_MILE);
            
            if (self.objects && !self.annotationsAdded) {
                [self.map addAnnotations:self.objects];
                self.annotationsAdded = YES;
            }
            [self.map setRegion:region animated:NO];
        }
    }
}


- (void)viewDidLoad {
    
    [super viewDidLoad];
    if (!self.map) {
        self.map = [[MKMapView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    }
    // Do any additional setup after loading the view.
    [self configureView];
}


#pragma mark - Managing the detail item

-(void)setDetail:(CovidVictim *)detailValue {
    if (_detail != detailValue) {
        _detail = detailValue;
        
        // Update the view.
        [self configureView];
    }
}

@end
