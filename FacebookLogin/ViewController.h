//
//  ViewController.h
//  FacebookLogin
//
//  Created by Rafael Alves on 15/09/16.
//  Copyright © 2016 Rafael. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *ivPhoto;
@property (weak, nonatomic) IBOutlet UILabel *lblName;
@property (weak, nonatomic) IBOutlet UILabel *lblEmail;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *indLoadingPhoto;

@end

