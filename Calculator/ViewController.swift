//
//  ViewController.swift
//  Calculator
//
//  Created by Vineeth Xavier on 9/19/17.
//  Copyright © 2017 Vineeth Xavier. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var numberOnScreen:Double = 0
    var previousNumber:Double = 0
    var performingMath = false
    var operation = 0
    @IBOutlet weak var label: UILabel!
    @IBAction func number(_ sender: UIButton) {
        if performingMath == true{
            label.text = String(sender.tag-1)
            numberOnScreen = Double(label.text!)!
            performingMath = false
        }
        else{
            label.text = label.text! + String(sender.tag - 1) // tag -1 coz  0 tag = 1 , 1 tag = 2.. 9 tag = 10  AC tag  = 11
            numberOnScreen = Double(label.text!)!
        }
        
    }
    
    
    @IBAction func buttons(_ sender: UIButton) {
        
        if (label.text != "" && sender.tag != 11 && sender.tag != 16){
            previousNumber = Double(label.text!)!
            if (sender.tag == 12){ //divide
                label.text = "/"
            }
            else if (sender.tag == 13){//multiply
                label.text = "x"
            }
            else if (sender.tag == 14){//subtract
                label.text = "-"
            }
            else if (sender.tag == 15){//add
                label.text = "+"
            }
            operation = sender.tag
            performingMath = true
        }
        else if sender.tag == 16{
            if operation == 12{
                label.text = String(previousNumber / numberOnScreen)
            }
            else if operation == 13{
                label.text = String(previousNumber * numberOnScreen)
            }
            else if operation == 14{
                label.text = String(previousNumber - numberOnScreen)
            }
            else if operation == 15{
                label.text = String(previousNumber + numberOnScreen)
            }
        }
        else if sender.tag == 11{
            label.text = ""
            previousNumber = 0
            numberOnScreen = 0
            operation = 0
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

