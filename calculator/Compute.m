//
//  Compute.m
//  calculator
//
//  Created by MEGHA GULATI on 9/9/13.
//  Copyright (c) 2013 MEGHA GULATI. All rights reserved.
//

#import "Compute.h"

@implementation Compute


-(void) pushOnStack: (NSString *) nextValue{
    if([nextValue  isEqual: @"X"] || [nextValue  isEqual: @"%"] || [nextValue isEqual: @"+"] || [nextValue  isEqual: @"-"]){
        [self.operationStack addObject: nextValue];
        _operatorEntered = true;
    }else{
        if(_operatorEntered == true || [self.myStack count] == 0){
            [self.myStack addObject: nextValue];
            _operatorEntered = false;
        }else{
            NSString* lastValue = @"";
            lastValue = [self.myStack lastObject];
            [self.myStack removeLastObject];
            NSLog(@"This is lastValue %@", lastValue);
            [self.myStack addObject:[lastValue stringByAppendingString:nextValue]];
        }
    }
    
    NSLog(@"This is myStack %@", self.myStack);
    NSLog(@"This is operationStack %@",self.operationStack);

}

-(NSString*) calculateResult: (NSString *) nextValue{
    if([self.myStack count] == 1){
        return self.myStack[0];
    }
    else{
        if([self.operationStack count] == 2 || [nextValue isEqualToString:@"=" ]){
            NSString* firstValue = @"";
            firstValue = self.operationStack[0];
            if([nextValue isEqualToString:@"=" ]){
             [self.operationStack removeAllObjects];
            }
            else{
                NSString* lastValue = @"";
                lastValue = [self.operationStack lastObject];
                [self.operationStack removeAllObjects];
                [self.operationStack addObject: lastValue];
               
            }
             _operatorEntered = true;
            return [self applyOperator:firstValue];

        }else{
            return self.myStack[1];
        }
    }
}

-(NSString*)applyOperator:(NSString *)operator {
    if([operator  isEqual: @"X"]){
        return self.multiply;
    }else if ([operator  isEqual: @"%"]){
        return self.divide;
    }else if ([operator isEqual: @"+"]){
        return self.add;
    }else{
        return self.sub;
    }
    
}

-(NSString*)add{
    CGFloat c = 0;
    CGFloat a = [self.myStack[0] floatValue];
    CGFloat b = [self.myStack[1] floatValue];
    c = a + b;
    NSString* result = [@(c) description];
    [self.myStack removeAllObjects];
    [self.myStack addObject: result];
    NSLog(@"This is myStack now %@", self.myStack);

    return result;
    
}

-(NSString*)sub{
    CGFloat c = 0;
    CGFloat a = [self.myStack[0] floatValue];
    CGFloat b = [self.myStack[1] floatValue];
    c = a - b;
    NSString* result = [@(c) description];
    [self.myStack removeAllObjects];
    [self.myStack addObject: result];
    NSLog(@"This is myStack now %@", self.myStack);

    return result;
}

-(NSString*)multiply{
    CGFloat c = 0;
    CGFloat a = [self.myStack[0] floatValue];
    CGFloat b = [self.myStack[1] floatValue];
    c = a * b;
    NSString* result = [@(c) description];
    [self.myStack removeAllObjects];
    [self.myStack addObject: result];
    NSLog(@"This is myStack now %@", self.myStack);

    return result;
}

-(NSString*)divide{
    CGFloat c = 0;
    CGFloat a = [self.myStack[0] floatValue];
    CGFloat b = [self.myStack[1] floatValue];
    c = a/b;
    NSString* result = [@(c) description];
    [self.myStack removeAllObjects];
    [self.myStack addObject: result];
    NSLog(@"This is myStack now %@", self.myStack);

    return result;
}
-(NSMutableArray *)myStack{
    if(!_myStack){
        _myStack = [[NSMutableArray alloc] init];
    }
    return _myStack;
}

-(NSMutableArray *)operationStack{
    if(!_operationStack){
        _operationStack = [[NSMutableArray alloc] init];
    }
    return _operationStack;
}

@end
