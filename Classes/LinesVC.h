//
// LinesVC.h
// kronos
//
// Created by Ljuba Miljkovic on 3/23/10.
// Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "Agency.h"
#import "LinesTableView.h"
#import "TransitDelegate.h"
#import <CoreLocation/CoreLocation.h>
#import <UIKit/UIKit.h>

@interface LinesVC : UIViewController 

@property (nonatomic, strong) UISegmentedControl *segmentedControl;
@property (nonatomic, strong) IBOutlet LinesTableView *tableView;
@property (nonatomic, strong) TransitDelegate *transitDelegate;
@property (nonatomic, strong) CLLocationManager *locationManager;

- (void) tapAgency;
- (Agency *) fetchAgencyData:(NSString *)agency;
- (void) loadNextViewController:(NSNotification *)note;

@end
