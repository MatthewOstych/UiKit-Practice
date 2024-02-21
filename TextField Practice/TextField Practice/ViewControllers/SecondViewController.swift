//
//  SecondViewController.swift
//  TextField Practice
//
//  Created by Mathew Lantsov on 20.02.2024.
//

import UIKit

class SecondViewController: UIViewController {

    private var login = UserData.login
    private var fullName = UserData.fullName
    
    var loginViewLabel = UILabel()
    var nameViewLabel = UILabel()
    
    var changeNameButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        
        addloginViewFunc()
        addNameFunc()
        addChangeButtonFunc()
    }
    
    
    //MARK: - Funcs
    func addChangeButtonFunc() {
        let buttonFrame = CGRect(
            x: self.view.center.x - 80,
            y: self.view.center.y - 90,
            width: 160, height: 40)
        
        changeNameButton.frame = buttonFrame
        changeNameButton.setTitle("Change Name", for: .normal)
        changeNameButton.backgroundColor = .black
        changeNameButton.setTitleColor(.white, for: .normal)
        changeNameButton.layer.cornerRadius = 20
        
        changeNameButton.addTarget(self, action: #selector(changeNameButtonFunc), for: .touchUpInside)
        
        self.view.addSubview(changeNameButton)
    }
    
    func addloginViewFunc() {
        
        let loginFrame = CGRect(
            x: self.view.center.x - 50,
            y: self.view.center.y - 380,
            width: 300, height: 100)
        
        loginViewLabel.text = "Hello, \(login)"
        loginViewLabel.frame = loginFrame
        loginViewLabel.font = UIFont.boldSystemFont(ofSize: 20)
        self.view.addSubview(loginViewLabel)
    }
    
    func addNameFunc() {
        
        let nameFrame = CGRect(
            x: self.view.center.x - 80,
            y: self.view.center.y - 180,
            width: 300, height: 100)
        
        nameViewLabel.text = "Your name - \(fullName)"
        nameViewLabel.frame = nameFrame
        nameViewLabel.font = UIFont.systemFont(ofSize: 20)
        self.view.addSubview(nameViewLabel)
    }

 
    //MARK: - Buttons Funcs
    @objc func changeNameButtonFunc() {
        
        let nameAlert = UIAlertController(title: nil, message: "Type New Name", preferredStyle: .alert)
        let okButton = UIAlertAction(title: "Ok", style: .default) { (action) in
            if let nameToChange = nameAlert.textFields?.first?.text {
                
                UserData.fullName = nameToChange
                self.fullName = UserData.fullName
                self.addNameFunc()
                
            }
        }
        
        nameAlert.addTextField()
        nameAlert.addAction(okButton)
        
        self.present(nameAlert, animated: true)
    }
}
