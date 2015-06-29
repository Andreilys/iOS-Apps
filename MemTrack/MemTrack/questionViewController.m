//
//  questionViewController.m
//  MemTrack
//
//  Created by Andrei on 6/29/15.
//  Copyright (c) 2015 Andrei. All rights reserved.
//

#import "questionViewController.h"
#import "questionViewModel.h"

@interface questionViewController ()

@end

@implementation questionViewController

- (IBAction)addQuestion:(id)sender {
    questionViewModel *qvm = [[questionViewModel alloc] init];
    qvm.question = self.questionValue.text;
    qvm.answer = self.answerValue.text;
    [qvm printquestions];
    
    [self dismissViewControllerAnimated:NO completion:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewDidDisappear:(BOOL)animated
{
    
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
