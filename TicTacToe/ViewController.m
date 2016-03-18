//
//  ViewController.m
//  TicTacToe
//
//  Created by David Iskander on 3/17/16.
//  Copyright © 2016 DIskander. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

//1st coulmn of buttons
@property (weak, nonatomic) IBOutlet UIButton *buttonA0;
@property (weak, nonatomic) IBOutlet UIButton *buttonA1;
@property (weak, nonatomic) IBOutlet UIButton *buttonA2;

//2nd coulmn of buttons
@property (weak, nonatomic) IBOutlet UIButton *buttonB0;
@property (weak, nonatomic) IBOutlet UIButton *buttonB1;
@property (weak, nonatomic) IBOutlet UIButton *buttonB2;

//3rd coulmn of buttons
@property (weak, nonatomic) IBOutlet UIButton *buttonC0;
@property (weak, nonatomic) IBOutlet UIButton *buttonC1;
@property (weak, nonatomic) IBOutlet UIButton *buttonC2;

@property (weak, nonatomic) IBOutlet UILabel *turnLabel;

@property NSArray *tiles;
@property BOOL isXTurn;

@end

@implementation ViewController


// User playing
- (IBAction)onButtonPress:(UIButton *)sender {
    NSLog(@"Button pressed: %@", [sender currentTitle]);
    [self setButtonLabel:sender];
    [self changeTurn];
    
}


-(NSString *)playerMark{
    if (self.isXTurn) {
        return @"X";
    } else {
        return @"O";
    }
}

- (void)setButtonLabel:(UIButton *)button {

    // set label
    [button setTitle:[self playerMark] forState:UIControlStateNormal];

    // disable button
    button.enabled = NO;
}


- (void)changeTurn {
    self.isXTurn = ! self.isXTurn;
    self.turnLabel.text = [self playerMark];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.isXTurn = YES;
    self.tiles =
    @[
      @[self.buttonA0, self.buttonA1, self.buttonA2],
      @[self.buttonB0, self.buttonB1, self.buttonB2],
      @[self.buttonC0, self.buttonC1, self.buttonC2]
      ];
    
    for (int x = 0; x < 3; x++) {
        for (int y = 0; y < 3; y++) {
            UIButton *button = self.tiles[x][y];

            
            NSString *myName = [NSString stringWithFormat:@"%i, %i", x, y];
            [button setTitle:myName forState:UIControlStateNormal];
            //NSLog([NSString stringWithFormat:@"%i, %i", x, y]);
        }
    }
   
}




@end
