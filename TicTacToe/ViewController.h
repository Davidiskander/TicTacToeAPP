//
//  ViewController.h
//  TicTacToe
//
//  Created by David Iskander on 3/17/16.
//  Copyright © 2016 DIskander. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

{
NSTimer *timer;
}

-(void)updateCounter:(NSTimer *)theTimer;
-(void)countdownTimer;


@end

