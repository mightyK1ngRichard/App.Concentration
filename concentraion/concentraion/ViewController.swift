//
//  ViewController.swift
//  concentration
//
//  Created by Dmitriy Permyakov on 10.10.2022.
//

import UIKit

class ViewController: UIViewController {
    //
    lazy var game = ConcebtraionGame(numberOfPairsOfCard: (buttonCollection.count + 1) / 2)
    
    
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
            button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            
        }
    }
    
    var emodjiCollection = ["💻", "📱", "☎️", "", "Dmitriy"]
    var emojiDictiionary = [Int:String]()
    
    func emojiIndetifier(for card: Card) -> String {
//        if emojiDictiionary[card.indefier] != nil {
//            return emojiDictiionary[card.indefier]!
//        } else {
//            return "?"
//        }
        if emojiDictiionary[card.indefier] == nil {
            let randomIndex = Int(arc4random_uniform(UInt32(emodjiCollection.count)))
            emojiDictiionary[card.indefier] = emodjiCollection.remove(at: randomIndex)
        }
        return emojiDictiionary[card.indefier] ?? "?"
    }
    
    
    func updateViewFromModel() {
        for index in buttonCollection.indices {
            let button = buttonCollection[index]
            let card = game.cards[index]
            if card.isFaceup {
                button.setTitle(emojiIndetifier(for: card), for: .normal)
                button.backgroundColor = .white
            } else {
                button.setTitle("", for: .normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0) : #colorLiteral(red: 0.3098039329, green: 0.01568627544, blue: 0.1294117719, alpha: 1)
            }
        }
    }
    
    @IBOutlet var buttonCollection: [UIButton]!
    @IBOutlet weak var touchLabel: UILabel!
    @IBAction func buttonActiom(_ sender: UIButton) {
        counter += 1
        // if we connect button to collection, so use func.
        if let buttonIndex = buttonCollection.firstIndex(of: sender){
            game.chooseCard(at: buttonIndex)
            updateViewFromModel()
        }
    }
    
    
}
