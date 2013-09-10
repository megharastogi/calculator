//
//  Compute.h
//  calculator
//
//  Created by MEGHA GULATI on 9/9/13.
//  Copyright (c) 2013 MEGHA GULATI. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Compute : NSObject
    @property (nonatomic) NSMutableArray * myStack;
    @property (nonatomic) NSMutableArray *operationStack;
    @property (nonatomic) BOOL operatorEntered;
    -(void) pushOnStack: (NSString *) nextValue;
    -(NSString*) calculateResult: (NSString *) nextValue;


@end
