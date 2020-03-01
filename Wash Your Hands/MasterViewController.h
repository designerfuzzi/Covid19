//
//  MasterViewController.h
//  Wash Your Hands
//
//  Created by Designerfuzzi on 29.02.20.
//  Copyright © by Designerfuzzi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CSVParser.h"
#import "CovidVictim.h"

@class DetailViewController;

@interface MasterViewController : UITableViewController

@property (strong, nonatomic) DetailViewController *detailViewController;
@property (strong, nonatomic) CHCSVParser *parser;
@property (strong, nonatomic) CHCSVDelegate * parserdelegate;

@end

