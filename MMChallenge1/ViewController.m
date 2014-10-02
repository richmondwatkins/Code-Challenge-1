//
//  ViewController.m
//  MMChallenge1
//
//  Created by Richmond on 10/2/14.
//  Copyright (c) 2014 Richmond. All rights reserved.
//

#import "ViewController.h"
#import "ChallengeWebViewController.h"
@interface ViewController ()
@property (strong, nonatomic) IBOutlet UITextField *valueOne;
@property (strong, nonatomic) IBOutlet UITextField *valueTwo;
@property (strong, nonatomic) IBOutlet UINavigationItem *viewTitle;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *webViewButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.webViewButton.enabled = NO;
}


- (IBAction)onCalculatePressed:(id)sender {
    int answer = self.valueOne.text.intValue * self.valueTwo.text.intValue;
    self.viewTitle.title = [NSString stringWithFormat:@"%i", answer];

    if(answer % 5 == 0){
        self.webViewButton.enabled = YES;
    }else{
        self.webViewButton.enabled = NO;
    }
    
    [self.view endEditing:YES];
}

- (IBAction)tapOnView:(UITouch *)touchGesture {
    [self.view endEditing:YES];

}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    ChallengeWebViewController *challengeWebViewController = segue.destinationViewController;
    challengeWebViewController.pageTitle = self.viewTitle.title;
}

@end
