//
//  ViewController.h
//  DZ40KVC&KVO
//
//  Created by Vasilii on 13.03.17.
//  Copyright © 2017 Vasilii Burenkov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Student.h"

@interface ViewController : UITableViewController<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *lastnameField;
@property (weak, nonatomic) IBOutlet UITextField *birthDateField;
@property (weak, nonatomic) IBOutlet UISegmentedControl *genderSegment;
@property (weak, nonatomic) IBOutlet UITextField *gradeField;


- (IBAction)actionNameChaged:(UITextField *)sender;
- (IBAction)actionLastnameChaged:(UITextField *)sender;
- (IBAction)actionBirthDateChanged:(UITextField *)sender;
- (IBAction)actionCradeChanged:(UITextField *)sender;

- (IBAction)actionGenderChanged:(UISegmentedControl *)sender;



@end

