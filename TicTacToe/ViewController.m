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
@property (weak, nonatomic) IBOutlet UIButton *buttonA3;
@property (weak, nonatomic) IBOutlet UIButton *buttonA4;

//2nd coulmn of buttons
@property (weak, nonatomic) IBOutlet UIButton *buttonB0;
@property (weak, nonatomic) IBOutlet UIButton *buttonB1;
@property (weak, nonatomic) IBOutlet UIButton *buttonB2;
@property (weak, nonatomic) IBOutlet UIButton *buttonB3;
@property (weak, nonatomic) IBOutlet UIButton *buttonB4;

//3rd coulmn of buttons
@property (weak, nonatomic) IBOutlet UIButton *buttonC0;
@property (weak, nonatomic) IBOutlet UIButton *buttonC1;
@property (weak, nonatomic) IBOutlet UIButton *buttonC2;
@property (weak, nonatomic) IBOutlet UIButton *buttonC3;
@property (weak, nonatomic) IBOutlet UIButton *buttonC4;

//4th coulmn of buttons
@property (weak, nonatomic) IBOutlet UIButton *buttonD0;
@property (weak, nonatomic) IBOutlet UIButton *buttonD1;
@property (weak, nonatomic) IBOutlet UIButton *buttonD2;
@property (weak, nonatomic) IBOutlet UIButton *buttonD3;
@property (weak, nonatomic) IBOutlet UIButton *buttonD4;

//5th coulmn of buttons
@property (weak, nonatomic) IBOutlet UIButton *buttonE0;
@property (weak, nonatomic) IBOutlet UIButton *buttonE1;
@property (weak, nonatomic) IBOutlet UIButton *buttonE2;
@property (weak, nonatomic) IBOutlet UIButton *buttonE3;
@property (weak, nonatomic) IBOutlet UIButton *buttonE4;

// Stack views
@property (weak, nonatomic) IBOutlet UIStackView *colomn0;
@property (weak, nonatomic) IBOutlet UIStackView *colomn1;
@property (weak, nonatomic) IBOutlet UIStackView *colomn2;
@property (weak, nonatomic) IBOutlet UIStackView *colomn3;
@property (weak, nonatomic) IBOutlet UIStackView *colomn4;

@property (weak, nonatomic) IBOutlet UILabel *turnLabel;
@property (weak, nonatomic) IBOutlet UILabel *winnerName;
@property (weak, nonatomic) IBOutlet UIButton *resetButton;
@property (weak, nonatomic) IBOutlet UISegmentedControl *gameMode;
@property (weak, nonatomic) IBOutlet UIButton *startGame;


@property NSArray *tiles;
@property BOOL isXTurn;


@end




@implementation ViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    [self.resetButton setHidden:YES];
    [self.startGame setHidden: NO];

    
    self.colomn0.hidden = YES;
    self.colomn1.hidden = YES;
    self.colomn2.hidden = YES;
    self.colomn3.hidden = YES;
    self.colomn4.hidden = YES;

    self.isXTurn = YES;
    
    // initialize tile grid
    self.tiles =
    @[
      @[self.buttonA0, self.buttonA1, self.buttonA2, self.buttonA3, self.buttonA4],
      @[self.buttonB0, self.buttonB1, self.buttonB2, self.buttonB3, self.buttonB4],
      @[self.buttonC0, self.buttonC1, self.buttonC2, self.buttonC3, self.buttonC4],
      @[self.buttonD0, self.buttonD1, self.buttonD2, self.buttonD3, self.buttonD4],
      @[self.buttonE0, self.buttonE1, self.buttonE2, self.buttonE3, self.buttonE4]
      ];

    
    for (int x = 0; x < self.tiles.count; x++) {
        for (int y = 0; y < self.tiles.count; y++) {
            UIButton *button = self.tiles[x][y];
            button.backgroundColor = [UIColor grayColor];
//
//            NSString *myName = [NSString stringWithFormat:@""];
//            [button setTitle:myName forState:UIControlStateNormal];

            //NSString *myName = [NSString stringWithFormat:@"%i, %i", x, y];
            //[button setTitle:myName forState:UIControlStateNormal];
            //NSLog([NSString stringWithFormat:@"%i, %i", x, y]);
            //[button  setTitle:stringWithFormat:@"a" forState:<#(UIControlState)#>];

        }
    }
    
}


- (IBAction)gameModeButtonPressed:(UISegmentedControl *)sender {
   
    }


- (IBAction)onGameStartPressed:(UIButton *)sender {
    self.startGame.hidden = YES;
    self.gameMode.enabled = NO;
    self.turnLabel.text = @"Player 1";

    if (self.gameMode.selectedSegmentIndex == 0) {
        //do stuff;
        NSLog(@"3x3");
        self.colomn0.hidden = NO;
        self.colomn1.hidden = NO;
        self.colomn2.hidden = NO;
        self.buttonD0.hidden = self.buttonD1.hidden = self.buttonD2.hidden = YES;
        self.buttonE0.hidden = self.buttonE1.hidden = self.buttonE2.hidden = YES;
        self.buttonE3.hidden = NO;
        
        
    } else if(self.gameMode.selectedSegmentIndex == 1) {
        // do stuff;
        NSLog(@"4x4");
        self.colomn0.hidden = NO;
        self.colomn1.hidden = NO;
        self.colomn2.hidden = NO;
        self.colomn3.hidden = NO;
        self.buttonE0.hidden = self.buttonE1.hidden = self.buttonE2.hidden = self.buttonE3.hidden = YES;
        
    } else if(self.gameMode.selectedSegmentIndex == 2) {
        // do nothing;
        NSLog(@"5x5");
        self.colomn0.hidden = NO;
        self.colomn1.hidden = NO;
        self.colomn2.hidden = NO;
        self.colomn3.hidden = NO;
        self.colomn4.hidden = NO;
}
}



// User playing
- (IBAction)onButtonPress:(UIButton *)sender {
    NSLog(@"Button pressed: %@", [sender currentTitle]);
    [self setButtonTitle:sender];
    UIButton *button = sender;
    button.backgroundColor = [UIColor orangeColor];

    
    //isGameOver
    if ([self isGameOver]) {
        NSLog(@"GAME OVER");
        [self.resetButton setHidden:NO];
        [self endGame];
        self.turnLabel.hidden = YES;
        for (int x = 0; x < self.tiles.count; x++) {
            for (int y = 0; y < self.tiles.count; y++) {
                UIButton *button = self.tiles[x][y];
                button.userInteractionEnabled = NO;
            }
        }
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
    
    if ([self.playerMark isEqualToString:@"X"]) {
        self.turnLabel.text = @"Player 1";
    }
    else{
        self.turnLabel.text = @"Player 2";
    }
}



- (void) endGame {
    NSString *winnerStatment = [NSString stringWithFormat:@"%@ won!", self.turnLabel.text];
    self.winnerName.text = winnerStatment;
    NSLog(@"%@", self.winnerName.text);
}


- (IBAction)resetGame:(UIButton *)sender {
    for (int x = 0; x < self.tiles.count; x++) {
        for (int y = 0; y < self.tiles.count; y++) {
            
            UIButton *button = self.tiles[x][y];
            NSLog(@"enabling %@", button.titleLabel.text);
            button.enabled = YES;
            button.userInteractionEnabled = YES;
            
            NSString *myName = [NSString stringWithFormat:@"%i, %i", x, y];
            [button setTitle:myName forState:UIControlStateNormal];
            
            
        }
    }
    self.winnerName.text = nil;
    [self.resetButton setHidden:YES];
    self.turnLabel.text = @"Player 1";
    self.turnLabel.hidden = NO;
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


//to do list:
// reseting the actual values of the buttons
// color the buttons properly
