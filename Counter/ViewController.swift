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
    
    var historyValue: String = "История изменений:" {
        didSet{
            updatehistoryValue()
        }
    }
    
    private func updateHistory(_ value:String){
        historyValue = historyValue + "\n" +
        "[" + getTimeStamp() + "]: " + value
    }
    

    private func updatehistoryValue() {
        historyCounterTextView.text = historyValue
    }
    
    private func updateCounterLabel() {
        counterLabel.text = "Значение счетчика: \(counterValue)"
    }
    
    private func getTimeStamp() -> String {
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm"
        return formatter.string(from: date)
    }
    
    @IBOutlet weak var historyCounterTextView: UITextView!
    
    @IBOutlet weak var counterLabel: UILabel!
    
    @IBAction func counterIncreaserButtonDidTap(_ sender: Any) {
        counterValue += 1
        updateHistory("значение изменено на +1")
        
    }
    @IBAction func counterDecreaserButtonDidTap(_ sender: Any) {
        if counterValue == 0 {
            updateHistory("попытка уменьшить значение счётчика ниже 0")
            return
        }
        counterValue -= 1
        updateHistory("значение изменено на -1")
    }
    @IBAction func counterResetButtonDidTap(_ sender: Any) {
        counterValue = 0
        updateHistory("значение сброшено")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

