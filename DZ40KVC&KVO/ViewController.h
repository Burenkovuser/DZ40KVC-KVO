//
//  ViewController.h
//  DZ40KVC&KVO
//
//  Created by Vasilii on 13.03.17.
//  Copyright © 2017 Vasilii Burenkov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UITableViewController<UITextFieldDelegate>

@property(strong, nonatomic) IBOutletCollection(UITextField) NSArray *regTextField;
@property (weak, nonatomic) IBOutlet UISegmentedControl *genderControl;

- (IBAction)textFieldAction:(UITextField *)sender;
- (IBAction)genderAction:(UISegmentedControl *)sender;
- (IBAction)resetAction:(UIButton *)sender;




@end

