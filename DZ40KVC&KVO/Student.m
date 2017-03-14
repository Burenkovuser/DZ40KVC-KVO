//
//  Student.m
//  DZ40KVC&KVO
//
//  Created by Vasilii on 13.03.17.
//  Copyright © 2017 Vasilii Burenkov. All rights reserved.
//

#import "Student.h"

@interface Student()

@property(strong, nonatomic) NSArray* namesArray;
@property(strong, nonatomic) NSArray* surnamesArray;
@property(strong, nonatomic) NSArray* femaleNames;

@end

@implementation Student

- (instancetype)init {
    self = [super init];
    if (self) {
        //потребуются массивы имен, фамилий
        self.namesArray = [NSArray array];
        self.surnamesArray = [NSArray array];
        self.femaleNames = [NSArray array];
        // Все имена
        self.namesArray = [NSArray arrayWithObjects:@"Bob", @"Stanly", @"Jack", @"John", @"Vince", @"James", @"Anthony", @"Tony", @"Patrick", @"Tom", @"Brad", @"Finn", @"Fred", @"Wes", @"Sam", @"Steve", @"Bruce", @"Chris", @"Bobby", @"Terry", @"Jeff", @"Sterling", @"Lisa", @"Eva", @"Kira", @"Annie", @"Monica", @"Rebecca", @"Jenny", @"Sandra", @"Nicole", @"Victoria", @"Mary", @"Marina", @"Lily", @"Christie", @"Anna", @"Nina", @"Polina", @"Klara", nil];
        
        // Женские имена
        self.femaleNames = [NSArray arrayWithObjects:@"Lisa", @"Eva", @"Kira", @"Annie", @"Monica", @"Rebecca", @"Jenny", @"Sandra", @"Nicole", @"Victoria", @"Mary", @"Marina", @"Lily", @"Christie", @"Anna", @"Nina", @"Polina", @"Klara", nil];
        
        self.firstName = [NSString stringWithFormat:@"%@", [self.namesArray objectAtIndex:arc4random_uniform((int)[self.namesArray count])]];
   
    //выбираем пол в зависимости от имени
    if ([self.femaleNames containsObject:self.firstName]) {
        self.gender = @"Female";
    }else{
        self.gender = @"Male";
    }
    
    self.surnamesArray = [NSArray arrayWithObjects:@"White", @"Black", @"Red", @"Summerset", @"Yellow", @"Brown", @"Grey", @"Orange", @"Hanks", @"Pitt", @"Price", @"Durst", @"Borland", @"Rivers", @"Rogers", @"Willis", @"Hamswort", @"Labonte", @"O`Quinn", @"Bridges", @"Marlen", @"Freeman", @"Ford", @"Allen", @"Norton", @"Catch", @"Wildmore", @"Davidson", @"Will", @"Potter", @"Wesley", @"Parker", @"Marsh", @"Broflovski", @"Cartman", @"Linder", @"Walker", @"Diesel", @"McFly", nil];
    
    self.lastName = [NSString stringWithFormat:@"%@", [self.surnamesArray objectAtIndex:arc4random_uniform((int)[self.surnamesArray count])]];
    
    //  День рождения делаем через NSDate, рандомно от какой-то даты. например 01.09.1993 + 5 лет диапазон для студента
    
    NSDateFormatter *formater = [[NSDateFormatter alloc] init];
    [formater setDateFormat:@"dd.MM.yyyy"];
    NSDate *startingDate = [formater dateFromString:@"01.09.1993"];
    
    // 5 лет в секундах = 60*60*24*365*5
    
    NSDate *dateOfBirth =[startingDate dateByAddingTimeInterval:arc4random_uniform(60 * 60 * 24 * 365 *5)];
    self.dateOfBirth = [formater stringFromDate:dateOfBirth];
    
    self.grade = arc4random_uniform(5) + 1;
    }
    return self;
}

-(id) resetData {
    
    //изменяем данные через iVar и предупреждаем observer об этом
    
    [self willChangeValueForKey:@"firstName"];
    [self willChangeValueForKey:@"lastName"];
    [self willChangeValueForKey:@"dateOfBirth"];
    [self willChangeValueForKey:@"gender"];
    [self willChangeValueForKey:@"grade"];
    
    _firstName = @"";
    _lastName = @"";
    _dateOfBirth = @"";
    _gender = @"";
    _grade = 0;
    
    [self didChangeValueForKey:@"firstName"];
    [self didChangeValueForKey:@"lastName"];
    [self didChangeValueForKey:@"dateOfBirth"];
    [self didChangeValueForKey:@"gender"];
    [self didChangeValueForKey:@"grade"];
    
    return self;
}
@end
