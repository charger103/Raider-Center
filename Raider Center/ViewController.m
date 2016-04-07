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
@end
//End Default

//Start the Program
//- (void)preUISetUp {
    
   /* NSLog(@"Pre-UI Setup");
    
    
    NSLog([userInformation objectForKey:@"username"], [userInformation objectForKey:@"password"]);
    
    //Check to see if the user has their login saved and, if so, then login. If not, then tell the UI Code that it needs to load the login screen:
    
    if (![[userInformation objectForKey:@"username"] isEqualToString:@""] && ![[userInformation objectForKey:@"password"] isEqualToString:@""]) {
        
        //Check to see if the user has their login saved and, if so, then login. If not, then tell the UI Code that it needs to load the login screen:
        
        if ([userInformation objectForKey:@"username"] != nil && [userInformation objectForKey:@"password"] != nil) {
            NSLog(@"User has username and password stored. Setting username and password variables to the defaults.");
            usernameFromInput = [userInformation objectForKey:@"username"];
            passwordFromInput = [userInformation objectForKey:@"password"];
            sleep(2);
            
            [self performSelector:@selector(checkUser)];
            
        } else {
            NSLog(@"Needs Login Screen");
            needsLoginScreen = YES;
        }
    }
    
    //Called if the login button is pressed:
    - (IBAction)loginButtonPressed {
        [_usernameTextField resignFirstResponder];
        [_passwordTextField resignFirstResponder];
        
        //Send the username and password to the checkUser function:
        usernameFromInput = _usernameTextField.text;
        passwordFromInput = _passwordTextField.text;
        [self performSelector:@selector(checkUser)];
        
    }
    
    
    //Set the default username and password:
    - (IBAction)setDefaultUsernamePassword {
        
        [_usernameTextField resignFirstResponder];
        [_passwordTextField resignFirstResponder];
        
        if (![_usernameTextField.text isEqualToString:@""] && ![_passwordTextField.text isEqualToString:@""]) {
            [userInformation setObject:_usernameTextField.text forKey:@"username"];
            [userInformation setObject:_passwordTextField.text forKey:@"password"];
            
            generalAlertController = [UIAlertController alertControllerWithTitle:@"Success!" message:@"Your username and password defaults have been set!" preferredStyle:UIAlertControllerStyleAlert];
            [generalAlertController addAction:[UIAlertAction actionWithTitle:@"Cool" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) { [self dismissViewControllerAnimated:YES completion:nil];}]];
            [self presentViewController:generalAlertController animated:YES completion:nil];
            
        } else {
            
            NSLog(@"Fail");
            
            generalAlertController = [UIAlertController alertControllerWithTitle:@"Yikes!" message:@"Do not enter blank values. Please try again." preferredStyle:UIAlertControllerStyleAlert];
            [generalAlertController addAction:[UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) { [self dismissViewControllerAnimated:YES completion:nil];}]];
            [self presentViewController:generalAlertController animated:YES completion:nil];
            
        }
    }
    
    
    //Query the server and attempt to log the user in:
    - (void)checkUser {
        
        if (![usernameFromInput isEqualToString:@""] || ![passwordFromInput isEqualToString:@""]) {
            
            hashedPassword = [passwordFromInput MD5];
            
            NSLog(@"HP: %@", hashedPassword);
            
            request = [[NSMutableURLRequest alloc] init];
            [request setURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://circuitapps.com/Raider_Center/SQL_Login.php?server_username=RaiderCenterApp&server_password=Illudiumq36Expl0siveSpaceM0dulat0r&username=%@&password=%@", usernameFromInput, hashedPassword]]];
            [request setHTTPMethod:@"GET"];
            urlData = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
            serverResponse = [[NSString alloc] initWithData:urlData encoding:NSUTF8StringEncoding];
            NSLog(@"%@", serverResponse);
            
            if ([serverResponse isEqualToString:@"SuccessfullyLoggedIn"]) [self performSelector:@selector(userLoggedIn)];
            else if ([serverResponse isEqualToString:@"BadLogin"]) [self performSelector:@selector(userIsNotVerified)];
            else [self performSelector:@selector(unknownLoginError)];
        } else if ([usernameFromInput isEqualToString:@""] || [passwordFromInput isEqualToString:@""]){
            
            NSLog(@"Fail");
            
            generalAlertController = [UIAlertController alertControllerWithTitle:@"Yikes!" message:@"Do not enter blank values. Please try again." preferredStyle:UIAlertControllerStyleAlert];
            [generalAlertController addAction:[UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) { [self dismissViewControllerAnimated:YES completion:nil];}]];
            [self presentViewController:generalAlertController animated:YES completion:nil];
            
        } else [self performSelector:@selector(unknownGeneralError)];
        
    }
    
    //Called if there is an unknown login error:
    - (void)unknownLoginError {
        
        NSLog(@"Login Error Unknown!");
        
        generalAlertController = [UIAlertController alertControllerWithTitle:@"Error!" message:@"There was either an unknown error with your login, or you are not connected to a network. Please contact the tech department if this problem persists." preferredStyle:UIAlertControllerStyleAlert];
        [generalAlertController addAction:[UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) { [self dismissViewControllerAnimated:YES completion:nil];}]];
        [self presentViewController:generalAlertController animated:YES completion:nil];
        
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
        // In order to test the UI I put all those errors into this
            /*
            if (([usernameFromInput isEqualToString:@"user1"] || [usernameFromInput isEqualToString:@"user2"] || [usernameFromInput isEqualToString:@"user3"] || [usernameFromInput isEqualToString:@"user4"] || [usernameFromInput isEqualToString:@"user5"] || [usernameFromInput isEqualToString:@"user6"]|| [usernameFromInput isEqualToString:@"user7"]|| [usernameFromInput isEqualToString:@"user8"] || [usernameFromInput isEqualToString:@"user9"] || [usernameFromInput isEqualToString:@"user10"]) && ([passwordFromInput isEqualToString:@"pass1"] || [passwordFromInput isEqualToString:@"pass2"] || [passwordFromInput isEqualToString:@"pass3"] || [passwordFromInput isEqualToString:@"pass4"] || [passwordFromInput isEqualToString:@"pass5"] || [passwordFromInput isEqualToString:@"pass6"] || [passwordFromInput isEqualToString:@"pass7"] || [passwordFromInput isEqualToString:@"pass8"] || [passwordFromInput isEqualToString:@"pass9"] || [passwordFromInput isEqualToString:@"pass10"])) {
   
   [self performSelector:@selector(userLoggedIn)];
   
            } else {
   
                [self performSelector:@selector(userIsNotVerified)];
                
            }
            //End Example Setup
            >>>>>>> 82a0acfcf2fb66948b6c6cfe40846face5f52a60
            
        }
        
        //Called if the user is not verified
        - (void)userIsNotVerified {
            
            <<<<<<< HEAD
            //Inform the user that the account they entered is not in the SQL Server:
            =======
            //Inform the user that the account they entered is not that of any in the LDAP Server:
            >>>>>>> 82a0acfcf2fb66948b6c6cfe40846face5f52a60
            
            NSLog(@"User Not Verified as a Baylor Student");
            
            generalAlertController = [UIAlertController alertControllerWithTitle:@"Error!" message:@"The Username/Password Combination is Incorrect. Please Try Again!" preferredStyle:UIAlertControllerStyleAlert];
            [generalAlertController addAction:[UIAlertAction actionWithTitle:@"Close" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) { [self dismissViewControllerAnimated:YES completion:nil];}]];
            [self presentViewController:generalAlertController animated:YES completion:nil];
            
        }
        
        //Post-Login
        
        - (void)userLoggedIn {
            
            <<<<<<< HEAD
            //Tell the user that they're logged in:
            
            NSLog(@"User Logged In!");
            
            generalAlertController = [UIAlertController alertControllerWithTitle:@"Success!" message:@"You have successfully logged in!" preferredStyle:UIAlertControllerStyleAlert];
            [generalAlertController addAction:[UIAlertAction actionWithTitle:@"Close" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) { [self dismissViewControllerAnimated:YES completion:nil];}]];
            [self presentViewController:generalAlertController animated:YES completion:nil];
            
            //See if the user is a student or faculty:
            
            request = [[NSMutableURLRequest alloc] init];
            [request setURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://circuitapps.com/Raider_Center/SQL_Query.php?server_username=RaiderCenterApp&password=Illudiumq36Expl0siveSpaceM0dulat0r&username=%@", usernameFromInput]]];
            [request setHTTPMethod:@"GET"];
            urlData = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
            serverResponse = [[NSString alloc] initWithData:urlData encoding:NSUTF8StringEncoding];
            NSLog(@"%@", serverResponse);
            
            if ([serverResponse isEqualToString:@"student"]) isFaculty = NO;
            else if ([serverResponse isEqualToString:@"faculty"]) isFaculty = YES;
            else [self performSelector:@selector(unknownGeneralError)];
            
            //Get User's Data:
            
            //Set up any Variables and inform the user that they are logged in before fetching any information:
            
            NSLog(@"Logged in");
            
            generalAlertController = [UIAlertController alertControllerWithTitle:@"Success!" message:@"Congratulations! You have successfully logged in." preferredStyle:UIAlertControllerStyleAlert];
            [generalAlertController addAction:[UIAlertAction actionWithTitle:@"Cool" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) { [self dismissViewControllerAnimated:YES completion:nil];}]];
            [self presentViewController:generalAlertController animated:YES completion:nil];
            
            [self performSelector:@selector(getData)];
            
        }
        
        //Generally Unkown Error:
        - (void)unknownGeneralError {
            
            NSLog(@"Unknown General Error!");
            
            generalAlertController = [UIAlertController alertControllerWithTitle:@"Yikes!" message:@"RaiderCenter has run in to an unknown error. Please contact the tech department if the problem persists." preferredStyle:UIAlertControllerStyleAlert];
            [generalAlertController addAction:[UIAlertAction actionWithTitle:@"Cool!" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) { [self dismissViewControllerAnimated:YES completion:nil];[self performSelector:@selector(goToMakeUser)];}]];
            [self presentViewController:generalAlertController animated:YES completion:nil];
            
        }
        
        ///////////Begin to fetch Information///////////
        
        //Fetch the user's information:
        - (void)getData {
            
            //Tell the server the username and ask for the rest of the information in that row:
            request = [[NSMutableURLRequest alloc] init];
            [request setURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://circuitapps.com/Raider_Center/SQL_Query.php?server_username=RaiderCenterApp&password=Illudiumq36Expl0siveSpaceM0dulat0r&username=%@", usernameFromInput]]];
            
            ///////////Begin to fetch Information///////////
            
            - (void)getData {
                
                //Tell the server the username and ask for the rest of the information in that row:
                
                request = [[NSMutableURLRequest alloc] init];
                [request setURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://circuitapps.com/Raider_Center/SQL_Query.php?username=%@", usernameFromInput]]];
                [request setHTTPMethod:@"GET"];
                urlData = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
                serverResponse = [[NSString alloc] initWithData:urlData encoding:NSUTF8StringEncoding];
                NSLog(@"%@", serverResponse);
                
                NSData *imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://circuitapps.com/Raider_Center/Feed_Files/Users/%@/userimage.jpg", usernameFromInput]]];
                userImage = [UIImage imageWithData:imageData];
                
                if ([serverResponse isEqualToString:@"NoMatchingUsers"]) [self performSelector:@selector(needsToCreateUser)];
                else if ([serverResponse isEqualToString:@"UnknownError"]) [self performSelector:@selector(unknownGeneralError)];
                else {
                    
                    int insertChar = 143;
                    
                    responseArray = [serverResponse componentsSeparatedByString:[NSString stringWithFormat:@"%c", insertChar]];
                    
                    responseDictionary= [[NSDictionary alloc] initWithObjects:responseArray forKeys:USEKeys];
                    
                    [self performSelector:@selector(getPosts)];
                    
                    
                }
                
            }
            
            //Get posts from the user's follow list:
            - (void)getPosts {
                
                NSArray *postsArray[[responseArray[1] integerValue]][1];
                NSString *currentFollowee;
                
                for (int i; i < [responseArray[1] integerValue]; i++) {
                    
                    request = [[NSMutableURLRequest alloc] init];
                    [request setURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://circuitapps.com/Raider_Center/SQL_ReturnPost?followee=%@", currentFollowee]]];
                    [request setHTTPMethod:@"GET"];
                    urlData = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
                    serverResponse = [[NSString alloc] initWithData:urlData encoding:NSUTF8StringEncoding];
                    
                }
                
                if ([serverResponse isEqualToString:@"NoMatchingUsers"]) [self performSelector:@selector(needsToCreateUser)];
                else if ([serverResponse isEqualToString:@"UnknownError"]) [self performSelector:@selector(unknownError)];
                else {
                    
                    responseArray = [serverResponse componentsSeparatedByString:@":"];
                    
                    responseDictionary= [[NSDictionary alloc] initWithObjects:responseArray forKeys:responseArray];
                    
                    
                }
                
            }
            
            //Send the user to the correct UI form to enter their information:
            - (void)needsToCreateUser {
                
                NSLog(@"Needs to make user.");
                
                generalAlertController = [UIAlertController alertControllerWithTitle:@"Yikes!" message:@"Even though you have successfully logged in, you still need to make your accout." preferredStyle:UIAlertControllerStyleAlert];
                [generalAlertController addAction:[UIAlertAction actionWithTitle:@"Cool!" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) { [self dismissViewControllerAnimated:YES completion:nil];[self performSelector:@selector(goToMakeUser)];}]];
                [self presentViewController:generalAlertController animated:YES completion:nil];
                
                [self performSelector:@selector(goToMakeUser)];
                
            }
            
            //Create a new user:
            - (void)createNewUser {
                
                request = [[NSMutableURLRequest alloc] init];
                [request setURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://circuitapps.com/Raider_Center/SQL_CreateUser.php?server_username=RaiderCenterApp&password=Illudiumq36Expl0siveSpaceM0dulat0r&username=%@&numfollowing=%d&followees=%@&classes=%@", usernameFromInput, USEnum_following, USEfollowees, USEclasses]]];
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
                else [self performSelector:@selector(unknownCreateError)];
            }
            
            //Unknown error while creating user:
            - (void)unknownCreateError {
                
                NSLog(@"User Could Not be Created!");
                
                generalAlertController = [UIAlertController alertControllerWithTitle:@"Error!" message:@"There was an error while attempting to create your account. Please try Again. If the problem persists, please contact the tech department." preferredStyle:UIAlertControllerStyleAlert];
                else [self performSelector:@selector(unknownError)];
            }
            
            
            - (void)unknownError {
                
                NSLog(@"User Could Not be Created!");
                
                generalAlertController = [UIAlertController alertControllerWithTitle:@"Failed!" message:@"The server was unable to create a user. Please try Again. If the problem persists, please contact the tech department." preferredStyle:UIAlertControllerStyleAlert];
                [generalAlertController addAction:[UIAlertAction actionWithTitle:@"Cool" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) { [self dismissViewControllerAnimated:YES completion:nil];}]];
                [self presentViewController:generalAlertController animated:YES completion:nil];
                
                
            }
            
            //Refresh the user's info:
            - (void)refreshInfo {
                
                [self performSelector:@selector(getData)];
                
            }
            
            //Change the user's password:
            - (void)changePassword {
                
                if ([changePasswordPassword isEqualToString:changePasswordPasswordTest]) {
                    
                    request = [[NSMutableURLRequest alloc] init];
                    [request setURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://circuitapps.com/Raider_Center/SQL_ChangePassword.php?server_username=RaiderCenterApp&password=Illudiumq36Expl0siveSpaceM0dulat0r&username=%@&password=%@&oldpassword=%@", usernameFromInput, hashedPassword, changePasswordOldPassword]]];
                    [request setHTTPMethod:@"GET"];
                    urlData = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
                    serverResponse = [[NSString alloc] initWithData:urlData encoding:NSUTF8StringEncoding];
                    NSLog(@"%@", serverResponse);
                    
                    if ([serverResponse isEqualToString:@"PasswordSuccessfullyChanged"]) {
                        
                        generalAlertController = [UIAlertController alertControllerWithTitle:@"Yay!" message:@"You have succesfully changed your password." preferredStyle:UIAlertControllerStyleAlert];
                        [generalAlertController addAction:[UIAlertAction actionWithTitle:@"Cool" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) { [self dismissViewControllerAnimated:YES completion:nil];}]];
                        [self presentViewController:generalAlertController animated:YES completion:nil];
                        
                    } else [self performSelector:@selector(unknownPasswordChangeError)];
                    
                } else if (![changePasswordPassword isEqualToString:changePasswordPasswordTest]){
                    
                    generalAlertController = [UIAlertController alertControllerWithTitle:@"Yikes!" message:@"The passwords do not match. Please try again!" preferredStyle:UIAlertControllerStyleAlert];
                    [generalAlertController addAction:[UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) { [self dismissViewControllerAnimated:YES completion:nil];}]];
                    [self presentViewController:generalAlertController animated:YES completion:nil];
                    
                }
                
            }
            
            
            //Unknown Password change error:
            - (void)unknownPasswordChangeError {
                
                generalAlertController = [UIAlertController alertControllerWithTitle:@"Yikes!" message:@"An error occurred while attempting to change your password. Please try again. Contact the tech department if this problem persists." preferredStyle:UIAlertControllerStyleAlert];
                [generalAlertController addAction:[UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) { [self dismissViewControllerAnimated:YES completion:nil];}]];
                [self presentViewController:generalAlertController animated:YES completion:nil];
                
            }
            
            
            //Post a post to the server:
            - (void)postToServer {
                
                if (![postToPost isEqualToString:@""]) {
                    
                    request = [[NSMutableURLRequest alloc] init];
                    [request setURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://circuitapps.com/Raider_Center/SQL_ChangePassword.php?server_username=RaiderCenterApp&password=Illudiumq36Expl0siveSpaceM0dulat0r&username=%@&importance=%d&post=%@", usernameFromInput, postImportance, postToPost]]];
                    [request setHTTPMethod:@"GET"];
                    urlData = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
                    serverResponse = [[NSString alloc] initWithData:urlData encoding:NSUTF8StringEncoding];
                    NSLog(@"%@", serverResponse);
                    
                    if ([serverResponse isEqualToString:@"SuccessfullyPosted"]) {
                        
                        generalAlertController = [UIAlertController alertControllerWithTitle:@"Yay!" message:@"You have successfully added a post!" preferredStyle:UIAlertControllerStyleAlert];
                        [generalAlertController addAction:[UIAlertAction actionWithTitle:@"Cool" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) { [self dismissViewControllerAnimated:YES completion:nil];}]];
                        [self presentViewController:generalAlertController animated:YES completion:nil];
                        
                    } else [self performSelector:@selector(unknownGeneralError)];
                    
                } else {
                    
                    generalAlertController = [UIAlertController alertControllerWithTitle:@"Yikes!" message:@"Please do not enter blank values." preferredStyle:UIAlertControllerStyleAlert];
                    [generalAlertController addAction:[UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) { [self dismissViewControllerAnimated:YES completion:nil];}]];
                    [self presentViewController:generalAlertController animated:YES completion:nil];
                    
                }
                
                
            }*/
            
            //Set UI Variables and call the UI:
            /*- (void)passInfoToUI {
                
                USEusername = responseArray[0];
                USEnum_following = [responseArray[1] integerValue];
                
                - (void)passInfoToUI {
                    
                    USEusername = responseArray[0];
                    USEnum_following = responseArray[1];
                    USEfollowees = [responseArray[2] componentsSeparatedByString:@" , "];
                    USEclasses = [responseArray[3] componentsSeparatedByString:@" , "];
                    
                    NSLog(@"People%@",USEfollowees);
                    
                    [self performSelector:@selector(startUI)];
                    
                }
                
                //Tell the UI to go to the make user screen:
                - (void)goToMakeUser {
                    
                    NSLog(@"Told UI to go to make user screen!");
                    
                }
                */
                //Start the UI:
                /*- (void)startUI {
                    
                    //Start UI (other than login screen):
                    
                }
             
  */


