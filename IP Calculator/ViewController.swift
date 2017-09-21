//
//  ViewController.swift
//  IP Calculator
//
//  Created by Павел Власов on 26.08.17.
//  Copyright © 2017 AVB-IT. All rights reserved.
//

import UIKit

// реализация кастомного делегата
// дополнительно наследует NSObject для соответсвия UITextFieldDelegate

class TextFieldDelegate: NSObject, UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.text = "hui"
    }
}

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {
    @IBOutlet weak var textField1: UITextField!
    @IBOutlet weak var textField2: UITextField!
    @IBOutlet weak var textField3: UITextField!
    let txtDlg = TextFieldDelegate() // экземпляр кастомного делегата

    //Подключение пикера
    @IBOutlet weak var IPPickerSelect: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Инициализация поведения текстовых поля
        textField1.delegate = txtDlg // кастомный делегат
        textField2.delegate = self // дефолтный делегат
        textField3.delegate = self // дефолтный делегат
        
        //Инициализация пикераßx
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
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.text = "pizda"
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
