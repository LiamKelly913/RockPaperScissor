//
//  PickerViewController.swift
//  Roshambo2
//
//  Created by Liam Kelly on 6/25/16.
//  Copyright © 2016 LiamKelly. All rights reserved.
//

import UIKit

class PickerViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func play(_ sender: UIButton) {
        let view = self.storyboard?.instantiateViewController(withIdentifier: "ResultsViewController") as! ResultsViewController
        
        view.playerChoice = getUserShape(sender)
        
        present(view, animated: true, completion: nil)
        
    }
    
    
    fileprivate func getUserShape(_ sender: UIButton!) -> Shape {
        let userChoice = sender.title(for: UIControlState())!
        return Shape(rawValue: userChoice)!
    }

    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

