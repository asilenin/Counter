//
//  ViewController.swift
//  Counter
//
//  Created by Anton Silenin on 16.03.2025.
//

import UIKit

class ViewController: UIViewController {
    
    //значение счетчика
    private var counterValue: Int = 0 {
        didSet{
            updateCounterLabel()
        }
    }
    
    //история изменений
    private var historyValue: String = "История изменений:" {
        didSet{
            updatehistoryValue()
        }
    }
    
    //Text View с историей изменений
    @IBOutlet weak private var historyCounterTextView: UITextView!
    
    //Label счетчика
    @IBOutlet weak private var counterLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //функция получения отформатированного текущего timestamp
    private func getTimeStamp() -> String {
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm"
        return formatter.string(from: date)
    }
    
    //форматирование сообщения в историю изменений по ТЗ - "[date time]: %message"
    private func updateHistory(_ value:String){
        historyValue = historyValue + "\n" +
        "[" + getTimeStamp() + "]: " + value
    }
    
    //обновление истории изменения в Text View
    private func updatehistoryValue() {
        historyCounterTextView.text = historyValue
    }
    
    //обновление значения Label счетчика
    private func updateCounterLabel() {
        counterLabel.text = "Значение счетчика: \(counterValue)"
    }
    
    //событие на нажатие кнопки +
    @IBAction private func counterIncreaserButtonDidTap(_ sender: Any) {
        counterValue += 1
        updateHistory("значение изменено на +1")
    }
    
    //событие на нажатие кнопки -
    @IBAction private func counterDecreaserButtonDidTap(_ sender: Any) {
        if counterValue == 0 {
            updateHistory("попытка уменьшить значение счётчика ниже 0")
            return
        }
        counterValue -= 1
        updateHistory("значение изменено на -1")
    }
    
    //событие на нажатие кнопки reset
    @IBAction private func counterResetButtonDidTap(_ sender: Any) {
        counterValue = 0
        updateHistory("значение сброшено")
    }
}
