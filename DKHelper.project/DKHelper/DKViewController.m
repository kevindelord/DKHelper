//
//  DKViewController.m
//  DKHelperTest
//
//  Created by Kévin Delord on 4/22/14.
//  Copyright (c) 2014 DK. All rights reserved.
//

#import "DKViewController.h"
#import "DKHelper.h"

@interface DKViewController ()

@end

@implementation DKViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

    [self.backgroundView roundCorner:(UIRectCornerAllCorners) radius:self.backgroundView.frame.size.width];
    self.versionLabel.text = DK_APP_VERSION;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end