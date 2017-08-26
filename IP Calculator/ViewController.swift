//
//  ViewController.swift
//  IP Calculator
//
//  Created by Павел Власов on 26.08.17.
//  Copyright © 2017 AVB-IT. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var IPPickerSelect: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        IPPickerSelect.delegate = self
        IPPickerSelect.dataSource = self
    }
    
    //Общее количество компонентов
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 5
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 255
    }
    
//    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//       
//    }
//    
//    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
//        
//    }

}
