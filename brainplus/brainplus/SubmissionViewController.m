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
    _pickerData = @[@"Work", @"Active", @"Social", @"Relax"];
    self.typePicker.dataSource = self;
    self.typePicker.delegate = self;
    // Do any additional setup after loading the view.
    
}
- (IBAction)cancelButton:(id)sender {
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)doneButtonClicked:(id)sender {
    //storing the value of the different fields
    NSString *name= self.nameField.text;
    NSString *dosage = self.dosageField.text;
    NSString *description = self.descriptionField.text;
    
    //storing the value of the picker
    NSInteger row;
    row = [_typePicker selectedRowInComponent:0];
    self.typePicker = [_pickerData objectAtIndex:row];

    if ([name  isEqual: @""] || [dosage  isEqual: @""] || [description  isEqual: @""])
    {
        name = NULL;
        dosage = NULL;
        description = NULL;
        self.typePicker = NULL;
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Incomplete" message:@"Please make sure to fill out all the fields" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:@"Cancel", nil];
        [alert show];
    }
    else {
        //saving the object to Parse
        PFObject *nootropicObject = [PFObject objectWithClassName:@"Nootropic"];
        nootropicObject[@"Type"] = self.typePicker;
        nootropicObject[@"Name"] = name;
        nootropicObject[@"Dosage"] = dosage;
        nootropicObject[@"Description"] = description;
        nootropicObject[@"VoteValue"] = @1;
        [nootropicObject saveInBackground];
        
        [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//initializing the picker
-(int)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

-(int)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return _pickerData.count;
}

-(NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return _pickerData[row];
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
