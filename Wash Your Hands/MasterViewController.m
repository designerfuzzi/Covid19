//
//  MasterViewController.m
//  Wash Your Hands
//
//  Created by Designerfuzzi on 29.02.20.
//  Copyright © by Designerfuzzi. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"
#import "CHCSVParser.h"

@interface MasterViewController ()

@property NSMutableArray *objects;

@end


@implementation MasterViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.leftBarButtonItem = self.editButtonItem;

    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
    self.navigationItem.rightBarButtonItem = addButton;
    
    self.parser = nil;
    
    [self readPredefinedResourceCSVData];
    
    self.detailViewController = (DetailViewController *)[[self.splitViewController.viewControllers lastObject] topViewController];
    
}


- (void)viewWillAppear:(BOOL)animated
{
    self.clearsSelectionOnViewWillAppear = self.splitViewController.isCollapsed;
    [super viewWillAppear:animated];
}


- (void)insertNewObject:(id)sender
{
    if (!self.objects) {
        self.objects = [[NSMutableArray alloc] init];
    }
   //[self.objects insertObject:[NSDate date] atIndex:0];
   //NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
   //[self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}


#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
       
        CovidVictim *object = self.objects[indexPath.row];
        
        DetailViewController *controller = (DetailViewController *)[[segue destinationViewController] topViewController];
        
        controller.objects = self.objects;
        
        controller.detail = object;
        NSString *title = [[NSString alloc] initWithFormat:@"%@ %@", object.date.description, object.state ];
        controller.navigationItem.title = title;
        controller.navigationItem.leftBarButtonItem = self.splitViewController.displayModeButtonItem;
        controller.navigationItem.leftItemsSupplementBackButton = YES;
        self.detailViewController = controller;
        
    }
}


#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.objects.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];

    //NSDate *object = self.objects[indexPath.row];
    //cell.textLabel.text = [object description];
    
    CovidVictim *object = self.objects[indexPath.row];
    cell.textLabel.text = object.city;
    
    return cell;
}


- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}


- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.objects removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}


-(void)readPredefinedResourceCSVData
{
    
    //NSString *name =@"time_series_19-covid-Confirmed";
    NSString *name =@"germany";
    
    NSString* resourcePath = [[NSBundle mainBundle] resourcePath];
    NSString* filename = [resourcePath stringByAppendingPathComponent:name];
    NSString* completefilename = [filename stringByAppendingPathExtension:@"csv"];
    NSLog(@"file=%@",completefilename);
    
    if ([[NSFileManager defaultManager] fileExistsAtPath:completefilename]) {
        
        //NSCharacterSet *charset = [NSCharacterSet URLPathAllowedCharacterSet];
        //NSURL *fileURL = [NSURL URLWithString:[completefilename stringByAddingPercentEncodingWithAllowedCharacters:charset]];
        
        NSBundle *bundle = [NSBundle bundleForClass:[self class]];
        NSURL *fileURL = [bundle URLForResource:name withExtension:@"csv"];
        NSLog(@"fileURL=%@",fileURL);
        //NSArray *actual = [NSArray arrayWithContentsOfCSVURL:fileURL];
        
        NSLog(@"Beginning...");
        
        self.parser = [[CHCSVParser alloc] initWithContentsOfCSVURL:fileURL];
        [self.parser setRecognizesBackslashesAsEscapes:YES];
        [self.parser setSanitizesFields:YES];
        
        //NSStringEncoding encoding = 0;
        //NSInputStream *stream = [NSInputStream inputStreamWithFileAtPath:file];
        //CHCSVParser * p = [[CHCSVParser alloc] initWithInputStream:stream usedEncoding:&encoding delimiter:';'];
        //[p setRecognizesBackslashesAsEscapes:YES];
        //[p setSanitizesFields:YES];
        //NSLog(@"encoding: %@", CFStringGetNameOfEncoding(CFStringConvertNSStringEncodingToEncoding(encoding)));
        
        self.parserdelegate = [[CHCSVDelegate alloc] init];
        [self.parser setDelegate:self.parserdelegate];
        
        
        
        NSTimeInterval start = [NSDate timeIntervalSinceReferenceDate];
        [self.parser parse];
        NSTimeInterval end = [NSDate timeIntervalSinceReferenceDate];
        
        NSLog(@"raw difference: %f", (end-start));
        
        //NSLog(@"%@", [d lines]);
        NSLog(@"------------------------------------");
    }
    
    float latitude = 0.0;
    float longitude = 0.0;
    
    if (self.parser && self.parserdelegate) {
    
        NSArray *wholeCSV = [self.parserdelegate lines];
        
        for (uint64_t i=1; i < wholeCSV.count; i++) {
            //
            NSArray *thisLine = wholeCSV[i];
            
            //latitude = [thisLine[2] floatValue];
            //longitude = [thisLine[3] floatValue];
            
            latitude = [thisLine[4] floatValue];
            longitude = [thisLine[5] floatValue];
            NSString *kreis = thisLine[3];
            NSString *city = thisLine[2];
            NSDate *date = thisLine[1];
            
            // latitude && longitude are wide around germany
            // you could parse a large csv file.
            // can be done dynamicaly, so you could read the maps long/lat
            // and re-parse the data-set for entrys
            if (
                (longitude >= -1.0 && longitude <= 15.0) &&
                (latitude >= 42.0 && latitude <= 60.0)
                )
            {
                
                [self insertNewCovidItem:[CovidVictim itemWithDate:(NSDate*)date State:kreis City:city Amount:1 Gender:1 Longitude:longitude Latitude:latitude]];
                
            }
        }
            
    }
}

- (void)insertNewCovidItem:(CovidVictim*)item
{
    if (!self.objects) {
        self.objects = [[NSMutableArray alloc] init];
    }

    [self.objects insertObject:item atIndex:0];

    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}

@end
