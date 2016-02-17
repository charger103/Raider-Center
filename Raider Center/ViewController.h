//
//  ViewController.h
//  Raider Center
//
//  Created by Nick Perlaky on 12/8/15.
//  Copyright © 2015 BaylorDEV. All rights reserved.
//



#import <UIKit/UIKit.h>


@interface ViewController : UIViewController {
    
    //UI Variables (Kevin)
    
    UIView *loginView;
    //Login Variables
    
    //UITextField *usernameTextField;
    //UITextField *passwordTextField;
    UIButton *loginButton;
    
    ////////////////Functional Variables (Nick)////////////////
    
    
    //Username Input Variables
    
    NSString *usernameFromInput;
    NSString *passwordFromInput;
    NSUserDefaults *userInformation;
    UIAlertController *generalAlertController;
    BOOL needsLoginScreen;
    BOOL needsCreateUserScreen;
    BOOL ifAnythingNull;
    
    //Password Verification With Server Variables
    
    BOOL userIsLoggedIn;
    NSString *hashedUsername;
    NSString *hashedPassword;
    
    //Server Download/Communication Variables
    
    NSMutableURLRequest *request;
    NSData *urlData;
    NSString *serverResponse;
    NSArray *responseArray;
    NSDictionary *responseDictionary;
    
    //Post-Download Object Variables
    
    NSString *USEusername;
    NSString *USEnum_following;
    NSArray *USEfollowees;
    NSArray *USEclasses;
    
    UITextField *_usernameTextField;
    UITextField *_passwordTextField;
    
    
}
@end


//UI Variables (Kevin)



