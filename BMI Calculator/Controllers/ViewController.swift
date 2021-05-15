//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var heightValue: UILabel!
    @IBOutlet weak var weightValue: UILabel!
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    
    var bmi: Float = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func sliderMoved(_ sender: UISlider) {
        if sender.tag == 1{
            heightValue.text = String(format: "%.2fm",sender.value)
        }
        else{
            weightValue.text = String(format: "%.0fkg",sender.value)
        }
    }
    
    @IBAction func calculate(_ sender: UIButton) {
        let height = heightSlider.value
        let weight = weightSlider.value
        
        bmi = (weight/pow(height,2))
        print(bmi)
        
        self.performSegue(withIdentifier: "resultSegue", sender: self)

    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "resultSegue"{
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.bmiValue = String(format: "%.2f", bmi)
        }
    }
}

