//
//  ViewController.swift
//  IP Calculator
//
//  Created by Павел Власов on 26.08.17.
//  Copyright © 2017 AVB-IT. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    //Подключение пикера
    @IBOutlet weak var IPPickerSelect: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Инициализация пикера
        IPPickerSelect.delegate = self
        IPPickerSelect.dataSource = self
    }
    
    //Общее количество компонентов в пикере (столбцов)
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 5
    }

    //Количество компонентов в столбцах пикера
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 255
    }
    
//Наброски для заполнения пикера значениями
//    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//       
//    }
//    
//    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
//        
//    }

}
