//
//  ViewController.swift
//  concentraion
//
//  Created by Dmitriy Permyakov on 10.10.2022.
//

import UIKit

class ViewController: UIViewController {

    var counter = 0 {
        didSet {
            touchLabel.text = "Touches \(counter)"
        }
    }
    
    func flipButton(emoji: String, button: UIButton) {
        if button.currentTitle == emoji {
            button.setTitle("", for: .normal)
            button.backgroundColor = #colorLiteral(red: 0.07563180476, green: 0.02028302476, blue: 0.3475425243, alpha: 1)
        } else {
            button.setTitle(emoji, for: .normal)
            button.backgroundColor = .white
            
        }
    }
    
let emodjiCollection = ["💻", "📱", "📱", "💻", "☎️", "☎️", "", "Dmitriy", ""]
    
    @IBOutlet var buttonCollection: [UIButton]!
    @IBOutlet weak var touchLabel: UILabel!
    @IBAction func buttonActiom(_ sender: UIButton) {
        counter += 1
        // if we connect button to collection, so use func.
        if let buttonIndex = buttonCollection.firstIndex(of: sender){
            flipButton(emoji: emodjiCollection[buttonIndex], button: sender)
        }
    }
    
    
}
