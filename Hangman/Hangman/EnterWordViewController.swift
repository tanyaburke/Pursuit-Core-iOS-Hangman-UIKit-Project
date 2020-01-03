//
//  ViewController.swift
//  Hangman
//
//  Created by Alex Paul on 11/19/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

class EnterWordViewController: UIViewController {
    
    @IBOutlet weak var enteredWord: UITextField!
    
    
    @IBOutlet weak var promptLabel: UILabel!
    
    @IBOutlet weak var esubmitWord: UIButton!
    
    
   
    
    override func viewDidLoad() {
    super.viewDidLoad()
    
        enteredWord.delegate = self
        esubmitWord.alpha = 0.3
        esubmitWord.isEnabled =  false
        
  }

    @IBAction func checkWord(_ sender: UIButton) {
        
        guard let text = enteredWord.text  else {
        promptLabel.text = "Please enter a valid word"
            sender.isEnabled = false
        return
        }
        guard text.count >= 3 else {promptLabel.text = "Please enter a longer word, three charachters or more"
            
            sender.isEnabled = false
            return
        }
        if #available(iOS 13.0, *) {
            let guessVC = storyboard?.instantiateViewController(identifier: "GuessViewController") as! GuessViewController
            
            guessVC.test = text
            
            navigationController?.pushViewController(guessVC, animated: true)
            
        } else {
            return
            
        }
        
       
        
    }
    
}

extension EnterWordViewController: UITextFieldDelegate {

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        esubmitWord.alpha = 1
        esubmitWord.isEnabled =  true
        
        return true
    }





}
