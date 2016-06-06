//
//  LeftMenuHeaderView.h
//  LivePathTracker
//
//  Created by Nabeel Arif on 2/21/16.
//  Copyright © 2016 Nabeel Arif. All rights reserved.
//

#import <UIKit/UIKit.h>
/**
 Header of Left Menu view. It is used to provide some nice look to the Left Menu.
 The header is flexible and user can pull the bottom menu i.e table. The header
 adjusts itself on top and icon of the app remains in the middle. We will replace the icon
 of the application with User's profile picture in future when we will provide its support.
 */
@interface LeftMenuHeaderView : UIView
/**
 A Factory method for the UIView. It will generate a view of current class and return.
*/
+ (instancetype)instantiateFromNib;
/**
 The image view at the center of Header, currently it is being used for app icon but in future
 we will use it for current user's profile picture when we will allow users to login.
 */
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end
