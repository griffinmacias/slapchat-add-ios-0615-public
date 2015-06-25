//
//  FISViewController.m
//  slapChat
//
//  Created by Mason Macias on 6/25/15.
//  Copyright (c) 2015 Joe Burgess. All rights reserved.
//

#import "FISViewController.h"
#import "Message.h"
#import "FISDataStore.h"
#import "Message.h"
@interface FISViewController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *messageTextfield;
@property (nonatomic, strong) Message *message;
@property (nonatomic, strong) FISDataStore *dataManager;
@end

@implementation FISViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.messageTextfield.delegate = self;
    self.dataManager = [FISDataStore sharedDataStore];
    self.message = [NSEntityDescription insertNewObjectForEntityForName:@"Message" inManagedObjectContext:self.dataManager.managedObjectContext];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)saveButtonTapped:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:^{
        
    self.message.content = self.messageTextfield.text;
        
        [self.dataManager saveContext];
        
        NSLog(@"%@", self.message.content);
    }];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    
    [textField resignFirstResponder];
    
    return NO;
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
