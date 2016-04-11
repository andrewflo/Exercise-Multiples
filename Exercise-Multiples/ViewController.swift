//
//  ViewController.swift
//  Exercise-Multiples
//
//  Created by Andrew Flores on 4/10/16.
//  Copyright © 2016 Andrew Flo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // Properties
    var maxResult = 0
    var multiple = 0
    var currentNumber = 0
    var result = 0
    
    // Outlets
    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var multipleTextField: UITextField!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var multipleLabel: UILabel!
    @IBOutlet weak var addButton: UIButton!
    
    // Actions
    @IBAction func playButtonPressed(sender: UIButton!) {
        if multipleTextField.text != nil && multipleTextField.text != "" {
            logoImage.hidden = true
            multipleTextField.hidden = true
            playButton.hidden = true
            multipleLabel.hidden = false
            addButton.hidden = false
            
            multiple = Int(multipleTextField.text!)!
            maxResult = multiple * 10
        }
    }
    
    @IBAction func addButtonPressed(sender: UIButton!) {
        if !isGameOver() {
            currentNumber += multiple
            result = currentNumber + multiple
        
            updateMultipleLabel()
        } else {
            restartGame()
        }
    }
    
    // Functions
    func isGameOver() -> Bool {
        return result >= maxResult
    }
    
    func restartGame() {
        logoImage.hidden = false
        multipleTextField.hidden = false
        playButton.hidden = false
        multipleLabel.hidden = true
        addButton.hidden = true
        
        currentNumber = 0
        multiple = 0
        result = 0
        
        multipleTextField.text = ""
        multipleLabel.text = "Press Add to add!"
    }
    
    func updateMultipleLabel() {
        multipleLabel.text = "\(currentNumber) + \(multiple) = \(result)"
    }
    
    // ViewController Methods
    override func prefersStatusBarHidden() -> Bool {
        return true
    }

}

