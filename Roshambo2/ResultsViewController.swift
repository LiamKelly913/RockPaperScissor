//
//  ResultsViewController.swift
//  Roshambo2
//
//  Created by Liam Kelly on 6/25/16.
//  Copyright © 2016 LiamKelly. All rights reserved.
//

import UIKit

    // Shape enum, used in Picker and Results, with the 3 cases
    enum Shape:String {
        case Rock = "Rock"
        case Paper = "Paper"
        case Scissors = "Scissors"
    
        // static because we might want to generate a shape when there is no previous shape object
        static func generateShape() -> Shape {
            let shapeArray = ["Rock","Paper","Scissors"]
            let index = Int(arc4random_uniform(3))
            return Shape(rawValue: shapeArray[index])!
        }
    }

class ResultsViewController: UIViewController {
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var text: UILabel!
    
    
    
    // Set user and opponent shapes
    var playerChoice: Shape!
    fileprivate let opponentChoice: Shape = Shape.generateShape()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayAnswer()
        print(playerChoice.rawValue)
        print(opponentChoice.rawValue)
        // Do any additional setup after loading the view.
    
    }

    func displayAnswer() {
        var imageName = "Tie"
        switch (playerChoice!, opponentChoice) {
        case let (user, opponent) where user == opponent:
            text.text = "It's a tie!"
        case (.Rock, .Scissors), (.Scissors, .Paper), (.Paper, .Rock):
            text.text = "You win! Opponent chose \(opponentChoice.rawValue)"
            imageName = "\(playerChoice.rawValue)-\(opponentChoice.rawValue)"
        default:
            text.text = "You lose :( Opponent chose \(opponentChoice.rawValue)"
            imageName = "\(opponentChoice.rawValue)-\(playerChoice.rawValue)"
        }
        image.image = UIImage(named: imageName)
    }
    
    @IBAction func playAgainAction() {
        dismiss(animated: true, completion: nil)
    }

}
