//
//  ViewController.m
//  Raider Center
//
//  Created by Nick Perlaky on 12/8/15.
//  Copyright © 2015 BaylorDEV. All rights reserved.
//

#import "ViewController.h"
#import <JSBadgeView/JSBadgeView.h>
@interface ViewController ()

@end


@implementation ViewController

//Default
////////////////////////////////////////////////////
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Raider Center";
    UILabel *label = [UILabel new];
    [label setFrame:CGRectMake(0, 0, 40, 30)];
    [label setText:@"Raider Center"];
    [label setTextAlignment:NSTextAlignmentCenter];
    [label setTextColor:[UIColor redColor]];
    
    
    
    self.title = @"Raidar Center";
     
    [self performSelector:@selector(preUISetUp)];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
////////////////////////////////////////////////////
//End Default


//Start the Program
- (void)preUISetUp {
    
    NSLog(@"Pre-UI Setup");
    
    //Check to see if the user has their login saved and, if so, then login. If not, then tell the UI Code that it needs to load the login screen:
    
    if ([userInformation objectForKey:@"username"] != nil && [userInformation objectForKey:@"password"] != nil) {
        
        NSLog(@"User has username and password stored. Setting username and password variables to the defaults.");
        usernameFromInput = [userInformation objectForKey:@"username"];
        passwordFromInput = [userInformation objectForKey:@"password"];
        [self performSelector:@selector(checkUser)];
    
    } else {
        
        needsLoginScreen = YES;
        
    }
}

//Called if the login button is pressed:
- (IBAction)loginButtonPressed {
    
    
    
    //Send the username and password to the checkUser function:
   
        
    usernameFromInput = _usernameTextField.text;
    passwordFromInput = _passwordTextField.text;
    [self performSelector:@selector(checkUser)];
    
}


//Query the LDAP server and attempt to log the user in:
- (void)checkUser {
    
    
    /*For now, test using the assumption that whomever is indeed on the LDAP Server
    //Send Encrypted username and password to server to verify that the user is in the LDAP Server:
    
    
    //After the server has returned a value, determine what to do with it:
    if (userIsLoggedIn == TRUE) [self performSelector:@selector(userIsVerified)];
    else if (userIsLoggedIn == false) [self performSelector:@selector(userIsNotVerified)];
     
     NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
     [request setURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://circuitapps.com/Raider_Center/SQL_Query.php?username=%@", usernameFromInput]]];
     [request setHTTPMethod:@"GET"];
     NSData *urlData = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
     NSString *serverResponse = [[NSString alloc] initWithData:urlData encoding:NSUTF8StringEncoding];
     NSLog(@"%@", serverResponse);

     
     */
    
    //Example Setup
    
    if (([usernameFromInput isEqualToString:@"user1"] || [usernameFromInput isEqualToString:@"user2"] || [usernameFromInput isEqualToString:@"user3"] || [usernameFromInput isEqualToString:@"user4"] || [usernameFromInput isEqualToString:@"user5"] || [usernameFromInput isEqualToString:@"user6"]|| [usernameFromInput isEqualToString:@"user7"]|| [usernameFromInput isEqualToString:@"user8"] || [usernameFromInput isEqualToString:@"user9"] || [usernameFromInput isEqualToString:@"user10"]) && ([passwordFromInput isEqualToString:@"pass1"] || [passwordFromInput isEqualToString:@"pass2"] || [passwordFromInput isEqualToString:@"pass3"] || [passwordFromInput isEqualToString:@"pass4"] || [passwordFromInput isEqualToString:@"pass5"] || [passwordFromInput isEqualToString:@"pass6"] || [passwordFromInput isEqualToString:@"pass7"] || [passwordFromInput isEqualToString:@"pass8"] || [passwordFromInput isEqualToString:@"pass9"] || [passwordFromInput isEqualToString:@"pass10"])) {
        
        [self performSelector:@selector(userLoggedIn)];
        
    } else {
        
        [self performSelector:@selector(userIsNotVerified)];
        
    }
    //End Example Setup
    
}

//Called if the user is not verified
- (void)userIsNotVerified {
    
    //Inform the user that the account they entered is not that of any in the LDAP Server:
    
    NSLog(@"User Not Verified as a Baylor Student");
    
    generalAlertController = [UIAlertController alertControllerWithTitle:@"Error!" message:@"The Username/Password Combination is Incorrect. Please Try Again!" preferredStyle:UIAlertControllerStyleAlert];
    [generalAlertController addAction:[UIAlertAction actionWithTitle:@"Close" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) { [self dismissViewControllerAnimated:YES completion:nil];}]];
    [self presentViewController:generalAlertController animated:YES completion:nil];
    
}

//Post-Login

- (void)userLoggedIn {
    
    //Set up any Variables and inform the user that they are logged in before fetching any information:
    
    NSLog(@"Logged in");
    
    generalAlertController = [UIAlertController alertControllerWithTitle:@"Success!" message:@"Congratulations! You have successfully logged in." preferredStyle:UIAlertControllerStyleAlert];
    [generalAlertController addAction:[UIAlertAction actionWithTitle:@"Cool" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) { [self dismissViewControllerAnimated:YES completion:nil];}]];
    [self presentViewController:generalAlertController animated:YES completion:nil];
    
    [self performSelector:@selector(getData)];
    
}

///////////Begin to fetch Information///////////

- (void)getData {
    
    //Tell the server the username and ask for the rest of the information in that row:
    
    request = [[NSMutableURLRequest alloc] init];
    [request setURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://circuitapps.com/Raider_Center/SQL_Query.php?username=%@", usernameFromInput]]];
    [request setHTTPMethod:@"GET"];
    urlData = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    serverResponse = [[NSString alloc] initWithData:urlData encoding:NSUTF8StringEncoding];
    NSLog(@"%@", serverResponse);
    
    if ([serverResponse isEqualToString:@"NoMatchingUsers"]) [self performSelector:@selector(needsToCreateUser)];
    else if ([serverResponse isEqualToString:@"UnknownError"]) [self performSelector:@selector(unknownError)];
    else {
        
        responseArray = [serverResponse componentsSeparatedByString:@":"];
        
        responseDictionary= [[NSDictionary alloc] initWithObjects:responseArray forKeys:responseArray];
        
        
    }
    
}

//Send the user to the correct UI form to enter their information:
- (void)needsToCreateUser {
    
    needsCreateUserScreen = YES;
    
}

- (void)createNewUser {
    
    request = [[NSMutableURLRequest alloc] init];
    [request setURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://circuitapps.com/Raider_Center/SQL_CreateUser.php?server_username=RaiderCenterApp&password=Illudiumq36Expl0siveSpaceM0dulat0r&username=%@&numfollowing=10&followees=scott%20,%20john%20,%20lisa&classes=math%20,%20science%20,%20biology", usernameFromInput]]];
    [request setHTTPMethod:@"GET"];
    urlData = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    serverResponse = [[NSString alloc] initWithData:urlData encoding:NSUTF8StringEncoding];
    NSLog(@"%@", serverResponse);
    
    if ([serverResponse isEqualToString:@"UserSuccessfullyCreated"]) [self performSelector:@selector(getData)];
    else [self performSelector:@selector(unknownError)];
}


- (void)unknownError {
    
    NSLog(@"User Could Not be Created!");
    
    generalAlertController = [UIAlertController alertControllerWithTitle:@"Failed!" message:@"The server was unable to create a user. Please try Again. If the problem persists, please contact the tech department." preferredStyle:UIAlertControllerStyleAlert];
    [generalAlertController addAction:[UIAlertAction actionWithTitle:@"Cool" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) { [self dismissViewControllerAnimated:YES completion:nil];}]];
    [self presentViewController:generalAlertController animated:YES completion:nil];

    
}


- (void)passInfoToUI {
    
    USEusername = responseArray[0];
    USEnum_following = responseArray[1];
    USEfollowees = [responseArray[2] componentsSeparatedByString:@" , "];
    USEclasses = [responseArray[3] componentsSeparatedByString:@" , "];
    
    NSLog(@"People%@",USEfollowees);
    
}


@end
