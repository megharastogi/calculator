//
//  D1ViewController.h
//  calculator
//
//  Created by MEGHA GULATI on 9/9/13.
//  Copyright (c) 2013 MEGHA GULATI. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Compute.h"

@interface D1ViewController : UIViewController

@property (nonatomic) IBOutlet UITextView *result;
-(IBAction)collectInput:(UIButton*)clickedButton;
-(IBAction)returnResult:(id)sender;
-(IBAction)clearAll:(id)sender;

@property (nonatomic) Compute * compute;

@end
