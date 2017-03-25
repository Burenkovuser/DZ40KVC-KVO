//
//  Student.h
//  DZ40KVC&KVO
//
//  Created by Vasilii on 13.03.17.
//  Copyright © 2017 Vasilii Burenkov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Student : NSObject

@property(strong, nonatomic) NSString *firstName;
@property(strong, nonatomic) NSString *lastName;
@property(strong, nonatomic) NSString *dateOfBirth;
@property(assign, nonatomic) NSInteger *gender;
@property(assign, nonatomic) NSInteger *grade;


-(instancetype) inintWithInfo;
-(void) clearInfo;

@end
