//
//  SecondViewController.swift
//  UILabelTest
//
//  Created by Mathew Lantsov on 18.02.2024.
//

import UIKit

class SecondViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    

    
    var changeColorLabel = UITextField()
    var changeColorPicker = UIPickerView()
    
    var changeBackgrwLabel = UITextField()
    var changeBackgrwPicker = UIPickerView()
    
    var shadowText = UILabel()
    var shadowSwitch = UISwitch()
    
    let colorsArray = ["Black", "Red", "Green", "Yellow", "Magneta"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        var tabbarItem = UITabBarItem()
        tabbarItem = UITabBarItem(title: "Settings", image: UIImage(named: "settings"), tag: 1)
        self.tabBarItem = tabbarItem
        
        changeColorLabel.placeholder = "Change Color"
        changeColorLabel.borderStyle = .roundedRect
        changeColorLabel.inputView = changeColorPicker
        
        changeBackgrwLabel.placeholder = "Change Background"
        changeBackgrwLabel.borderStyle = .roundedRect
        changeBackgrwLabel.inputView = changeBackgrwPicker
        
        changeColorPicker.delegate = self
        changeColorPicker.dataSource = self
        changeBackgrwPicker.delegate = self
        changeBackgrwPicker.dataSource = self
        
        changeBackgrwLabel.frame = CGRect(
            x: self.view.center.x - 150,
            y: self.view.center.y - 50,
            width: 280, height: 30)
        
        changeColorLabel.frame = CGRect(
            x: self.view.center.x - 150,
            y: self.view.center.y - 100,
            width: 280, height: 30)
        
        shadowSwitch.frame = CGRect(
            x: self.view.center.x + 30,
            y: self.view.center.y,
            width: 30, height: 30)
        shadowSwitch.addTarget(self, action: #selector(shadowCheck), for: .touchUpInside)
        shadowSwitch.isOn = true
        
        shadowText.text = "Shadow >"
        shadowText.font = UIFont.boldSystemFont(ofSize: 16)
        shadowText.frame = CGRect(
            x: self.view.center.x - 100,
            y: self.view.center.y,
            width: 300, height: 30)
        
        let donebutton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(closeit))
        let spacebutton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
       
        let toolBar = UIToolbar()
        toolBar.barStyle = .default
        toolBar.sizeToFit()
        toolBar.setItems([spacebutton, donebutton], animated: false)
        
        changeColorLabel.inputAccessoryView = toolBar
        changeBackgrwLabel.inputAccessoryView = toolBar
        
        changeColorPicker.tag = 0
        changeBackgrwPicker.tag = 1
        
        self.view.addSubview(changeColorLabel)
        self.view.addSubview(changeBackgrwLabel)
        self.view.addSubview(shadowSwitch)
        self.view.addSubview(shadowText)
    }
    //Funcs
    @objc func closeit() {
        changeColorLabel.resignFirstResponder()
        changeBackgrwLabel.resignFirstResponder()
    }
    
    //Funtions for Picker
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {

            return colorsArray.count

    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return colorsArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView.tag {
        case 0:
            changeColorLabel.text = colorsArray[row]
            switch colorsArray[row] {
            case "Black":
                TxtColorBase.textColor = .black
            case "Red":
                TxtColorBase.textColor = .red
            case "Green":
                TxtColorBase.textColor = .green
            case "Yellow":
                TxtColorBase.textColor = .yellow
            case "Magneta":
                TxtColorBase.textColor = .magenta
            default:
                print("Error")
            }
            
        case 1:
            changeBackgrwLabel.text = colorsArray[row]
            switch colorsArray[row] {
            case "Black":
                TxtColorBase.backbroundColor = .black
            case "Red":
                TxtColorBase.backbroundColor = .red
            case "Green":
                TxtColorBase.backbroundColor = .green
            case "Yellow":
                TxtColorBase.backbroundColor = .yellow
            case "Magneta":
                TxtColorBase.backbroundColor = .magenta
            default:
                print("Error")
            }
            
        default: ()
        }
    }

    @objc func shadowCheck() {
        if shadowSwitch.isOn {
            TxtColorBase.shadowEvaili = .darkGray
        } else {
            TxtColorBase.shadowEvaili = .clear

        }
    }
}

