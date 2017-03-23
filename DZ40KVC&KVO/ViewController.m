//
//  ViewController.m
//  DZ40KVC&KVO
//
//  Created by Vasilii on 13.03.17.
//  Copyright © 2017 Vasilii Burenkov. All rights reserved.
//

#import "ViewController.h"
#import "Student.h"

@interface ViewController ()

@property(strong,nonatomic) Student* student;

@end

@implementation ViewController

-(void) loadView {
    [super loadView];
    
    self.student = [[Student alloc] inintWithInfo];
    
    self.nameField.text = self.student.firstName;
    self.lastnameField.text = self.student.lastName;
    self.birthDateField.text = self.student.dateOfBirth;
    self.genderSegment.selectedSegmentIndex = self.student.gender;
    
}

- (void)viewDidLoad {
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) dealloc {
    self.student = nil;
}




- (IBAction)actionLastnameChaged:(UITextField *)sender {
    self.student.lastName = sender.text;
}

- (IBAction)actionBirthDateChanged:(UITextField *)sender {
    self.student.dateOfBirth = sender.text;
}

- (IBAction)actionCradeChanged:(UITextField *)sender {
    self.student.grade = [sender.text intValue];
}

- (IBAction)actionGenderChanged:(UISegmentedControl *)sender {
    self.student.gender = sender.selectedSegmentIndex;
}
- (IBAction)actionNameChaged:(UITextField *)sender {
    self.student.firstName = sender.text;
}
@end

