//
//  ViewController.swift
//  UITextView Test
//
//  Created by Mathew Lantsov on 22.02.2024.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var fontPickerTextField = UITextField()
    var mainTextView = UITextView()
    var fontSlider = UISlider()
    var fontSegmentControl = UISegmentedControl()
    var lightSegmentControl = UISegmentedControl()
    var fontPicker = UIPickerView()
    
    let fontsNames = ["Helvetica", "Arial", "Times New Roman", "Courier New"]
    let segmentItems = ["Regular", "Bold"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createMainTextView()
        createFontSlider()
        createfontSegmentControl()
        createLightFontPeaker()
        createFontPicker()
        createShareButton()
        
    }

    //MARK: - Create Funcs
    
    func createShareButton() {
        let shareButton = UIButton(type: .system)
        shareButton.setTitle("Share", for: .normal)
        shareButton.setTitleColor(.white, for: .normal)
        shareButton.backgroundColor = .systemBlue
        shareButton.layer.cornerRadius = 12
        shareButton.addTarget(self, action: #selector(shareText), for: .touchUpInside)
        shareButton.frame = CGRect(
            x: 0,
            y: 0,
            width: 80, height: 30)
        shareButton.center = self.view.center
        shareButton.center.y = self.view.center.y + 90
        view.addSubview(shareButton)
    }
    
    
    func createMainTextView() {
        
        mainTextView.text = "The sun rises, painting the sky in hues of gold and pink. Birds sing their morning melodies, and the world awakens to embrace a new day."
        mainTextView.frame = CGRect(
            x: 5,
            y: 130,
            width: self.view.bounds.width - 10,
            height: self.view.bounds.height / 4)
        mainTextView.backgroundColor = .darkGray
        mainTextView.textColor = .white
        mainTextView.contentInset = UIEdgeInsets(top: 10, left: 5, bottom: 0, right: 0)
        mainTextView.layer.cornerRadius = 10
        self.view.addSubview(mainTextView)
        
        mainTextView.font = UIFont(name: "Helvetica", size: 20)
    }
    
    func createFontSlider() {
        fontSlider.minimumValue = 10
        fontSlider.maximumValue = 27
        fontSlider.value = 20
        
        fontSlider.frame = CGRect(
            x: 10,
            y: self.view.center.y - 20,
            width: self.view.bounds.width - 30, height: 20)
        fontSlider.addTarget(self, action: #selector(sliderChangeFont), for: .valueChanged)
        self.view.addSubview(fontSlider)
    }
    
    func createLightFontPeaker() {
        let segmentItems = ["Light", "Dark"]
        lightSegmentControl = UISegmentedControl(items: segmentItems)
        lightSegmentControl.selectedSegmentIndex = 0
        lightSegmentControl.addTarget(self, action: #selector(lightChangeFunc), for: .valueChanged)
        lightSegmentControl.frame = CGRect(
            x: 260,
            y: self.view.center.y - 60,
            width: 120, height: 30)
        
        view.addSubview(lightSegmentControl)
    }
    
    func createfontSegmentControl() {
        fontSegmentControl = UISegmentedControl(items: segmentItems)
        fontSegmentControl.selectedSegmentIndex = 0
        fontSegmentControl.addTarget(self, action: #selector(fontChangeSegmentControl), for: .valueChanged)
        fontSegmentControl.frame = CGRect(
            x: 10,
            y: self.view.center.y - 60,
            width: 150, height: 30)
        
        view.addSubview(fontSegmentControl)
    }
    
    func createFontPicker() {
        let pickerToolBar = UIToolbar()
        
        fontPicker.delegate = self
        fontPicker.dataSource = self
        
        let doneButton = UIBarButtonItem(title: "Add", style: .done, target: self, action: #selector(closeTextFieldPicker))
        let spaceButton =  UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        pickerToolBar.barStyle = .default
        pickerToolBar.sizeToFit()
        pickerToolBar.setItems([spaceButton, doneButton], animated: false)
        
        fontPickerTextField.inputView = fontPicker
        fontPickerTextField.inputAccessoryView = pickerToolBar
        fontPickerTextField.text = "Helvetica"
        fontPickerTextField.borderStyle = .roundedRect
        fontPickerTextField.textAlignment = .center
        fontPickerTextField.frame = CGRect(
            x: 10,
            y: self.view.center.y + 20,
            width: self.view.bounds.width - 25, height: 30)
        
        
        view.addSubview(fontPickerTextField)
        
    }
    
    //MARK: - Other Funcs
    @objc func sliderChangeFont(_ sender: UISlider) {
        
        switch fontSegmentControl.selectedSegmentIndex {
        case 0:
            if let fontName = fontPickerTextField.text {
                mainTextView.font = UIFont(name: fontName, size: CGFloat(sender.value))
            }

        case 1:
            if let fontName = fontPickerTextField.text {
                mainTextView.font = UIFont(name: fontName + " Bold", size: CGFloat(sender.value))
            }
        default:
            ()

        }
    }
    
    @objc func closeTextFieldPicker() {
        fontPickerTextField.resignFirstResponder()
    }
    
    @objc func lightChangeFunc(_ sender: UISegmentedControl) {
        let selectedSegmentIndex = sender.selectedSegmentIndex
        switch selectedSegmentIndex {
        case 0:
            view.backgroundColor = .white
            mainTextView.backgroundColor = .darkGray
            mainTextView.textColor = .white
            
            fontSegmentControl.backgroundColor = .white
            lightSegmentControl.backgroundColor = .white
            fontPickerTextField.backgroundColor = .white
        case 1:
            view.backgroundColor = .black
            mainTextView.backgroundColor = .lightGray
            mainTextView.textColor = .black
            
            fontSegmentControl.backgroundColor = .darkGray
            lightSegmentControl.backgroundColor = .darkGray
            fontPickerTextField.backgroundColor = .darkGray
        default: ()
        }
        
    }
    @objc func fontChangeSegmentControl(_ sender: UISegmentedControl) {
        let selectedSegmentIndex = sender.selectedSegmentIndex
        
        switch selectedSegmentIndex {
        case 0:
            
            if let fontName = fontPickerTextField.text {
                mainTextView.font = UIFont(name: fontName, size: CGFloat(fontSlider.value))
            }

        case 1:
            
            if let fontName = fontPickerTextField.text {
                mainTextView.font = UIFont(name: fontName + " Bold", size: CGFloat(fontSlider.value))

            }
        default:
            ()
        }
    }
    
    @objc func shareText() {
        var textToShare = ["Font \(fontPickerTextField.text!)-" 
                           + "\(segmentItems[fontSegmentControl.selectedSegmentIndex]). \n"
                           + "Size: \(fontSlider.value). \n"
                           + mainTextView.text!]
        
        if mainTextView.text.isEmpty {
            textToShare = ["No text"]
        }
        
        let activityViewController = UIActivityViewController(activityItems: textToShare, applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = view
        present(activityViewController, animated: true, completion: nil)
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.mainTextView.resignFirstResponder()
    }
    
    //MARK: - PickerView Funcs
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return fontsNames.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return fontsNames[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    
        
        switch fontSegmentControl.selectedSegmentIndex {
        case 0:
            fontPickerTextField.text = fontsNames[row]
            mainTextView.font = UIFont(name: fontsNames[row], size: CGFloat(fontSlider.value))
        case 1:
            fontPickerTextField.text = fontsNames[row]
            mainTextView.font = UIFont(name: fontsNames[row] + " Bold", size: CGFloat(fontSlider.value))
        default:
            ()
        }
    }

}

