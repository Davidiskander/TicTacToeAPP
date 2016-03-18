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
    [self setButtonTitle:sender];
    //isGameOver
    if ([self isGameOver]) {
        NSLog(@"GAME OVER");
    }
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

            
- (NSString *)getButtonTitle:(UIButton *)button {
    return [button titleForState:[button state]];
}
- (void)setButtonTitle:(UIButton *)button {
    
    // set label
    [button setTitle:[self playerMark] forState:UIControlStateNormal];
    [button setTitle:[self playerMark] forState:UIControlStateDisabled];
    
    // disable button
    button.enabled = NO;
}


#pragma mark -
#pragma mark isGameOver


- (BOOL)isGameOver {
    int n = self.tiles.count;
    
    // check each row
    for (int i = 0; i < n; i++) {
        if ([self isWinningRow:i]) { return YES; }
    }
    
    // check each column
    for (int i = 0; i < n; i++) {
        if ([self isWinningColumn:i]) { return YES; }
    }
    
    // check diagonals
    if ([self isWinningDiagSoutheast]) { return YES; }
    if ([self isWinningDiagNortheast]) { return YES; }
    
    // no winning scenarios
    return NO;
}

- (BOOL)isWinningRow:(int)y {
    UIButton *firstButton = self.tiles[0][y];
    NSString *first = [self getButtonTitle:firstButton];
    if (! first) { return NO; }
    
    int n = self.tiles.count;
    for (int x = 1; x < n; x++) {
        UIButton *otherButton = self.tiles[x][y];
        NSString *other = [self getButtonTitle:otherButton];
        if ([other isEqualToString:first]) {
            // match: keep checking
        } else {
            // different: not a winner
            return NO;
        }
    }
    // all tiles matched: winner
    return YES;
}

- (BOOL)isWinningColumn:(int)x {
    UIButton *firstButton = self.tiles[x][0];
    NSString *first = [self getButtonTitle:firstButton];
    if (! first) { return NO; }
    
    int n = self.tiles.count;
    for (int y = 1; y < n; y++) {
        UIButton *otherButton = self.tiles[x][y];
        NSString *other = [self getButtonTitle:otherButton];
        if ([other isEqualToString:first]) {
            // match: keep checking
        } else {
            // different: not a winner
            return NO;
        }
    }
    // all tiles matched: winner
    return YES;
}

// diagonal #1: (0,0) to (2,2)
- (BOOL)isWinningDiagSoutheast {
    UIButton *firstButton = self.tiles[0][0];
    NSString *first = [self getButtonTitle:firstButton];
    if (! first) { return NO; }
    
    int n = self.tiles.count;
    for (int xy = 1; xy < n; xy++) {
        UIButton *otherButton = self.tiles[xy][xy];
        NSString *other = [self getButtonTitle:otherButton];
        if ([other isEqualToString:first]) {
            // match: keep checking
        } else {
            // different: not a winner
            return NO;
        }
    }
    // all tiles matched: winner
    return YES;
}

// diagonal #1: (0,0) to (2,2)
- (BOOL)isWinningDiagNortheast {
    int n = self.tiles.count;
    UIButton *firstButton = self.tiles[n-1][0];
    NSString *first = [self getButtonTitle:firstButton];
    if (! first) { return NO; }
    
    for (int xy = 1; xy < n; xy++) {
        UIButton *otherButton = self.tiles[xy][n-1-xy];
        NSString *other = [self getButtonTitle:otherButton];
        if ([other isEqualToString:first]) {
            // match: keep checking
        } else {
            // different: not a winner
            return NO;
        }
    }
    // all tiles matched: winner
    return YES;
}


@end
