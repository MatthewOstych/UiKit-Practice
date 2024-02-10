
import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate {

    
    let toolbar = UIToolbar()
    
    var textFieldForPicker = UITextField()
    var textFieldToEnter = UITextField()
    
    var picker = UIPickerView()
    
    var pickerArray = ["Clear", "2", "Copy"]
    
    var activityVewControlled : UIActivityViewController?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        picker.dataSource = self
        picker.delegate = self
        
        toolbar.barStyle = .black
        toolbar.sizeToFit()
        let donebutton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(checktext))
        toolbar.setItems([donebutton], animated: false)
        
        textFieldForPicker.inputAccessoryView = toolbar
        
        textFieldToEnter.placeholder = "Enter text To Copy"
        textFieldToEnter.borderStyle = .roundedRect
        textFieldToEnter.frame = CGRect(x: 50, y: 300, width: 300, height: 30)
        self.view.addSubview(textFieldToEnter)
        
        textFieldForPicker.placeholder = "Select copy"
        textFieldForPicker.borderStyle = .roundedRect
        textFieldForPicker.frame = CGRect(x: 0, y: 0, width: 200, height: 30)
        textFieldForPicker.center = self.view.center
        self.view.addSubview(textFieldForPicker)
        textFieldForPicker.inputView = picker
        textFieldForPicker.delegate = self
        textFieldForPicker.addTarget(self, action: #selector(textFieldTaped), for: .editingDidBegin)
        
    }
    
    
    //MARK: - Functions
    @objc func textFieldTaped() {
        textFieldForPicker.text = "Clear"
    }
    
    //Functions for picker
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerArray[row]
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {

        return textFieldForPicker.text = pickerArray[row]
        
    }
    
    @objc func checktext() {
        
        switch textFieldForPicker.text {
        case "Copy" :
            
            if self.textFieldToEnter.text?.count != 0 {
                self.activityVewControlled = UIActivityViewController(activityItems: [self.textFieldToEnter.text ?? "No text"], applicationActivities: nil)
                present(activityVewControlled!, animated: true)
            } else {
                let alertText = "Please type text first"
                let alert = UIAlertController(title: nil, message: alertText, preferredStyle: .alert)
                let action = UIAlertAction(title: "Ok", style: .cancel)
                alert.addAction(action)
                present(alert, animated: true)
            }
            
        case "Clear" :
            textFieldToEnter.text = ""
            
        default: ()
        }
        
        textFieldForPicker.text = ""
        textFieldForPicker.resignFirstResponder()
    }
    
    
}
