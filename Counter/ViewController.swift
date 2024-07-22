//
//  ViewController.swift
//  Counter
//
//  Created by Егор Прокопьев on 20.07.2024.
//

import UIKit

class ViewController: UIViewController {
    
    private var count = 0
    
    @IBOutlet weak var counterLable: UILabel!
    @IBOutlet weak var counterDecreaseButton: UIButton!
    @IBOutlet weak var counterIncreaseButton: UIButton!
    @IBOutlet weak var counterResetButton: UIButton!
    @IBOutlet weak var historyTextView: UITextView!
    
    @IBAction func pressedButton() {
        if count > 0 {
            count -= 1
            historyTextView.insertText(getCurrentDateAndTime() + ": значение изменено на -1\n")
        } else {
            historyTextView.insertText(getCurrentDateAndTime() + ": попытка уменьшить значение счётчика ниже 0\n")
        }
        displayCount()
        scrollText()
    }
    @IBAction func pressIncreaseButton() {
        count += 1
        displayCount()
        historyTextView.insertText(getCurrentDateAndTime() + ": значение изменено на +1\n")
        scrollText()
    }
    @IBAction func pressResetButton() {
        count = 0
        displayCount()
        historyTextView.insertText(getCurrentDateAndTime() + ": значение сброшено\n")
        scrollText()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayCount()
        counterDecreaseButton.setTitle("-", for: UIControl.State.normal)
        counterIncreaseButton.setTitle("+", for: UIControl.State.normal)
        counterIncreaseButton.tintColor = .red
        counterResetButton.setTitle("↻", for: UIControl.State.normal)
        counterResetButton.tintColor = .gray
        historyTextView.text = "История изменений:\n"
    }
    
    private func displayCount() {
        counterLable.text = "Значение счётчика: \(count)"
    }
    
    private func getCurrentDateAndTime() -> String {
        let date = Date()
        let dateFormatter = DateFormatter()
        
        dateFormatter.timeStyle = .short
        dateFormatter.dateStyle = .short
        
        return dateFormatter.string(from: date)
    }
    
    private func scrollText() {
        let range = NSRange(location: historyTextView.text.count - 1, length: 0)
        historyTextView.scrollRangeToVisible(range)
    }
}

