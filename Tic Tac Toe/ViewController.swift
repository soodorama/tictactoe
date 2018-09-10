//
//  ViewController.swift
//  Tic Tac Toe
//
//  Created by Neil Sood on 9/5/18.
//  Copyright © 2018 Neil Sood. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var squares: [UIButton]!
    
    @IBOutlet weak var winnerLabel: UILabel!
    
    var board = [
        0,0,0,
        0,0,0,
        0,0,0
    ]

    var player = 1
    
    var winner = "0"
    
    @IBAction func squarePressed(_ sender: UIButton) {
        if board[sender.tag] == 0 && winner == "0" {
            board[sender.tag] = player
            sender.backgroundColor = player == 1 ? .red : .blue
            
            // logic for winner if 3 in a row
            // or
            // logic for cats game
            if board[0] == player && board[1] == player && board[2] == player ||
                board[3] == player && board[4] == player && board[5] == player ||
                board[6] == player && board[7] == player && board[8] == player ||
                board[0] == player && board[3] == player && board[6] == player ||
                board[1] == player && board[4] == player && board[7] == player ||
                board[2] == player && board[5] == player && board[8] == player ||
                board[0] == player && board[4] == player && board[8] == player ||
                board[2] == player && board[4] == player && board[6] == player {
                
                winner = player == 1 ? "1" : "2"
                
                winnerLabel.text = "Player " + winner + " wins!"
            }
            else {
                var end = 0
                for i in board {
                    if i != 0 {
                        end += 1
                    }
                }
                if end == 9 {
                    winnerLabel.text = "Cat's game, let's play again!"
                }
            }
            
            player *= -1
        }
    }
    
    @IBAction func refreshBoard(_ sender: UIButton) {
        for square in squares {
            square.backgroundColor = .lightGray
        }
        self.board = [0,0,0,0,0,0,0,0,0]
        player = 1
        winner = "0"
        winnerLabel.text = ""
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

