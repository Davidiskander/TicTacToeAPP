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

@property (weak, nonatomic) IBOutlet UILabel *xDrag;
@property (weak, nonatomic) IBOutlet UILabel *oDrag;

@property NSArray *tiles;
@property int numTiles;
@property BOOL isXTurn;


@end




@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self makeTilesDisappear];
    
    // initialize tile grid
    self.numTiles = 3;
    self.tiles =
    @[
      @[self.buttonA0, self.buttonA1, self.buttonA2, self.buttonA3, self.buttonA4],
      @[self.buttonB0, self.buttonB1, self.buttonB2, self.buttonB3, self.buttonB4],
      @[self.buttonC0, self.buttonC1, self.buttonC2, self.buttonC3, self.buttonC4],
      @[self.buttonD0, self.buttonD1, self.buttonD2, self.buttonD3, self.buttonD4],
      @[self.buttonE0, self.buttonE1, self.buttonE2, self.buttonE3, self.buttonE4]
      ];
    
    // reset game
    [self resetGame:nil];

    // show start button
    [self.startGame setHidden: NO];
}

// Hiding all tiles
- (void) makeTilesDisappear{
    self.colomn0.hidden = YES;
    self.colomn1.hidden = YES;
    self.colomn2.hidden = YES;
    self.colomn3.hidden = YES;
    self.colomn4.hidden = YES;
}

// Enable all tiles
- (void) makeTilesAppear{
    self.colomn0.hidden = NO;
    self.colomn1.hidden = NO;
    self.colomn2.hidden = NO;
    self.colomn3.hidden = NO;
    self.colomn4.hidden = NO;
}


- (IBAction)resetGame:(UIButton *)sender
{
    
    // clear tiles
    for (int x = 0; x < self.tiles.count; x++) {
        for (int y = 0; y < self.tiles.count; y++) {
            UIButton *button = self.tiles[x][y];
            NSLog(@"enabling %i, %i", x, y);
            
            // make tile active
            button.enabled = YES;
            button.userInteractionEnabled = YES;
            
            // reset tile label
            //NSString *myName = [NSString stringWithFormat:@"%i, %i", x, y];
            [self setButtonTitle:button to:nil];
            button.backgroundColor = [UIColor colorWithRed:210.0f/255.0f
                                                     green:105.0f/255.0f
                                                      blue:30.0f/255.0f
                                                     alpha:1.0f];
            
            // enabling options
            self.gameMode.enabled = YES;     // why?
            [self.startGame setHidden: NO];  //why?
            [self makeTilesDisappear];
            
        }
    }
    
    // show turn label
    self.turnLabel.text = @"Player 1";
    self.turnLabel.hidden = NO;

    // set turn counter
    self.isXTurn = YES;
    
    // hide winner label
    self.winnerName.text = nil;
    
    // hide reset button
    [self.resetButton setHidden:YES];
    
     //show game mode
    [self.startGame setHidden: NO];
    self.gameMode.enabled = YES;
}



// Drag and drop
- (IBAction)panWasRecognized:(UIPanGestureRecognizer *)recognizer {
    CGPoint translation = [recognizer translationInView:self.view.superview];
    
    CGPoint center = self.view.center;
    center.x += translation.x;
    center.y += translation.y;
    self.view.center = center;
    
    [recognizer setTranslation:CGPointZero inView:self.view.superview];
}


- (IBAction)gameModeButtonPressed:(UISegmentedControl *)sender {
   
}


- (IBAction)onGameStartPressed:(UIButton *)sender {
    self.startGame.hidden = YES;
    self.gameMode.enabled = NO;
    //[self makeTilesAppear];


    if (self.gameMode.selectedSegmentIndex == 0) {
        NSLog(@"3x3");
        self.numTiles = 3;
        self.colomn0.hidden = NO;
        self.colomn1.hidden = NO;
        self.colomn2.hidden = NO;
        self.colomn3.hidden = YES;
        self.colomn4.hidden = YES;

        self.buttonD0.hidden = self.buttonD1.hidden = self.buttonD2.hidden = YES;
        self.buttonE0.hidden = self.buttonE1.hidden = self.buttonE2.hidden = YES;
        
    } else if(self.gameMode.selectedSegmentIndex == 1) {
        NSLog(@"4x4");
        self.numTiles = 4;
        self.colomn0.hidden = NO;
        self.colomn1.hidden = NO;
        self.colomn2.hidden = NO;
        self.colomn3.hidden = NO;
        self.colomn4.hidden = YES;
        self.buttonE0.hidden = self.buttonE1.hidden = self.buttonE2.hidden = self.buttonE3.hidden = YES;
        self.buttonD0.hidden = self.buttonD1.hidden = self.buttonD2.hidden = self.buttonD2.hidden =  NO;

        
    } else if(self.gameMode.selectedSegmentIndex == 2) {
        NSLog(@"5x5");
        self.numTiles = 5;
        [self makeTilesAppear];
        self.buttonE0.hidden = self.buttonE1.hidden = self.buttonE2.hidden = self.buttonE3.hidden = NO;

    }
}




#pragma mark -
#pragma mark - Buttons


- (NSString *)getButtonTitle:(UIButton *)button {
    return [button titleForState:[button state]];
}

- (void)setButtonTitle:(UIButton *)button to:(NSString *)title {
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitle:title forState:UIControlStateDisabled];
}

- (void)colorButton:(UIButton *)button {
    NSString *title = [self getButtonTitle:button];

    if ([title isEqualToString:@"X"]) {
        [button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blueColor] forState:UIControlStateDisabled];
    } else if ([title isEqualToString:@"O"]) {
        [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor redColor] forState:UIControlStateDisabled];
    }
}

- (IBAction)onButtonPress:(UIButton *)button {
    NSLog(@"Button pressed: %@", [button currentTitle]);

    // make tile inactive
    button.enabled = NO;
    button.userInteractionEnabled = YES;
    // change tile label
    [self setButtonTitle:button to:[self playerMark]];
    // change tile color
    [self colorButton:button];


    // check if won
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
    
    // next player's turn
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
    // increment turn
    self.isXTurn = ! self.isXTurn;

    // set player label
    NSString *mark = [self playerMark];
    if ([mark isEqualToString:@"X"]) {
        self.turnLabel.text = @"Player 1 (X)";
    } else{
        self.turnLabel.text = @"Player 2 (O)";
    }
}



- (void) endGame {
    NSLog(@"endGame(): %@", self.winnerName.text);

    // show winner label
    
    // set winner text
    NSString *winnerStatment = [NSString stringWithFormat:@"%@ won!", self.turnLabel.text];
    self.winnerName.text = winnerStatment;
}



#pragma mark -
#pragma mark isGameOver


- (BOOL)isGameOver {
    int n = self.numTiles;
    
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
    NSLog(@"isWinningRow");
    UIButton *firstButton = self.tiles[0][y];
    NSString *first = [self getButtonTitle:firstButton];
    if (! first) { NSLog(@"0,%i blank", y); return NO; }
    NSLog(@"0,%i %@", y, first);
    
    int n = self.numTiles;
    for (int x = 1; x < n; x++) {
        UIButton *otherButton = self.tiles[x][y];
        NSString *other = [self getButtonTitle:otherButton];
        if ([other isEqualToString:first]) {
            // match: keep checking
            NSLog(@"%i,%i %@ match", x, y, other);
        } else {
            // different: not a winner
            NSLog(@"%i,%i %@ no", x, y, other);
            return NO;
        }
    }
    // all tiles matched: winner
    NSLog(@"=> winning row!");
    return YES;
}

- (BOOL)isWinningColumn:(int)x {
    NSLog(@"isWinningRow");
    UIButton *firstButton = self.tiles[x][0];
    NSString *first = [self getButtonTitle:firstButton];
    if (! first) { NSLog(@"%i,0 blank", x); return NO; }
    NSLog(@"%i,0 %@", x, first);
    
    int n = self.numTiles;
    for (int y = 1; y < n; y++) {
        UIButton *otherButton = self.tiles[x][y];
        NSString *other = [self getButtonTitle:otherButton];
        if ([other isEqualToString:first]) {
            // match: keep checking
            NSLog(@"%i,%i %@ match", x, y, other);
        } else {
            // different: not a winner
            NSLog(@"%i,%i %@ no", x, y, other);
            return NO;
        }
    }
    // all tiles matched: winner
    NSLog(@"=> winning column!");
    return YES;
}

// diagonal NE: (0,0) - (1,1) - (2,2) = (i,i)
- (BOOL)isWinningDiagSoutheast {
    NSLog(@"isWinningDiagSE");

    // first
    int x = 0;
    int y = 0;
    UIButton *firstButton = self.tiles[x][y];
    NSString *first = [self getButtonTitle:firstButton];
    if (! first) { NSLog(@"%i,%i blank", x, y); return NO; }
    NSLog(@"%i,%i %@", x, y, first);

    // others
    int n = self.numTiles;
    for (int xy = 1; xy < n; xy++) {
        x = xy;
        y = xy;
        UIButton *otherButton = self.tiles[x][y];
        NSString *other = [self getButtonTitle:otherButton];
        if ([other isEqualToString:first]) {
            // match: keep checking
            NSLog(@"%i,%i %@ match", x, y, other);
        } else {
            // different: not a winner
            NSLog(@"%i,%i %@ no", x, y, other);
            return NO;
        }
    }
    // all tiles matched: winner
    NSLog(@"=> winning diag SE!");
    return YES;
}

// diagonal NE: (0,2) - (1,1) - (2,0) = (i,n-1-i)
- (BOOL)isWinningDiagNortheast {
    NSLog(@"isWinningDiagNE");

    // first
    int n = self.numTiles;
    int x = 0;
    int y = n-1;
    UIButton *firstButton = self.tiles[x][y];
    NSString *first = [self getButtonTitle:firstButton];
    if (! first) { NSLog(@"%i,%i blank", x, y); return NO; }
    NSLog(@"%i,%i %@", x, y, first);
    
    // others
    for (int xy = 1; xy < n; xy++) {
        x = xy;
        y = n-1-xy;
        UIButton *otherButton = self.tiles[x][y];
        NSString *other = [self getButtonTitle:otherButton];
        if ([other isEqualToString:first]) {
            // match: keep checking
            NSLog(@"%i,%i %@ match", x, y, other);
        } else {
            // different: not a winner
            NSLog(@"%i,%i %@ no", x, y, other);
            return NO;
        }
    }
    // all tiles matched: winner
    NSLog(@"=> winning diag NE!");
    return YES;
}


@end


//to do list:
// reseting the actual values of the buttons
// color the buttons properly
