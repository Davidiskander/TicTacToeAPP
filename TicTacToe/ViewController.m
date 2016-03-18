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
@property (weak, nonatomic) IBOutlet UILabel *winnerName;
@property (weak, nonatomic) IBOutlet UIButton *resetButton;

@property NSArray *tiles;
@property BOOL isXTurn;

@end




@implementation ViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    [self.resetButton setHidden:YES];  //NOT hidden if Game is Over
    self.isXTurn = YES;
    // initialize tile grid
    self.tiles =
    @[
      @[self.buttonA0, self.buttonA1, self.buttonA2],
      @[self.buttonB0, self.buttonB1, self.buttonB2],
      @[self.buttonC0, self.buttonC1, self.buttonC2]
      ];

    
    for (int x = 0; x < self.tiles.count; x++) {
        for (int y = 0; y < self.tiles.count; y++) {
            UIButton *button = self.tiles[x][y];
            button.backgroundColor = [UIColor redColor];

            NSString *myName = [NSString stringWithFormat:@"%i, %i", x, y];
            [button setTitle:myName forState:UIControlStateNormal];
            //NSLog([NSString stringWithFormat:@"%i, %i", x, y]);
        }
    }
    
}

// User playing
- (IBAction)onButtonPress:(UIButton *)sender {
    NSLog(@"Button pressed: %@", [sender currentTitle]);
    [self setButtonLabel:sender];
    //isGameOver
    //winner = sender
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



- (void) endGame {
    //NSString *winnerStatment = [NSString stringWithFormat:@"The winner is %@\n just saying .. %@ sucks!", CHANGE ME, CHANGE ME]
    //[self.winnerName.text = winnerStatment];
}


- (IBAction)resetGame:(UIButton *)sender {
    for (int x = 0; x < self.tiles.count; x++) {
        for (int y = 0; y < self.tiles.count; y++) {
            UIButton *button = self.tiles[x][y];
            button.enabled = YES;
        }
    }
    self.winnerName.text = nil;
}

            


@end
