//
//  ViewController.swift
//  Counter
//
//  Created by Konstantin Penzin on 15.03.2023.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: Outlets and properties

    @IBOutlet private weak var counterLabel: UILabel!
    @IBOutlet private weak var historyTextView: UITextView!
    
    private var _counter = 0
    private var counter: Int {
        set {
            _counter = newValue
            updateCounter()
        }
        get { return _counter }
    }
    
    // MARK: Initialization
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: Private logic
    
    private func updateCounter() {
        counterLabel.text = "Значение счётчика: \(counter)"
    }
    
    private func appendHistoryMessage(_ message: String) {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm"
        historyTextView.text.append("\n[\(formatter.string(from: Date()))]: \(message)")
        
        let location = historyTextView.text.count - 1
        let bottom = NSMakeRange(location, 1)
        historyTextView.scrollRangeToVisible(bottom)
    }
    
    // MARK: Actions block
    
    @IBAction private func resetCounter(_ sender: UIButton) {
        counter = 0
        appendHistoryMessage("Значение сброшено")
    }
    
    @IBAction private func increaseCounter(_ sender: UIButton) {
        counter += 1
        appendHistoryMessage("Значение изменено на +1")
    }
    
    @IBAction private func decreaseCounter(_ sender: UIButton) {
        if (counter == 0) {
            appendHistoryMessage("Попытка уменьшить значение счётчика ниже 0")
            return
        }
        counter -= 1
        appendHistoryMessage("Значение изменено на -1")
    }
    
}

