//
//  ViewController.m
//  DZ40KVC&KVO
//
//  Created by Vasilii on 13.03.17.
//  Copyright © 2017 Vasilii Burenkov. All rights reserved.
//

#import "ViewController.h"
#import "Student.h"

@interface ViewController ()<UITextFieldDelegate>

@property(strong,nonatomic) Student* student;

@end

@implementation ViewController

-(void) loadView {
    [super loadView];
    
    [self reContctToField];
    
    self.student = [[Student alloc] inintWithInfo];
    
    //добавляем Observer (создан ниже в него приходит)
    
    [self.student addObserver:self
                   forKeyPath:@"firstName"
                      options: NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld
                      context:nil];
    
    [self.student addObserver:self
                   forKeyPath:@"lastName"
                      options: NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld
                      context:nil];
    
    [self.student addObserver:self
                   forKeyPath:@"dateOfBirth"
                      options: NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld
                      context:nil];
    
    [self.student addObserver:self
                   forKeyPath:@"gender"
                      options: NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld
                      context:nil];
    
    [self.student addObserver:self
                   forKeyPath:@"grade"
                      options: NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld
                      context:nil];
    
}

-(void) reContctToField {
    self.nameField.text = self.student.firstName;
    self.lastnameField.text = self.student.lastName;
    self.birthDateField.text = self.student.dateOfBirth;
    self.genderSegment.selectedSegmentIndex = self.student.gender;
    self.gradeField.text = [NSString stringWithFormat:@"%ld", self.student.grade];
}

- (void)viewDidLoad {

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) dealloc {
    self.student = nil;
    [self.student removeObserver:self forKeyPath:@"firstName"];//не забываем отписываться
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

- (IBAction)actionClearInfo:(UIButton *)sender {
    
    [self.student clearInfo];
    [self reContctToField];
    
}
- (IBAction)actionNameChaged:(UITextField *)sender {
    self.student.firstName = sender.text;
}

#pragma makr - Observing
//будет вызваться при изменении свойства
-(void) observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary<NSKeyValueChangeKey,id> *)change
                       context:(void *)context {
    id newValue = [change objectForKey:NSKeyValueChangeNewKey];
    id oldValue = [change objectForKey:NSKeyValueChangeOldKey];
    
    NSLog(@"Change value fo key path: %@\nOld value: %@\nNew value: %@", keyPath, oldValue, newValue);
    NSLog(@"\n_____________________________________________");
}

-(BOOL) textFieldShouldReturn:(UITextField *)textField {//функция возвращает поля
    if ([textField isEqual:self.nameField]) {
        [self.lastnameField becomeFirstResponder];//становится первым
    }else if ([textField isEqual:self.lastnameField]) {
        [textField resignFirstResponder];//убирается
    }else if ([textField isEqual:self.gradeField]) {
        [textField resignFirstResponder];
    }
    return NO;
}

-(void) sendMessageWith: (NSDate*) date {
    NSDateFormatter* dateFormater = [[NSDateFormatter alloc] init];
    [dateFormater setDateFormat:@"dd.MM.yyyy"];
    
    self.birthDateField.text = self.student.dateOfBirth = [dateFormater stringFromDate:date];
}

@end

