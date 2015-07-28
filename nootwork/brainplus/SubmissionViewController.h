//
//  SubmissionViewController.h
//  brainplus
//
//  Created by Andrei on 7/16/15.
//  Copyright (c) 2015 Andrei. All rights reserved.
//

#import "ViewController.h"

@interface SubmissionViewController : ViewController <UIPickerViewDataSource, UIPickerViewDelegate,UITextFieldDelegate, UITextViewDelegate>
@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *dosageField;
@property (weak, nonatomic) IBOutlet UITextView *descriptionField;
@property (weak, nonatomic) IBOutlet UITextField *sourceField;
@property (weak, nonatomic) IBOutlet UIPickerView *typePicker;

@end
