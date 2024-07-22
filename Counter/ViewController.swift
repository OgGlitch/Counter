//
//  ViewController.swift
//  Counter
//
//  Created by Егор Прокопьев on 20.07.2024.
//

import UIKit

class ViewController: UIViewController {
    
    var count = 0
    
    @IBOutlet weak var counterLable: UILabel!
    @IBOutlet weak var counterButton: UIButton!
    
    @IBAction func pressedButton() {
        count += 1
        counterLable.text = "Значение счётчика: \(count)"
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        counterLable.text = "Значение счётчика: \(count)"
        counterButton.setTitle("Увеличить счетчик", for: UIControl.State.normal)
    }
}

