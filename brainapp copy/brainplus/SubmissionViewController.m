//
//  SubmissionViewController.m
//  brainplus
//
//  Created by Andrei on 7/16/15.
//  Copyright (c) 2015 Andrei. All rights reserved.
//

#import "SubmissionViewController.h"
#import "Parse/Parse.h"

@interface SubmissionViewController ()

@end

@implementation SubmissionViewController{
    NSArray *_pickerData;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _descriptionField.delegate = self;
    _nameField.delegate = self;
    _dosageField.delegate=self;
    _sourceField.delegate=self;
    _pickerData = @[@"Work", @"Active", @"Social", @"Relax"];
    self.typePicker.dataSource = self;
    self.typePicker.delegate = self;
    // Do any additional setup after loading the view.
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    
    return YES;
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    if ([text isEqualToString:@"\n"]) {
        [textView resignFirstResponder];
    }
    return YES;
}

- (IBAction)cancelButton:(id)sender {
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}


- (IBAction)doneButtonClicked:(id)sender {
    //storing the value of the different fields
    NSString *name= self.nameField.text;
    NSString *dosage = self.dosageField.text;
    NSString *description = self.descriptionField.text;
    NSString *source = self.sourceField.text;
    //storing the value of the picker
    NSInteger row;
    row = [_typePicker selectedRowInComponent:0];
    self.typePicker = [_pickerData objectAtIndex:row];
    //hacked together to address problem
    NSString *realName = [NSString stringWithFormat:@"%@ (%@)", name, self.typePicker];

    if ([name  isEqual: @""] || [dosage  isEqual: @""] || [description  isEqual: @""] || [source isEqual:@""])
    {
        name = NULL;
        dosage = NULL;
        description = NULL;
        source = NULL;
        self.typePicker = NULL;
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Incomplete" message:@"Please make sure to fill out all the fields" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:@"Cancel", nil];
        [alert show];
    }
    else {

        //saving the object to Parse
        PFObject *nootropicObject = [PFObject objectWithClassName:@"Nootropic"];
        nootropicObject[@"Type"] = self.typePicker;
        nootropicObject[@"Name"] = realName;
        nootropicObject[@"Dosage"] = dosage;
        nootropicObject[@"Description"] = description;
        nootropicObject[@"VoteValue"] = @1;
        nootropicObject[@"Favorite"] = @"False";
        nootropicObject[@"Source"] = source;
        [nootropicObject saveInBackground];
        [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Picker View
//initializing the picker
-(int)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    int pickerview = 1;
    return pickerview;
}

-(int)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return (int)_pickerData.count;
}

-(NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return _pickerData[row];
}
//changing picker viwe color
- (NSAttributedString *)pickerView:(UIPickerView *)pickerView attributedTitleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    switch (row) {
        case 0:
        {NSString *title = @"Work";
            NSAttributedString *attString = [[NSAttributedString alloc] initWithString:title attributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
            
            return attString;}
        case 1:
        {NSString *title = @"Active";
            NSAttributedString *attString = [[NSAttributedString alloc] initWithString:title attributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
            
            return attString;}
        case 2:
        {NSString *title = @"Social";
            NSAttributedString *attString = [[NSAttributedString alloc] initWithString:title attributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
            
            return attString;}
        case 3:
        {  NSString *title = @"Relax";
            NSAttributedString *attString = [[NSAttributedString alloc] initWithString:title attributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
            return attString;
        }
        default:
        {NSString *title = @"Work";
            NSAttributedString *attString = [[NSAttributedString alloc] initWithString:title attributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
            return attString;}

    }

    
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
