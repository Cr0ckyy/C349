//
//  ViewController.swift
//  Weight Management
//
//  Created by day4 on 5/11/20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var weight: UILabel!
    @IBOutlet weak var height: UILabel!
    @IBOutlet weak var bmi: UILabel!
    @IBOutlet weak var Header: UILabel!
    @IBOutlet weak var weightSelection: UISegmentedControl!
    @IBOutlet weak var heightSelection: UISegmentedControl!
    @IBOutlet weak var weightStatus: UILabel!
    @IBOutlet weak var weightStatus2: UILabel!
    
    @IBOutlet weak var inputWeight: UITextField!
    @IBOutlet weak var inputHeight: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        weight.text = "Enter Your Weight: "
        height.text = "Enter Your Height: "
        bmi.text = "BMI: "
        Header.text = "BMI CALCULATOR"
        
        weightSelection.setTitle("kg", forSegmentAt: 0)
        weightSelection.setTitle("lbs", forSegmentAt: 1)
        
        heightSelection.setTitle("meter", forSegmentAt: 0)
        heightSelection.setTitle("foot", forSegmentAt: 1)
        weightStatus.text = ""
        weightStatus2.text = ""
    }
    
    @IBAction func getWeight(_ sender: UITextField) {
        getVal()
    }
    
    @IBAction func getHeight(_ sender: UITextField) {
        getVal()
    }
    
    @IBAction func getWeightChoice(_ sender: UISegmentedControl) {
        getVal()
    }
    
    @IBAction func getHeightChoice(_ sender: UISegmentedControl) {
        getVal()
    }
    
    @IBAction func getVal() {
        let weightText:String = inputWeight.text!
        let heightText:String = inputHeight.text!
        
        let weightChoiceValue:Int = weightSelection.selectedSegmentIndex
        let heightChoiceValue:Int = heightSelection.selectedSegmentIndex
        
        if !weightText.isEmpty && !heightText.isEmpty {
            let weightValue:Double = Double(weightText)!
            let heightValue:Double = Double(heightText)!
            let bmiValue = BMI(weight: weightValue, height: heightValue, weightChoice: weightChoiceValue, heightChoice: heightChoiceValue)
            
            bmi.text = "BMI: \(bmiValue.bmi())"
            
            if (bmiValue.bmi() < 18.5) {
                weightStatus.text = "UnderWeight"
                weightStatus2.text = "You need to eat more"
            } else if (bmiValue.bmi() < 24.9) {
                weightStatus.text = "Normal"
                weightStatus2.text = "Good, maintain the weight"
            } else if (bmiValue.bmi() < 29.9) {
                weightStatus.text = "OverWeight"
                weightStatus2.text = "You need to go on a diet"
            } else {
                weightStatus.text = "Obese"
                weightStatus2.text = "You might want to consider hitting the gym"
            }
        }
    }
}

