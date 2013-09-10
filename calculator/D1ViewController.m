//
//  D1ViewController.m
//  calculator
//
//  Created by MEGHA GULATI on 9/9/13.
//  Copyright (c) 2013 MEGHA GULATI. All rights reserved.
//

#import "D1ViewController.h"
#import "Compute.h"

@interface D1ViewController ()

@end

@implementation D1ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.compute = [[Compute alloc] init];
    self.compute.operatorEntered = false;

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)collectInput:(UIButton*)clickedButton{
    [self.compute pushOnStack:clickedButton.currentTitle];
    self.result.text = [self.compute calculateResult:clickedButton.currentTitle];
}

-(IBAction)returnResult:(id)sender{
    self.result.text = [self.compute calculateResult:@"="];
}
-(IBAction)clearAll:(id)sender{
    [self.compute.myStack removeAllObjects];
    [self.compute.operationStack removeAllObjects];
    self.result.text = @"0";
}
@end
