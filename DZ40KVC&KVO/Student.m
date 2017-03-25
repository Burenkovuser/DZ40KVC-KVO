//
//  Student.m
//  DZ40KVC&KVO
//
//  Created by Vasilii on 13.03.17.
//  Copyright © 2017 Vasilii Burenkov. All rights reserved.
//

#import "Student.h"

@implementation Student

-(instancetype) inintWithInfo {
    
    //self = [super init];
    if (self) {
        _firstName = @"default firstname";
        _lastName = @"defaul lastname";
        
        NSDateFormatter* dateFormater = [[NSDateFormatter alloc] init];
        [dateFormater setDateFormat:@"dd.MM.yyyy"];
        
        _dateOfBirth = [dateFormater stringFromDate:[NSDate date]];
        _gender = 0;
        _grade = 0;
    }
    return self;
}

-(void) clearInfo {
    
    [self willChangeValueForKey:@"firstName"];
    _firstName = @"";
    [self didChangeValueForKey:@"firstName"];
    
    [self willChangeValueForKey:@"lastName"];
    _firstName = @"";
    [self didChangeValueForKey:@"lastName"];
    
    [self willChangeValueForKey:@"dateOfBirth"];
    _firstName = @"";
    [self didChangeValueForKey:@"dateOfBirth"];
    
    [self willChangeValueForKey:@"gender"];
    _firstName = @"";
    [self didChangeValueForKey:@"gender"];
    
    [self willChangeValueForKey:@"grade"];
    _firstName = @"";
    [self didChangeValueForKey:@"grade"];
    
}

@end
