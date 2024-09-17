//
//  ViewController.swift
//  Counter
//
//  Created by Alesia Matusevich on 16/09/2024.
//

import UIKit

class ViewController: UIViewController {

    private var valueCounter: Int = 0
    
    @IBOutlet weak var labelValueCounter: UILabel!
    @IBOutlet weak var AddButton: UIButton!
    @IBOutlet weak var subtractButton: UIButton!
    @IBOutlet weak var clearButton: UIButton!
    @IBOutlet weak var changeHistoryTextView: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func addButtonTab(_ sender: Any) {
        valueCounter += 1
        changeTextLabelValueCounter()
        
        changeHistory(event: "значение изменено на +1")
        
    }
    
    @IBAction func subtractButtonTab(_ sender: Any) {
        if valueCounter - 1 >= 0 {
            valueCounter -= 1
            changeTextLabelValueCounter()
            changeHistory(event: "значение изменено на -1")
        } else {
            changeHistory(event: "попытка уменьшить значение счётчика ниже 0")
        }
    }
    
    @IBAction func clearButtonTab(_ sender: Any) {
        valueCounter = 0
        changeTextLabelValueCounter()
        changeHistory(event: "значение сброшено")
    }
    
    func changeTextLabelValueCounter() {
        labelValueCounter.text = "Значение счетчика: \(valueCounter)"
    }
    
    func changeHistory(event: String){
        var time = NSDate()
        var formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.YYYY HH:mm:ss"
        var formatteddate = formatter.string(from: time as Date)
        
        changeHistoryTextView.text = changeHistoryTextView.text + "\n - [\(formatteddate)] \(event)"
    }
    
  
}

