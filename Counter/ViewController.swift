//
//  ViewController.swift
//  Counter
//
//  Created by Anton Silenin on 16.03.2025.
//

import UIKit

class ViewController: UIViewController {
    
    var counterValue: Int = 0 {
        didSet{
            updateCounterLabel()
        }
    }
    

    private func updateCounterLabel() {
        counterLabel.text = "Значение счетчика: \(counterValue)"
    }
    
    @IBOutlet weak var counterLabel: UILabel!
    
    @IBAction func counterIncreaserButtonDidTap(_ sender: Any) {
        counterValue += 1
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

