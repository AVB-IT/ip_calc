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

class TextFieldDelegateIpAddr: NSObject, UITextFieldDelegate {
    // допустимые символы для ввода
    let avalible_chars = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "", "."]
    // проверка соответствия формату IPv4
    func mayBeIpAddr (string: String) -> Bool {
        var txt = string.components(separatedBy: ".")
        if txt.count > 4 {
            return false
        }
        if txt.popLast() == "" && !txt.contains("") {
            return true
        }
        for i in string.components(separatedBy: ".") {
            if let oct = Int(i) {
                if oct >= 256 {
                    return false
                }
            }
            else {
                return false
            }
        }
        return true
    }

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if avalible_chars.contains(string) && mayBeIpAddr(string: textField.text! + string) {
            return true
        }
        else {
            return false
        }
    }
}

class TextFieldDelegateMask: TextFieldDelegateIpAddr {
    
    let avalible_mask_oct = ["0", "2", "4", "16", "32", "64", "128", "255"]
    override func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if string == "." {
            for i in (textField.text! + string).components(separatedBy: ".").dropLast() {
                if !avalible_mask_oct.contains(i) {
                    return false
                }
            }
        }
        if avalible_chars.contains(string) && mayBeIpAddr(string: textField.text! + string) {
            return true
        }
        else {
            return false
        }
    }
    
}

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {
    @IBOutlet weak var textField1: UITextField!
    @IBOutlet weak var textField2: UITextField!
    @IBOutlet weak var textField3: UITextField!
    let txtDlg = TextFieldDelegateIpAddr() // экземпляр кастомного делегата
    let maskDlg = TextFieldDelegateMask() // экземпляр кастомного делегата

    //Подключение пикера
    @IBOutlet weak var IPPickerSelect: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Инициализация поведения текстовых поля
        textField1.delegate = txtDlg // кастомный делегат
        textField2.delegate = maskDlg // дефолтный делегат
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
    
    // лоховичковский способ делегирования (дефолтный делегат)
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
