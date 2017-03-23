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

-(void) setFirstName:(NSString *)firstName {
    _firstName = firstName;
    NSLog(@"Started new name: %@", firstName);
}

-(void) setLastName:(NSString *)lastName {
    _lastName = lastName;
    NSLog(@"Started new lastName: %@", lastName);
}

-(void) setGender:(NSInteger *)gender {
    _gender = gender;
    NSLog(@"Started new gender: %ld", gender);
}
-(void) setGrade:(NSInteger *)grade {
    _grade = grade;
    NSLog(@"Started new grade: %ld", grade);
}

@end
