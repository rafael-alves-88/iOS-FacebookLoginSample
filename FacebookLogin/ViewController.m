//
//  ViewController.m
//  FacebookLogin
//
//  Created by Rafael Alves on 15/09/16.
//  Copyright © 2016 Rafael. All rights reserved.
//

#import "ViewController.h"
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self.ivPhoto.layer setBorderColor: [[UIColor blackColor] CGColor]];
    [self.ivPhoto.layer setBorderWidth: 2.0];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnFacebookLogin:(UIButton *)sender {
    FBSDKLoginManager *login = [[FBSDKLoginManager alloc] init];
    [login logInWithReadPermissions: @[@"public_profile", @"email", @"user_friends"] fromViewController:self
                            handler:^(FBSDKLoginManagerLoginResult *result, NSError *error) {
                                if (error) {
                                    NSLog(@"Process error");
                                } else if (result.isCancelled) {
                                    NSLog(@"Cancelled");
                                } else {
                                    NSLog(@"Logged in");
                                    
                                    [[[FBSDKGraphRequest alloc] initWithGraphPath:@"me" parameters:@{@"fields": @"picture, name, email"}] startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection, id result, NSError *error) {
                                        
                                        if (!error) {
                                            NSLog(@"fetched user:%@", result);
                                            self.lblName.text = result[@"name"];
                                            self.lblEmail.text = result[@"email"];
                                            
                                            [self.indLoadingPhoto startAnimating];
                                            dispatch_async(dispatch_get_global_queue(0,0), ^{
                                                NSString *imageURL = [NSString stringWithFormat:@"https://graph.facebook.com/%@/picture?type=small", result[@"id"]];
                                                NSData * data = [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString: imageURL]];
                                                if (!(data == nil)) {
                                                    UIImage *image = [[UIImage alloc] initWithData:data];
                                                    self.ivPhoto.image = image;
                                                }
                                                
                                                [self.indLoadingPhoto stopAnimating];
                                            });
                                        }
                                    }];
                                }
                            }];
}


@end
