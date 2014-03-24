//
//  ViewController.m
//  ticTacToe
//
//  Created by Alumno on 29/01/14.
//  Copyright (c) 2014 Alumno. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
{
}
char moveCount;
enum State {Blank, X, O};
bool enable1, enable2, enable3, enable4;
bool enable5, enable6, enable7, enable8;
bool enable9;
bool player;
bool winner;
enum State ticTacToe[3][3];

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.jugador.text = [NSString stringWithFormat:@"X"];
    moveCount = 0;
    player = false;
    winner = false;
    enable1 = false;
    enable2 = false;
    enable3 = false;
    enable4 = false;
    enable5 = false;
    enable6 = false;
    enable7 = false;
    enable8 = false;
    enable9 = false;
    for(char i = 0; i < 3; ++i)
    {
        for(char j = 0; j < 3; ++j)
        {
            ticTacToe[i][j] = Blank;
        }
    }
    
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)but1:(id)sender {
    enum State temp = Blank;
    if (enable1 == false) {
        enable1 = true;
        if (player == false) {
            self.jugador.text = [NSString stringWithFormat:@"O"];
            ticTacToe[0][0] = X;
            temp = X;
            [self.img1 setBackgroundImage:[UIImage imageNamed:@"x.png"] forState:UIControlStateNormal];
            player = true;
            moveCount++;
        }
        else
        {
            self.jugador.text = [NSString stringWithFormat:@"X"];
            ticTacToe[0][0] = O;
            temp = O;
            [self.img1 setBackgroundImage:[UIImage imageNamed:@"o.png"] forState:UIControlStateNormal];
            player = false;
            moveCount++;
        }
        //check col
        for(int i = 0; i < 3; i++){
    		if(ticTacToe[0][i] != temp)
    			break;
    		if(i == 2){
                if(temp == X)
                {
                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Ganador" message:@"El ganador es el jugador: X" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                    winner = true;
                    [alert show];
                }
                else if(temp == O)
                {
                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Ganador" message:@"El ganador es el jugador: O" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                    winner = true;
                    [alert show];
                    
                }
    		}
    	}
        
        //check row
        for(int i = 0; i < 3; i++){
    		if(ticTacToe[i][0] != temp)
    			break;
    		if(i == 2){
    			if(temp == X)
                {
                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Ganador" message:@"El ganador es el jugador: X" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                    winner = true;
                    [alert show];
                    
                }
                else if(temp == O)
                {
                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Ganador" message:@"El ganador es el jugador: O" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                    winner = true;
                    [alert show];
                    
                }
    		}
    	}
    		//we're on a diagonal
    		for(int i = 0; i < 3; i++){
    			if(ticTacToe[i][i] != temp)
    				break;
    			if(i == 2){
    				if(temp == X)
                    {
                        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Ganador" message:@"El ganador es el jugador: X" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                        winner = true;
                        [alert show];
                        
                    }
                    else if(temp == O)
                    {
                        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Ganador" message:@"El ganador es el jugador: O" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                        winner = true;
                        [alert show];
                        
                    }
    			}
    		}

        if(moveCount == 9 && !winner)
        {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Empate" message:@"El juego ha terminado en empate" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [self.img1 setBackgroundImage:nil forState:UIControlStateNormal];
            //[UIImage imageNamed: @"x.png"]
            [self.img2 setBackgroundImage:nil forState:UIControlStateNormal];
            [self.img3 setBackgroundImage:nil forState:UIControlStateNormal];
            [self.img4 setBackgroundImage:nil forState:UIControlStateNormal];
            [self.img5 setBackgroundImage:nil forState:UIControlStateNormal];
            [self.img6 setBackgroundImage:nil forState:UIControlStateNormal];
            [self.img7 setBackgroundImage:nil forState:UIControlStateNormal];
            [self.img8 setBackgroundImage:nil forState:UIControlStateNormal];
            [self.img9 setBackgroundImage:nil forState:UIControlStateNormal];
            self.jugador.text = [NSString stringWithFormat:@"X"];
            player = false;
            winner = false;
            moveCount = 0;
            enable1 = false;
            enable2 = false;
            enable3 = false;
            enable4 = false;
            enable5 = false;
            enable6 = false;
            enable7 = false;
            enable8 = false;
            enable9 = false;
            
            for(char i = 0; i < 3; ++i)
            {
                for(char j = 0; j < 3; ++j)
                {
                    ticTacToe[i][j] = Blank;
                }
            }
            
            [alert show];
            
        }
    }
}

- (IBAction)but2:(id)sender {
    enum State temp = Blank;
    if (enable2 == false) {
        enable2 = true;
        if (player == false) {
            self.jugador.text = [NSString stringWithFormat:@"O"];
            ticTacToe[0][1] = X;
            temp = X;
            [self.img2 setBackgroundImage:[UIImage imageNamed:@"x.png"] forState:UIControlStateNormal];
            player = true;
            moveCount++;
        }
        else
        {
            self.jugador.text = [NSString stringWithFormat:@"X"];
            ticTacToe[0][1] = O;
            temp = O;
            [self.img2 setBackgroundImage:[UIImage imageNamed:@"o.png"] forState:UIControlStateNormal];
            player = false;
            moveCount++;
        }
        //check col
        for(int i = 0; i < 3; i++){
    		if(ticTacToe[i][1] != temp)
    			break;
    		if(i == 2){
                if(temp == X)
                {
                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Ganador" message:@"El ganador es el jugador: X" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                    winner = true;
                    [alert show];
                }
                else if(temp == O)
                {
                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Ganador" message:@"El ganador es el jugador: O" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                    winner = true;
                    [alert show];
                    
                }
    		}
    	}
        //check row
        for(int i = 0; i < 3; i++){
    		if(ticTacToe[0][i] != temp)
    			break;
    		if(i == 2){
    			if(temp == X)
                {
                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Ganador" message:@"El ganador es el jugador: X" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                    winner = true;
                    [alert show];
                    
                }
                else if(temp == O)
                {
                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Ganador" message:@"El ganador es el jugador: O" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                    winner = true;
                    [alert show];
                    
                }
    		}
    	}
        if(moveCount == 9 && !winner)
        {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Empate" message:@"El juego ha terminado en empate" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            
            [alert show];
            [self.img1 setBackgroundImage:nil forState:UIControlStateNormal];
            //[UIImage imageNamed: @"x.png"]
            [self.img2 setBackgroundImage:nil forState:UIControlStateNormal];
            [self.img3 setBackgroundImage:nil forState:UIControlStateNormal];
            [self.img4 setBackgroundImage:nil forState:UIControlStateNormal];
            [self.img5 setBackgroundImage:nil forState:UIControlStateNormal];
            [self.img6 setBackgroundImage:nil forState:UIControlStateNormal];
            [self.img7 setBackgroundImage:nil forState:UIControlStateNormal];
            [self.img8 setBackgroundImage:nil forState:UIControlStateNormal];
            [self.img9 setBackgroundImage:nil forState:UIControlStateNormal];
            self.jugador.text = [NSString stringWithFormat:@"X"];
            player = false;
            winner = false;
            moveCount = 0;
            enable1 = false;
            enable2 = false;
            enable3 = false;
            enable4 = false;
            enable5 = false;
            enable6 = false;
            enable7 = false;
            enable8 = false;
            enable9 = false;
            
            for(char i = 0; i < 3; ++i)
            {
                for(char j = 0; j < 3; ++j)
                {
                    ticTacToe[i][j] = Blank;
                }
            }
        }

        
    }
}

- (IBAction)but3:(id)sender {
    enum State temp = Blank;
    if (enable3 == false) {
        enable3 = true;
        if (player == false) {
            self.jugador.text = [NSString stringWithFormat:@"O"];
            ticTacToe[0][2] = X;
            temp = X;
            [self.img3 setBackgroundImage:[UIImage imageNamed:@"x.png"] forState:UIControlStateNormal];
            player = true;
            moveCount++;
        }
        else
        {
            self.jugador.text = [NSString stringWithFormat:@"X"];
            ticTacToe[0][2] = O;
            temp = O;
            [self.img3 setBackgroundImage:[UIImage imageNamed:@"o.png"] forState:UIControlStateNormal];
            player = false;
            moveCount++;
        }
        
        //check col
        for(int i = 0; i < 3; i++){
    		if(ticTacToe[2][i] != temp)
    			break;
    		if(i == 2){
                if(temp == X)
                {
                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Ganador" message:@"El ganador es el jugador: X" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                    winner = true;
                    [alert show];
                }
                else if(temp == O)
                {
                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Ganador" message:@"El ganador es el jugador: O" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                    winner = true;
                    [alert show];
                    
                }
    		}
    	}
        
        //check row
        for(int i = 0; i < 3; i++){
    		if(ticTacToe[i][2] != temp)
    			break;
    		if(i == 2){
    			if(temp == X)
                {
                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Ganador" message:@"El ganador es el jugador: X" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                    winner = true;
                    [alert show];
                    
                }
                else if(temp == O)
                {
                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Ganador" message:@"El ganador es el jugador: O" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                    winner = true;
                    [alert show];
                    
                }
    		}
    	}
        
        //check anti diag
    	for(int i = 0;i < 3;i++){
    		if(ticTacToe[i][2 - i] != temp)
    			break;
    		if(i == 2){
    			if(temp == X)
                {
                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Ganador" message:@"El ganador es el jugador: X" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                    winner = true;
                    [alert show];
                    
                }
                else if(temp == O)
                {
                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Ganador" message:@"El ganador es el jugador: O" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                    winner = true;
                    [alert show];
                    
                }
    		}
    	}
        
        if(moveCount == 9 && !winner)
        {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Empate" message:@"El juego ha terminado en empate" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            
            [alert show];
            [self.img1 setBackgroundImage:nil forState:UIControlStateNormal];
            //[UIImage imageNamed: @"x.png"]
            [self.img2 setBackgroundImage:nil forState:UIControlStateNormal];
            [self.img3 setBackgroundImage:nil forState:UIControlStateNormal];
            [self.img4 setBackgroundImage:nil forState:UIControlStateNormal];
            [self.img5 setBackgroundImage:nil forState:UIControlStateNormal];
            [self.img6 setBackgroundImage:nil forState:UIControlStateNormal];
            [self.img7 setBackgroundImage:nil forState:UIControlStateNormal];
            [self.img8 setBackgroundImage:nil forState:UIControlStateNormal];
            [self.img9 setBackgroundImage:nil forState:UIControlStateNormal];
            self.jugador.text = [NSString stringWithFormat:@"X"];
            player = false;
            winner = false;
            moveCount = 0;
            enable1 = false;
            enable2 = false;
            enable3 = false;
            enable4 = false;
            enable5 = false;
            enable6 = false;
            enable7 = false;
            enable8 = false;
            enable9 = false;
            
            for(char i = 0; i < 3; ++i)
            {
                for(char j = 0; j < 3; ++j)
                {
                    ticTacToe[i][j] = Blank;
                }
            }
        }

        
    }
}

- (IBAction)but4:(id)sender {
    enum State temp = Blank;
    if (enable4 == false) {
        enable4 = true;
        if (player == false) {
            self.jugador.text = [NSString stringWithFormat:@"O"];
            ticTacToe[1][0] = X;
            temp = X;
            [self.img4 setBackgroundImage:[UIImage imageNamed:@"x.png"] forState:UIControlStateNormal];
            player = true;
            moveCount++;
        }
        else
        {
            self.jugador.text = [NSString stringWithFormat:@"X"];
            ticTacToe[1][0] = O;
            temp = O;
            [self.img4 setBackgroundImage:[UIImage imageNamed:@"o.png"] forState:UIControlStateNormal];
            player = false;
            moveCount++;
        }
        
        //check col
        for(int i = 0; i < 3; i++){
    		if(ticTacToe[1][i] != temp)
    			break;
    		if(i == 2){
                if(temp == X)
                {
                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Ganador" message:@"El ganador es el jugador: X" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                    winner = true;
                    [alert show];
                }
                else if(temp == O)
                {
                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Ganador" message:@"El ganador es el jugador: O" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                    winner = true;
                    [alert show];
                    
                }
    		}
    	}
        
        //check row
        for(int i = 0; i < 3; i++){
    		if(ticTacToe[i][0] != temp)
    			break;
    		if(i == 2){
    			if(temp == X)
                {
                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Ganador" message:@"El ganador es el jugador: X" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                    winner = true;
                    [alert show];
                    
                }
                else if(temp == O)
                {
                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Ganador" message:@"El ganador es el jugador: O" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                    winner = true;
                    [alert show];
                    
                }
    		}
    	}
        
        if(moveCount == 9 && !winner)
        {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Empate" message:@"El juego ha terminado en empate" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            
            [alert show];
            [self.img1 setBackgroundImage:nil forState:UIControlStateNormal];
            //[UIImage imageNamed: @"x.png"]
            [self.img2 setBackgroundImage:nil forState:UIControlStateNormal];
            [self.img3 setBackgroundImage:nil forState:UIControlStateNormal];
            [self.img4 setBackgroundImage:nil forState:UIControlStateNormal];
            [self.img5 setBackgroundImage:nil forState:UIControlStateNormal];
            [self.img6 setBackgroundImage:nil forState:UIControlStateNormal];
            [self.img7 setBackgroundImage:nil forState:UIControlStateNormal];
            [self.img8 setBackgroundImage:nil forState:UIControlStateNormal];
            [self.img9 setBackgroundImage:nil forState:UIControlStateNormal];
            self.jugador.text = [NSString stringWithFormat:@"X"];
            player = false;
            winner = false;
            moveCount = 0;
            enable1 = false;
            enable2 = false;
            enable3 = false;
            enable4 = false;
            enable5 = false;
            enable6 = false;
            enable7 = false;
            enable8 = false;
            enable9 = false;
            
            for(char i = 0; i < 3; ++i)
            {
                for(char j = 0; j < 3; ++j)
                {
                    ticTacToe[i][j] = Blank;
                }
            }
        }

        
    }
}
- (IBAction)but5:(id)sender {
    enum State temp = Blank;
    if (enable5 == false) {
        enable5 = true;
        if (player == false) {
            self.jugador.text = [NSString stringWithFormat:@"O"];
            ticTacToe[1][1] = X;
            temp = X;
            [self.img5 setBackgroundImage:[UIImage imageNamed:@"x.png"] forState:UIControlStateNormal];
            player = true;
            moveCount++;
        }
        else
        {
            self.jugador.text = [NSString stringWithFormat:@"X"];
            ticTacToe[1][1] = O;
            temp = O;
            [self.img5 setBackgroundImage:[UIImage imageNamed:@"o.png"] forState:UIControlStateNormal];
            player = false;
            moveCount++;
        }
        
        //check col
        for(int i = 0; i < 3; i++){
    		if(ticTacToe[1][i] != temp)
    			break;
    		if(i == 2){
                if(temp == X)
                {
                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Ganador" message:@"El ganador es el jugador: X" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                    winner = true;
                    [alert show];
                }
                else if(temp == O)
                {
                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Ganador" message:@"El ganador es el jugador: O" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                    winner = true;
                    [alert show];
                    
                }
    		}
    	}
        
        //check row
        for(int i = 0; i < 3; i++){
    		if(ticTacToe[i][1] != temp)
    			break;
    		if(i == 2){
    			if(temp == X)
                {
                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Ganador" message:@"El ganador es el jugador: X" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                    winner = true;
                    [alert show];
                    
                }
                else if(temp == O)
                {
                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Ganador" message:@"El ganador es el jugador: O" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                    winner = true;
                    [alert show];
                    
                }
    		}
    	}
        
        //we're on a diagonal
        for(int i = 0; i < 3; i++){
            if(ticTacToe[i][i] != temp)
                break;
            if(i == 2){
                if(temp == X)
                {
                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Ganador" message:@"El ganador es el jugador: X" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                    winner = true;
                    [alert show];
                    
                }
                else if(temp == O)
                {
                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Ganador" message:@"El ganador es el jugador: O" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                    winner = true;
                    [alert show];
                    
                }
            }
        }
        
        //check anti diag
    	for(int i = 0;i<3;i++){
    		if(ticTacToe[i][2-i] != temp)
    			break;
    		if(i == 2){
    			if(temp == X)
                {
                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Ganador" message:@"El ganador es el jugador: X" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                    winner = true;
                    [alert show];
                    
                }
                else if(temp == O)
                {
                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Ganador" message:@"El ganador es el jugador: O" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                    winner = true;
                    [alert show];
                    
                }
    		}
    	}
        
        if(moveCount == 9 && !winner)
        {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Empate" message:@"El juego ha terminado en empate" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            
            [alert show];
            [self.img1 setBackgroundImage:nil forState:UIControlStateNormal];
            //[UIImage imageNamed: @"x.png"]
            [self.img2 setBackgroundImage:nil forState:UIControlStateNormal];
            [self.img3 setBackgroundImage:nil forState:UIControlStateNormal];
            [self.img4 setBackgroundImage:nil forState:UIControlStateNormal];
            [self.img5 setBackgroundImage:nil forState:UIControlStateNormal];
            [self.img6 setBackgroundImage:nil forState:UIControlStateNormal];
            [self.img7 setBackgroundImage:nil forState:UIControlStateNormal];
            [self.img8 setBackgroundImage:nil forState:UIControlStateNormal];
            [self.img9 setBackgroundImage:nil forState:UIControlStateNormal];
            self.jugador.text = [NSString stringWithFormat:@"X"];
            player = false;
            winner = false;
            moveCount = 0;
            enable1 = false;
            enable2 = false;
            enable3 = false;
            enable4 = false;
            enable5 = false;
            enable6 = false;
            enable7 = false;
            enable8 = false;
            enable9 = false;
            
            for(char i = 0; i < 3; ++i)
            {
                for(char j = 0; j < 3; ++j)
                {
                    ticTacToe[i][j] = Blank;
                }
            }
        }

        
    }
}

- (IBAction)but6:(id)sender {
    enum State temp = Blank;
    if (enable6 == false) {
        enable6 = true;
        if (player == false) {
            self.jugador.text = [NSString stringWithFormat:@"O"];
            ticTacToe[1][2] = X;
            temp = X;
            [self.img6 setBackgroundImage:[UIImage imageNamed:@"x.png"] forState:UIControlStateNormal];
            player = true;
            moveCount++;
        }
        else
        {
            self.jugador.text = [NSString stringWithFormat:@"X"];
            ticTacToe[1][2] = O;
            temp = O;
            [self.img6 setBackgroundImage:[UIImage imageNamed:@"o.png"] forState:UIControlStateNormal];
            player = false;
            moveCount++;
        }
        
        //check col
        for(int i = 0; i < 3; i++){
    		if(ticTacToe[1][i] != temp)
    			break;
    		if(i == 2){
                if(temp == X)
                {
                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Ganador" message:@"El ganador es el jugador: X" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                    winner = true;
                    [alert show];
                }
                else if(temp == O)
                {
                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Ganador" message:@"El ganador es el jugador: O" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                    winner = true;
                    [alert show];
                    
                }
    		}
    	}
        
        //check row
        for(int i = 0; i < 3; i++){
    		if(ticTacToe[i][2] != temp)
    			break;
    		if(i == 2){
    			if(temp == X)
                {
                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Ganador" message:@"El ganador es el jugador: X" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                    winner = true;
                    [alert show];
                    
                }
                else if(temp == O)
                {
                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Ganador" message:@"El ganador es el jugador: O" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                    winner = true;
                    [alert show];
                    
                }
    		}
    	}
        
        if(moveCount == 9 && !winner)
        {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Empate" message:@"El juego ha terminado en empate" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            
            [alert show];
            [self.img1 setBackgroundImage:nil forState:UIControlStateNormal];
            //[UIImage imageNamed: @"x.png"]
            [self.img2 setBackgroundImage:nil forState:UIControlStateNormal];
            [self.img3 setBackgroundImage:nil forState:UIControlStateNormal];
            [self.img4 setBackgroundImage:nil forState:UIControlStateNormal];
            [self.img5 setBackgroundImage:nil forState:UIControlStateNormal];
            [self.img6 setBackgroundImage:nil forState:UIControlStateNormal];
            [self.img7 setBackgroundImage:nil forState:UIControlStateNormal];
            [self.img8 setBackgroundImage:nil forState:UIControlStateNormal];
            [self.img9 setBackgroundImage:nil forState:UIControlStateNormal];
            self.jugador.text = [NSString stringWithFormat:@"X"];
            player = false;
            winner = false;
            moveCount = 0;
            enable1 = false;
            enable2 = false;
            enable3 = false;
            enable4 = false;
            enable5 = false;
            enable6 = false;
            enable7 = false;
            enable8 = false;
            enable9 = false;
            
            for(char i = 0; i < 3; ++i)
            {
                for(char j = 0; j < 3; ++j)
                {
                    ticTacToe[i][j] = Blank;
                }
            }
        }

        
    }
}

- (IBAction)but7:(id)sender {
    enum State temp = Blank;
    if (enable7 == false) {
        enable7 = true;
        if (player == false) {
            self.jugador.text = [NSString stringWithFormat:@"O"];
            ticTacToe[2][0] = X;
            temp = X;
            [self.img7 setBackgroundImage:[UIImage imageNamed:@"x.png"] forState:UIControlStateNormal];
            player = true;
            moveCount++;
        }
        else
        {
            self.jugador.text = [NSString stringWithFormat:@"X"];
            ticTacToe[2][0] = O;
            temp = O;
            [self.img7 setBackgroundImage:[UIImage imageNamed:@"o.png"] forState:UIControlStateNormal];
            player = false;
            moveCount++;
        }
        
        //check col
        for(int i = 0; i < 3; i++){
    		if(ticTacToe[2][i] != temp)
    			break;
    		if(i == 2){
                if(temp == X)
                {
                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Ganador" message:@"El ganador es el jugador: X" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                    winner = true;
                    [alert show];
                }
                else if(temp == O)
                {
                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Ganador" message:@"El ganador es el jugador: O" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                    winner = true;
                    [alert show];
                    
                }
    		}
    	}
        
        //check row
        for(int i = 0; i < 3; i++){
    		if(ticTacToe[i][0] != temp)
    			break;
    		if(i == 2){
    			if(temp == X)
                {
                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Ganador" message:@"El ganador es el jugador: X" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                    winner = true;
                    [alert show];
                    
                }
                else if(temp == O)
                {
                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Ganador" message:@"El ganador es el jugador: O" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                    winner = true;
                    [alert show];
                    
                }
    		}
    	}
        //check anti-diag
        for(int i = 0; i < 3; i++){
    		if(ticTacToe[i][2-i] != temp)
    			break;
    		if(i == 2){
    			if(temp == X)
                {
                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Ganador" message:@"El ganador es el jugador: X" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                    winner = true;
                    [alert show];
                    
                }
                else if(temp == O)
                {
                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Ganador" message:@"El ganador es el jugador: O" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                    winner = true;
                    [alert show];
                    
                }
    		}
    	}
        
        if(moveCount == 9 && !winner)
        {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Empate" message:@"El juego ha terminado en empate" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            
            [alert show];
            [self.img1 setBackgroundImage:nil forState:UIControlStateNormal];
            //[UIImage imageNamed: @"x.png"]
            [self.img2 setBackgroundImage:nil forState:UIControlStateNormal];
            [self.img3 setBackgroundImage:nil forState:UIControlStateNormal];
            [self.img4 setBackgroundImage:nil forState:UIControlStateNormal];
            [self.img5 setBackgroundImage:nil forState:UIControlStateNormal];
            [self.img6 setBackgroundImage:nil forState:UIControlStateNormal];
            [self.img7 setBackgroundImage:nil forState:UIControlStateNormal];
            [self.img8 setBackgroundImage:nil forState:UIControlStateNormal];
            [self.img9 setBackgroundImage:nil forState:UIControlStateNormal];
            self.jugador.text = [NSString stringWithFormat:@"X"];
            player = false;
            winner = false;
            moveCount = 0;
            enable1 = false;
            enable2 = false;
            enable3 = false;
            enable4 = false;
            enable5 = false;
            enable6 = false;
            enable7 = false;
            enable8 = false;
            enable9 = false;
            
            for(char i = 0; i < 3; ++i)
            {
                for(char j = 0; j < 3; ++j)
                {
                    ticTacToe[i][j] = Blank;
                }
            }
        }

        
    }
}
- (IBAction)but8:(id)sender {
    enum State temp = Blank;
    if (enable8 == false) {
        enable8 = true;
        if (player == false) {
            self.jugador.text = [NSString stringWithFormat:@"O"];
            ticTacToe[2][1] = X;
            temp = X;
            [self.img8 setBackgroundImage:[UIImage imageNamed:@"x.png"] forState:UIControlStateNormal];
            player = true;
            moveCount++;
        }
        else
        {
            self.jugador.text = [NSString stringWithFormat:@"X"];
            ticTacToe[2][1] = O;
            temp = O;
            [self.img8 setBackgroundImage:[UIImage imageNamed:@"o.png"] forState:UIControlStateNormal];
            player = false;
            moveCount++;
        }
        //check for cols
        for(int i = 0; i < 3; i++){
    		if(ticTacToe[2][i] != temp)
    			break;
    		if(i == 2){
                if(temp == X)
                {
                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Ganador" message:@"El ganador es el jugador: X" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                    winner = true;
                    [alert show];
                }
                else if(temp == O)
                {
                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Ganador" message:@"El ganador es el jugador: O" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                    winner = true;
                    [alert show];
                    
                }
    		}
    	}
        
        //check row
        for(int i = 0; i < 3; i++){
    		if(ticTacToe[i][1] != temp)
    			break;
    		if(i == 2){
    			if(temp == X)
                {
                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Ganador" message:@"El ganador es el jugador: X" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                    winner = true;
                    [alert show];
                    
                }
                else if(temp == O)
                {
                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Ganador" message:@"El ganador es el jugador: O" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                    winner = true;
                    [alert show];
                    
                }
    		}
    	}
        
        if(moveCount == 9 && !winner)
        {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Empate" message:@"El juego ha terminado en empate" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            
            [alert show];
            [self.img1 setBackgroundImage:nil forState:UIControlStateNormal];
            //[UIImage imageNamed: @"x.png"]
            [self.img2 setBackgroundImage:nil forState:UIControlStateNormal];
            [self.img3 setBackgroundImage:nil forState:UIControlStateNormal];
            [self.img4 setBackgroundImage:nil forState:UIControlStateNormal];
            [self.img5 setBackgroundImage:nil forState:UIControlStateNormal];
            [self.img6 setBackgroundImage:nil forState:UIControlStateNormal];
            [self.img7 setBackgroundImage:nil forState:UIControlStateNormal];
            [self.img8 setBackgroundImage:nil forState:UIControlStateNormal];
            [self.img9 setBackgroundImage:nil forState:UIControlStateNormal];
            self.jugador.text = [NSString stringWithFormat:@"X"];
            player = false;
            winner = false;
            moveCount = 0;
            enable1 = false;
            enable2 = false;
            enable3 = false;
            enable4 = false;
            enable5 = false;
            enable6 = false;
            enable7 = false;
            enable8 = false;
            enable9 = false;
            
            for(char i = 0; i < 3; ++i)
            {
                for(char j = 0; j < 3; ++j)
                {
                    ticTacToe[i][j] = Blank;
                }
            }
        }

        
    }
}

- (IBAction)but9:(id)sender {
    enum State temp = Blank;
    if (enable9 == false) {
        enable9 = true;
        if (player == false) {
            self.jugador.text = [NSString stringWithFormat:@"O"];
            ticTacToe[2][2] = X;
            temp = X;
            [self.img9 setBackgroundImage:[UIImage imageNamed:@"x.png"] forState:UIControlStateNormal];
            player = true;
            moveCount++;
        }
        else
        {
            self.jugador.text = [NSString stringWithFormat:@"X"];
            ticTacToe[2][2] = O;
            temp = O;
            [self.img9 setBackgroundImage:[UIImage imageNamed:@"o.png"] forState:UIControlStateNormal];
            player = false;
            moveCount++;
        }
        //check for cols
        for(int i = 0; i < 3; i++){
    		if(ticTacToe[2][i] != temp)
    			break;
    		if(i == 2){
                if(temp == X)
                {
                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Ganador" message:@"El ganador es el jugador: X" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                    winner = true;
                    [alert show];
                }
                else if(temp == O)
                {
                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Ganador" message:@"El ganador es el jugador: O" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                    winner = true;
                    [alert show];
                    
                }
    		}
    	}
        
        //check row
        for(int i = 0; i < 3; i++){
    		if(ticTacToe[i][2] != temp)
    			break;
    		if(i == 2){
    			if(temp == X)
                {
                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Ganador" message:@"El ganador es el jugador: X" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                    winner = true;
                    [alert show];
                    
                }
                else if(temp == O)
                {
                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Ganador" message:@"El ganador es el jugador: O" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                    winner = true;
                    [alert show];
                    
                }
    		}
    	}
        
        //we're on a diagonal
        for(int i = 0; i < 3; i++){
            if(ticTacToe[i][i] != temp)
                break;
            if(i == 2){
                if(temp == X)
                {
                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Ganador" message:@"El ganador es el jugador: X" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                    winner = true;
                    [alert show];
                    
                }
                else if(temp == O)
                {
                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Ganador" message:@"El ganador es el jugador: O" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                    winner = true;
                    [alert show];
                    
                }
            }
        }
        
        if(moveCount == 9 && !winner)
        {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Empate" message:@"El juego ha terminado en empate" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            
            [alert show];
            [self.img1 setBackgroundImage:nil forState:UIControlStateNormal];
            //[UIImage imageNamed: @"x.png"]
            [self.img2 setBackgroundImage:nil forState:UIControlStateNormal];
            [self.img3 setBackgroundImage:nil forState:UIControlStateNormal];
            [self.img4 setBackgroundImage:nil forState:UIControlStateNormal];
            [self.img5 setBackgroundImage:nil forState:UIControlStateNormal];
            [self.img6 setBackgroundImage:nil forState:UIControlStateNormal];
            [self.img7 setBackgroundImage:nil forState:UIControlStateNormal];
            [self.img8 setBackgroundImage:nil forState:UIControlStateNormal];
            [self.img9 setBackgroundImage:nil forState:UIControlStateNormal];
            self.jugador.text = [NSString stringWithFormat:@"X"];
            player = false;
            winner = false;
            moveCount = 0;
            enable1 = false;
            enable2 = false;
            enable3 = false;
            enable4 = false;
            enable5 = false;
            enable6 = false;
            enable7 = false;
            enable8 = false;
            enable9 = false;
            
            for(char i = 0; i < 3; ++i)
            {
                for(char j = 0; j < 3; ++j)
                {
                    ticTacToe[i][j] = Blank;
                }
            }
        }
        
    }
}

- (IBAction)resetButton:(id)sender {
    [self.img1 setBackgroundImage:nil forState:UIControlStateNormal];
    //[UIImage imageNamed: @"x.png"]
    [self.img2 setBackgroundImage:nil forState:UIControlStateNormal];
    [self.img3 setBackgroundImage:nil forState:UIControlStateNormal];
    [self.img4 setBackgroundImage:nil forState:UIControlStateNormal];
    [self.img5 setBackgroundImage:nil forState:UIControlStateNormal];
    [self.img6 setBackgroundImage:nil forState:UIControlStateNormal];
    [self.img7 setBackgroundImage:nil forState:UIControlStateNormal];
    [self.img8 setBackgroundImage:nil forState:UIControlStateNormal];
    [self.img9 setBackgroundImage:nil forState:UIControlStateNormal];
    
    player = false;
    winner = false;
    moveCount = 0;
    enable1 = false;
    enable2 = false;
    enable3 = false;
    enable4 = false;
    enable5 = false;
    enable6 = false;
    enable7 = false;
    enable8 = false;
    enable9 = false;
    
    for(char i = 0; i < 3; ++i)
    {
        for(char j = 0; j < 3; ++j)
        {
            ticTacToe[i][j] = Blank;
        }
    }
    self.jugador.text = [NSString stringWithFormat:@"X"];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Reinicio" message:@"Se ha reiniciado el juego" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    
    [alert show];
}
@end
