//
//  PCNameViewController.m
//  PunchClock
//
//  Created by James Moore on 3/13/14.
//  Copyright (c) 2014 Panic Inc. All rights reserved.
//

#import "PCNameViewController.h"
@import QuartzCore;


@interface PCNameViewController()
@property (strong, nonatomic) IBOutlet UITextField *emailField;

@end

@implementation PCNameViewController

- (void)viewDidAppear:(BOOL)animated
{
	self.emailField.layer.cornerRadius = 3.0;
	
	self.emailField.text = [[NSUserDefaults standardUserDefaults] stringForKey:@"email"];
	[self.emailField becomeFirstResponder];
}

#pragma mark - UITextFieldDelegate
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField
{
	if ([textField.text isEqualToString:@""]) {
		return NO;
	} else {
		return YES;
	}
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
	if (![textField.text isEqualToString:@""]) {
		[[NSUserDefaults standardUserDefaults] setObject:textField.text forKey:@"email"];
		[[NSUserDefaults standardUserDefaults] synchronize];

		[self mz_dismissFormSheetControllerAnimated:YES completionHandler:nil];

	}
}

@end
