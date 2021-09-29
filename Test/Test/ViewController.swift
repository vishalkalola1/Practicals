//
//  ViewController.swift
//  Test
//
//  Created by Vishal on 7/15/21.
//


//Task Description
//You are given a NxM matrix. Every element in the matrix represents a position on a minesweeper game board. An element can either be "O", meaning that it's empty, or "X", meaning that the position contains a mine.
//
//Your task is to devise a function that, given the input matrix defined above, prints a transformed matrix in which every empty cell is replaced by the number of mines in the Moore neighborhood of that specific cell. Your function should print to the console and the print output should be formatted so that each row in the matrix represents a single line.
//
//For example:
//
//X O O      X 1 0
//O O O  ->  3 3 1
//X X O      X X 1
//
//
//The Moore neighborhood is defined by the eight cells surrounding the cell, the four directly next to it and four diagonal to it.
//
//The input is a an array of strings, with each element representing a row in the matrix.
//
//Example:
//minesweeper(["XOO", "OOO", "XXO"]) // should print
//
//X 1 0
//3 3 1
//X X 1
//
//test1 = ["XOOXXXOO", "OOOOXOXX", "XXOXXOOO", "OXOOOXXX", "OOXXXXOX", "XOXXXOXO", "OOOXOXOX", "XOXXOXOX"]
//minesweeper(test1); // should print
//
//X 1 1 X X X 3 2
//3 3 3 5 X 5 X X
//X X 3 X X 5 5 4
//3 X 5 5 6 X X X
//2 4 X X X X 6 X
//X 3 X X X 5 X 3
//2 4 5 X 6 X 5 X
//X 2 X X 4 X 4 X
//
//
//test2 = ["OOOXXXOXX", "XXXXXXOXX", "XOOXXXXXX", "OOXXOXOXX", "XXXXXXXXX"]
//minesweeper(test2); // should print
//
//2 3 4 X X X 4 X X
//X X X X X X 7 X X
//X 5 6 X X X X X X
//3 5 X X 8 X 8 X X
//X X X X X X X X X



import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let transaction =  [["1","Deposit","5.00",""], ["3","Food","","4.01"], ["3","Cab","","0.98"], ["4","Deposit","3.14",""], ["4","Food","","1.99"], ["5","Food","","2.00"], ["6","Deposit","4.84",""], ["7","Food","","3.14"], ["7","Bus","","0.41"], ["7","Bus","","0.34"]]
        let balance = calculateBalance(transaction)
        print("Final balance: \(String(format: "%.2f", balance))")
    }
    
    func calculateBalance(_ transcations: [[String]]) -> Double {
        var balance = 0.0
        print("Date Description Withdraw Deposit Balance")
        for transaction in transcations {
            if transaction[2] != "" {
                balance += Double(transaction[2]) ?? 0.0
            } else if transaction[3] != "" {
                balance -= Double(transaction[3]) ?? 0.0
            }
            
            print("\(transaction[0]) \t  \(transaction[1])\t\t   \(transaction[3])\t   \(transaction[2]=="" ? "\t":transaction[2])\t   \(String(format: "%.2f", balance))")
        }
        return balance
    }
}

