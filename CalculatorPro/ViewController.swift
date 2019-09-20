//
//  ViewController.swift
//  CalculatorPro
//
//  Created by Shilpa Kumari on 09/08/19.
//  Copyright © 2019 Shilpa Kumari. All rights reserved.
//

import UIKit

class ViewController: UIViewController, clearHistory {
    
    var expression : String = ""
    var arr : [String] = []
   
    override func viewDidLoad() {
        super.viewDidLoad()
       
     
    }
    func clear(type : [String]){
        arr = type
    }

    @IBAction func showHistory(_ sender: Any) {
        if let next = self.storyboard?.instantiateViewController(withIdentifier: "historyViewController") as? historyViewController{
            next.items = arr
            textLabel.text = ""
            expression = ""
            next.clearHistoryDelegate = self
            self.navigationController?.pushViewController(next, animated: true)
        }
        
    }
    @IBOutlet weak var textLabel: UILabel!
    
   
    @IBAction func plus(_ sender: Any) {
       appendOperator(op: "+")
    }
    
    @IBAction func minus(_ sender: Any) {
        appendOperator(op: "-")
    }
    
    @IBAction func multiply(_ sender: Any) {
       appendOperator(op: "*")
    }
    
    @IBAction func divide(_ sender: Any) {
      appendOperator(op: "/")
    }
    
    func appendOperator(op: String){
        flag = false
        if  let lastChar = expression.last{
            
            if lastChar < "0" || lastChar > "9"{
                expression.removeLast()
                expression += op
                textLabel.text = expression
            }
            else{
                var history = expression
                let expn = NSExpression(format:expression)
                var x = expn.expressionValue(with: nil, context: nil)!
                if let historyToInt = Int(history){
                    
                }
                else{
                history += " = \(x)"
                    arr.append(history)}
                //textLabel.text = "\(x)"
                expression = "\(x)"
                expression += op
                textLabel.text = expression
            }
        }
    }
    var flag = false
    func appendNum(num : String){
        if flag{
            expression = num
            textLabel.text = expression
            flag = false
            
        }
        else{
            expression += num
            textLabel.text = expression}
    }
    @IBAction func one(_ sender: Any) {
        
       appendNum(num: "1")
        
        
        /* let expn = NSExpression(format:expression)
        var x = expn.expressionValue(with: nil, context: nil)!
        print(x)
        textLabel.text = "\(x)"
        expression = "\(x)"*/
       
    }
    
    @IBAction func two(_ sender: Any) {
       appendNum(num: "2")
       
    }
    
    @IBAction func three(_ sender: Any) {
      appendNum(num: "3")
    }
    
    @IBAction func four(_ sender: Any) {
       appendNum(num: "4")
    }
    
    @IBAction func five(_ sender: Any) {
       appendNum(num: "5")
    }
    
    @IBAction func six(_ sender: Any) {
       appendNum(num: "6")
    }
    
    @IBAction func seven(_ sender: Any) {
       appendNum(num: "7")
    }
    
    @IBAction func eight(_ sender: Any) {
       appendNum(num: "8")
            }
    
    @IBAction func nine(_ sender: Any) {
       appendNum(num: "9")
    }
   
    @IBAction func zero(_ sender: Any) {
       appendNum(num: "0")
    }
    
    
    @IBAction func equals(_ sender: Any) {
        flag = true
        if expression.count > 0{
        if var exp = Int(expression){
        }
        else if expression.count >= 3 && expression.last == "0" && Array(expression)[((expression.count)-2)] == "/"{
            textLabel.text = "can not divide by zero"
        }
        
        else{
         let expn = NSExpression(format:expression)
        
        print(expn.expressionValue(with: nil, context: nil)!)
        var x = expn.expressionValue(with: nil, context: nil)!
        
       
        var history = "\(expression) = \(x)"
        arr.append(history)
        
        textLabel.text = "\(x)"
        expression = "\(x)"
        }
        }
        
    }
    
    @IBAction func clear(_ sender: Any) {
        
        textLabel.text  = ""
        expression = ""
        flag = false
    }
 
}

