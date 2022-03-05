//
//  ViewController.swift
//  zad_1_4
//
//  Created by Rafał Kuźmiczuk on 06/03/2022.
//  Copyright © 2022 Rafał Kuźmiczuk. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var textField1: UITextField!
    
    @IBOutlet weak var textField2: UITextField!
    
    @IBOutlet weak var calculateButton: UIButton!
    
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBAction func calculateButtonOnClick(_ sender: Any) {
        guard let number_1 = Double(textField1.text!) else {
            return
        }
        guard let number_2 = Double(textField2.text!) else {
            return
        }
        if number_2 == 0 {
            let alertController = UIAlertController(title: "Uwaga", message: "Dzielenie przez zero", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title:"Dismiss", style: .default))
            self.present(alertController, animated: true, completion: nil)
            return
        }
        
        let result = number_1 / number_2
        resultLabel.text = String(format: "%.3lf", result)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

}

