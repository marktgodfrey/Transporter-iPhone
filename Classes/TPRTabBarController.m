//
//  TPRTabBarController.m
//  transporter
//
//  Created by Zac White on 3/28/12.
//  Copyright (c) 2012 Ljuba Miljkovic. All rights reserved.
//

#import "TPRTabBarController.h"

@interface TPRTabBarController ()

@property (strong) UIButton *favoritesButton;
@property (strong) UIButton *nearMeButton;
@property (strong) UIButton *linesButton;

@property(nonatomic, assign) NSUInteger previousSelectedIndex;

- (void)createCustomTabBar;

@end

@implementation TPRTabBarController

@synthesize favoritesButton;
@synthesize nearMeButton;
@synthesize linesButton;
@synthesize previousSelectedIndex;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    previousSelectedIndex = 0;
    
    [self createCustomTabBar];
}

- (void)createCustomTabBar {
    
    UIView *container = self.view;
    
    self.favoritesButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.favoritesButton.tag = 0;
    self.favoritesButton.accessibilityIdentifier = @"favorites tab";
    [self.favoritesButton addTarget:self action:@selector(changeSelectedTab:) forControlEvents:UIControlEventTouchDown];
    self.favoritesButton.adjustsImageWhenHighlighted = NO;
    [self.favoritesButton setBackgroundImage:[UIImage imageNamed:@"tab-favorites.png"] forState:UIControlStateNormal];
    [self.favoritesButton sizeToFit];
    
    self.favoritesButton.frame = CGRectMake(0,
                                            container.bounds.size.height - self.favoritesButton.frame.size.height,
                                            self.favoritesButton.frame.size.width,
                                            self.favoritesButton.frame.size.height);
    self.favoritesButton.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleRightMargin;
    
    self.nearMeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.nearMeButton.tag = 1;
    self.nearMeButton.accessibilityIdentifier = @"stops near me tab";
    [self.nearMeButton addTarget:self action:@selector(changeSelectedTab:) forControlEvents:UIControlEventTouchDown];
    self.nearMeButton.adjustsImageWhenHighlighted = NO;
    [self.nearMeButton setBackgroundImage:[UIImage imageNamed:@"tab-nearme.png"] forState:UIControlStateNormal];
    [self.nearMeButton sizeToFit];
    
    self.nearMeButton.frame = CGRectMake(CGRectGetMaxX(self.favoritesButton.frame),
                                         container.bounds.size.height - self.nearMeButton.frame.size.height,
                                         self.nearMeButton.frame.size.width,
                                         self.nearMeButton.frame.size.height);
    self.nearMeButton.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleRightMargin;
    
    self.linesButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.linesButton.tag = 2;
    self.linesButton.accessibilityIdentifier = @"lines tab";
    [self.linesButton addTarget:self action:@selector(changeSelectedTab:) forControlEvents:UIControlEventTouchDown];
    self.linesButton.adjustsImageWhenHighlighted = NO;
    [self.linesButton setBackgroundImage:[UIImage imageNamed:@"tab-lines.png"] forState:UIControlStateNormal];
    [self.linesButton sizeToFit];
    
    self.linesButton.frame = CGRectMake(CGRectGetMaxX(self.nearMeButton.frame),
                                        container.bounds.size.height - self.linesButton.frame.size.height,
                                        self.linesButton.frame.size.width,
                                        self.linesButton.frame.size.height);
    self.linesButton.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleRightMargin;
    
    [container addSubview:self.favoritesButton];
    [container addSubview:self.nearMeButton];
    [container addSubview:self.linesButton];
}

- (void)changeSelectedTab:(UIButton *)sender {

    previousSelectedIndex = self.selectedIndex;
    
    [self setSelectedIndex:sender.tag];
    
}

- (void)setSelectedIndex:(NSUInteger)selectedIndex {
    [super setSelectedIndex:selectedIndex];
    
    if (selectedIndex == 0) [self.favoritesButton setImage:[UIImage imageNamed:@"tab-favorites-active.png"] forState:UIControlStateNormal];
    else [self.favoritesButton setImage:[UIImage imageNamed:@"tab-favorites.png"] forState:UIControlStateNormal];
    
    if (selectedIndex == 1) [self.nearMeButton setImage:[UIImage imageNamed:@"tab-nearme-active.png"] forState:UIControlStateNormal];
    else [self.nearMeButton setImage:[UIImage imageNamed:@"tab-nearme.png"] forState:UIControlStateNormal];
    
    if (selectedIndex == 2) [self.linesButton setImage:[UIImage imageNamed:@"tab-lines-active.png"] forState:UIControlStateNormal];
    else [self.linesButton setImage:[UIImage imageNamed:@"tab-lines.png"] forState:UIControlStateNormal];
    
    
    UIViewController *currentIndexViewController = [self.viewControllers objectAtIndex:selectedIndex];
    UIViewController *previousIndexViewController = [self.viewControllers objectAtIndex:previousSelectedIndex];
    
    if ([currentIndexViewController isEqual:previousIndexViewController]) {
        
        if ([currentIndexViewController.class isSubclassOfClass:[UINavigationController class]]) {
            
            [(UINavigationController *)currentIndexViewController popToRootViewControllerAnimated:YES];
            
        }
        
    }
    else {
        
        if ([currentIndexViewController.class isSubclassOfClass:[UINavigationController class]]) {
            [(UINavigationController *)currentIndexViewController popToRootViewControllerAnimated:NO];
        }
    }
    
}

@end
