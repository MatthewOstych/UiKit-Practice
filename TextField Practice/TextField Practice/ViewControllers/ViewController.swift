

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    var loginTextField = UITextField()
    var passTextField = UITextField()
    var fullNameTextField = UITextField()
    var nextScreenButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.createLoginTextFieldFunc()
        self.createPassTextFieldFunc()
        self.createNameTextFieldFunc()
        self.createNextScreenButtonFunc()


    }
    
    //MARK: - Button Func
    @objc func nextScreen() {
        switch (loginTextField.text?.isEmpty, passTextField.text?.isEmpty, fullNameTextField.text?.isEmpty) {
        case (true, _, _):
            dataAlert(data: "login")
        case (_, true, _):
            dataAlert(data: "Password")
        case (_, _, true):
            dataAlert(data: "Full Name")
        default:
            
            if let fullName = fullNameTextField.text,
               let login = loginTextField.text,
               let pass = passTextField.text {
                
                UserData.fullName = fullName
                UserData.login = login
                UserData.password = pass
            }
            
            let secondVC = SecondViewController()
            self.navigationController?.pushViewController(secondVC, animated: true)
        }
        
        
    }
    
    //MARK: - Allert Func
    func dataAlert(data: String) {
        let dataAlertController = UIAlertController(title: nil, message: "Add your \(data)", preferredStyle: .alert)
        let okButton = UIAlertAction(title: "Ok", style: .cancel)
        dataAlertController.addAction(okButton)
        self.present(dataAlertController, animated: true)
    }

    //MARK: - Adding View Funcs
    func createNextScreenButtonFunc() {
        let nextScrButtonFrame = CGRect(
            x: self.view.center.x - 50,
            y: self.view.center.y + 10,
            width: 100, height: 40)
        
        nextScreenButton.frame = nextScrButtonFrame
        nextScreenButton.setTitle("Register", for: .normal)
        nextScreenButton.backgroundColor = .black
        nextScreenButton.setTitleColor(.white, for: .normal)
        nextScreenButton.layer.cornerRadius = 20
        
        nextScreenButton.addTarget(self, action: #selector(nextScreen), for: .touchUpInside)
        
        self.view.addSubview(nextScreenButton)

    }
    
    func createNameTextFieldFunc() {
        let nameTextFieldFrame = CGRect(
            x: self.view.center.x - 120,
            y: self.view.center.y - 80,
            width: 280, height: 30)
        
        fullNameTextField.delegate = self
        
        fullNameTextField.frame = nameTextFieldFrame
        fullNameTextField.borderStyle = .roundedRect
        fullNameTextField.placeholder = "Your Full Name"
        
        fullNameTextField.tag = 2
        
        view.addSubview(fullNameTextField)
    }
    
    func createPassTextFieldFunc() {
        let passTextFieldFrame = CGRect(
            x: self.view.center.x - 120,
            y: self.view.center.y - 130,
            width: 280, height: 30)
        
        passTextField.delegate = self
        
        passTextField.frame = passTextFieldFrame
        passTextField.borderStyle = .roundedRect
        passTextField.placeholder = "Your Pass"
        passTextField.isSecureTextEntry = true
        
        passTextField.tag = 1
        
        view.addSubview(passTextField)
    }
    
    func createLoginTextFieldFunc() {
        
        let loginTextFieldFrame = CGRect(
            x: self.view.center.x - 120,
            y: self.view.center.y - 180,
            width: 280, height: 30)
        
        loginTextField.delegate = self
        
        loginTextField.frame = loginTextFieldFrame
        loginTextField.borderStyle = .roundedRect
        loginTextField.placeholder = "Your Login"
        
        loginTextField.tag = 0
        
        view.addSubview(loginTextField)
    }
    
    
        //MARK: - TextField Functions
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        switch textField.tag {
        case 0, 1, 2:
            NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: nil) { (nc) in
                self.view.frame.origin.y = -100
            }
            
            NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: nil) { (nc) in
                self.view.frame.origin.y = 0.0
            }
            
        default: ()
        }
        return true
    }


    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        
        switch textField.tag {
        case 0:
            passTextField.becomeFirstResponder()
        case 1:
            fullNameTextField.becomeFirstResponder()
        default:
            textField.resignFirstResponder()
        }
        return true
    }
}

