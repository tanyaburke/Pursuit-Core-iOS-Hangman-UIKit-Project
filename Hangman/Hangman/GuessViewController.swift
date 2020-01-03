//
//  GuessTableViewCell.swift
//  Hangman
//
//  Created by Tanya Burke on 11/19/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class GuessViewController: UIViewController {
    
   
    
    @IBOutlet weak var hangMan: UIImageView!
    
    @IBOutlet weak var statusLabel: UILabel!
    
    @IBOutlet weak var letterArray: UILabel!
    
    @IBOutlet weak var guessChar: UITextField!
    
    var newGame = HangmanBrain()
    var usedLetters = [String]()
    let alphabet = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"]
   
    var test = String()
    var wordArray = [Character]()
    var displayUnderScore = [String]()
    var guessCount = 0
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        guessChar.delegate = self
        let backButton = navigationItem
        
        backButton.hidesBackButton = true
        
        

        let underScore:[String] = [String](repeating: "_", count: test.count)
//        displayUnderScore = newGame.getHiddenWord()
        
        
        
        let letterArray = Array(test)
        
        
        wordArray = letterArray
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        statusLabel.text = displayUnderScore.joined(separator: " ")
        var enteredWord = test
        let word = test
        hangMan.image = UIImage(named: "hang1")
        
    }
    
    
    
    
    
    
}

extension GuessViewController: UITextFieldDelegate  {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if alphabet.contains(string){
            if textField.text?.count == 1 {
                return false
            } else {
                guessCount += 1
                return true
                
            }
        } else {
            
            
            return false
        }
        
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        for index in 0..<wordArray.count {
            if wordArray[index] == Character(guessChar.text ?? "m") {
                displayUnderScore[index] = wordArray[index].description
            }
            
        }
        usedLetters.append(guessChar.text ?? "m")
        letterArray.text = String("\(usedLetters)")
        statusLabel.text = displayUnderScore.joined(separator: " ")
        textField.text = ""
        
        print(displayUnderScore)
        return true
    }
    
    
}
