//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by Midhun V on 15/05/21.
//  Copyright © 2021 Angela Yu. All rights reserved.
//

import Foundation
import UIKit

struct CalculatorBrain {

    var bmi: BMI?
    
    mutating func calculator(height: Float, weight: Float) {
        let bmiValue = (weight/pow(height,2))
        
        if bmiValue <= 18.5 && bmiValue > 0{
            bmi = BMI(value: bmiValue, advice: "Underweight", color: .yellow)
        }
        else if bmiValue >= 18.5 && bmiValue <= 24.9 {
            bmi = BMI(value: bmiValue, advice: "Normal weight", color: .green)
        }
        
        else if bmiValue > 24.9{
            bmi = BMI(value: bmiValue, advice: "Overweight", color: .red)
        }
    }
    
    func GetBMIvalue() -> String{
        return String(format: "%.2f", bmi?.value ?? 0.0)
    }
    
    func getAdvice() -> String {
        return bmi?.advice ?? ""
    }
    
    func getColor () -> UIColor {
        return bmi?.color ?? .gray
    }
}
