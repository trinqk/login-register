//
//  RegisterViewController.swift
//  login-register
//
//  Created by Joshua  Lee on 4/14/18.
//  Copyright © 2018 Joshua  Lee. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {
    
    let blue = UIColor(red: 53, green: 152, blue: 220)

    // MARK: - UI ELEMENTS
    let welcomeLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.white
        label.text = "welcome."
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = NSTextAlignment.left
        label.alpha = 0
        return label
    }()
    
    lazy var closeButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = blue
        button.setImage(UIImage(named: "close"), for: .normal)
        button.imageEdgeInsets = UIEdgeInsetsMake(10, 10, 10, 10)
        button.layer.cornerRadius = 20
        button.alpha = 0
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let nameTextField: UITextField = {
        let field = UITextField()
        field.clearButtonMode = UITextFieldViewMode.whileEditing;
        field.autocorrectionType = UITextAutocorrectionType.no
        field.translatesAutoresizingMaskIntoConstraints = false
        field.textColor = UIColor.white
        field.attributedPlaceholder = NSAttributedString(string: "name", attributes: [NSAttributedStringKey.foregroundColor: UIColor.white])
        field.alpha = 0
        return field
    }()
    
    let nameSeperator: UIView = {
        let line = UIView()
        line.backgroundColor = UIColor.white
        line.translatesAutoresizingMaskIntoConstraints = false
        line.alpha = 0
        return line
    }()
    
    let displayNameTextField: UITextField = {
        let field = UITextField()
        field.clearButtonMode = UITextFieldViewMode.whileEditing;
        field.autocorrectionType = UITextAutocorrectionType.no
        field.translatesAutoresizingMaskIntoConstraints = false
        field.textColor = UIColor.white
        field.attributedPlaceholder = NSAttributedString(string: "username", attributes: [NSAttributedStringKey.foregroundColor: UIColor.white])
        field.alpha = 0
        return field
    }()
    
    let displayNameSeperator: UIView = {
        let line = UIView()
        line.backgroundColor = UIColor.white
        line.translatesAutoresizingMaskIntoConstraints = false
        line.alpha = 0
        return line
    }()
    
    let emailTextField: UITextField = {
        let field = UITextField()
        field.clearButtonMode = UITextFieldViewMode.whileEditing;
        field.autocorrectionType = UITextAutocorrectionType.no
        field.translatesAutoresizingMaskIntoConstraints = false
        field.textColor = UIColor.white
        field.attributedPlaceholder = NSAttributedString(string: "email", attributes: [NSAttributedStringKey.foregroundColor: UIColor.white])
        field.alpha = 0
        return field
    }()
    
    let emailSeperator: UIView = {
        let line = UIView()
        line.backgroundColor = UIColor.white
        line.translatesAutoresizingMaskIntoConstraints = false
        line.alpha = 0
        return line
    }()
    
    let passwordTextField: UITextField = {
        let field = UITextField()
        field.clearButtonMode = UITextFieldViewMode.whileEditing;
        field.autocorrectionType = UITextAutocorrectionType.no
        field.translatesAutoresizingMaskIntoConstraints = false
        field.textColor = UIColor.white
        field.attributedPlaceholder = NSAttributedString(string: "password", attributes: [NSAttributedStringKey.foregroundColor: UIColor.white])
        field.isSecureTextEntry = true
        field.alpha = 0
        return field
    }()
    
    let passwordSeperator: UIView = {
        let line = UIView()
        line.backgroundColor = UIColor.white
        line.translatesAutoresizingMaskIntoConstraints = false
        line.alpha = 0
        return line
    }()
    
    lazy var registerButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor.white
        button.setTitleColor(blue, for: .normal)
        button.setTitle("register", for: .normal)
        button.alpha = 0
        button.layer.cornerRadius = 25
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // MARK: - INITIAL STARTUP SETUP
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        setUpFonts()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        showView()
    }
    
    // MARK: - FIREBASE METHODS
    @objc func handleRegister() {
        
    }
    
    // MARK: - ANIMATIONS AND SETUP
    func setUpFonts() {
        if let heavy = UIFont(name: "AvenirNext-Heavy", size: 48.0), let regular = UIFont(name: "AvenirNext-Regular", size: 26){
            welcomeLabel.font = heavy
            nameTextField.font = regular
            displayNameTextField.font = regular
            emailTextField.font = regular
            passwordTextField.font = regular
            registerButton.titleLabel?.font = regular
        }
    }
    
    func setUpView() {
        view.backgroundColor = blue
        
        view.addSubview(closeButton)
        closeButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 12).isActive = true
        closeButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 12).isActive = true
        closeButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        closeButton.widthAnchor.constraint(equalToConstant: 40).isActive = true
        closeButton.addTarget(self, action: #selector(dismissRegister), for: .touchUpInside)
        
        view.addSubview(welcomeLabel)
        welcomeLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 65).isActive = true
        welcomeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        welcomeLabel.widthAnchor.constraint(equalToConstant: 270)
        welcomeLabel.heightAnchor.constraint(equalToConstant: 75).isActive = true
        
        view.addSubview(emailTextField)
        emailTextField.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 12).isActive = true
        emailTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        emailTextField.widthAnchor.constraint(equalToConstant: 250).isActive = true
        emailTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        view.addSubview(emailSeperator)
        emailSeperator.topAnchor.constraint(equalTo: emailTextField.bottomAnchor).isActive = true
        emailSeperator.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        emailSeperator.widthAnchor.constraint(equalToConstant: 260).isActive = true
        emailSeperator.heightAnchor.constraint(equalToConstant: 3).isActive = true
        
        view.addSubview(passwordTextField)
        passwordTextField.topAnchor.constraint(equalTo: emailSeperator.bottomAnchor, constant: 12).isActive = true
        passwordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        passwordTextField.widthAnchor.constraint(equalToConstant: 250).isActive = true
        passwordTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        view.addSubview(passwordSeperator)
        passwordSeperator.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor).isActive = true
        passwordSeperator.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        passwordSeperator.widthAnchor.constraint(equalToConstant: 260).isActive = true
        passwordSeperator.heightAnchor.constraint(equalToConstant: 3).isActive = true
        
        view.addSubview(nameTextField)
        nameTextField.topAnchor.constraint(equalTo: passwordSeperator.bottomAnchor, constant: 30).isActive = true
        nameTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        nameTextField.widthAnchor.constraint(equalToConstant: 250).isActive = true
        nameTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        view.addSubview(nameSeperator)
        nameSeperator.topAnchor.constraint(equalTo: nameTextField.bottomAnchor).isActive = true
        nameSeperator.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        nameSeperator.widthAnchor.constraint(equalToConstant: 260).isActive = true
        nameSeperator.heightAnchor.constraint(equalToConstant: 3).isActive = true
        
        view.addSubview(displayNameTextField)
        displayNameTextField.topAnchor.constraint(equalTo: nameSeperator.bottomAnchor, constant: 12).isActive = true
        displayNameTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        displayNameTextField.widthAnchor.constraint(equalToConstant: 250).isActive = true
        displayNameTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        view.addSubview(displayNameSeperator)
        displayNameSeperator.topAnchor.constraint(equalTo: displayNameTextField.bottomAnchor).isActive = true
        displayNameSeperator.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        displayNameSeperator.widthAnchor.constraint(equalToConstant: 260).isActive = true
        displayNameSeperator.heightAnchor.constraint(equalToConstant: 3).isActive = true
        
        view.addSubview(registerButton)
        registerButton.topAnchor.constraint(equalTo: displayNameSeperator.bottomAnchor, constant: 24).isActive = true
        registerButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        registerButton.widthAnchor.constraint(equalToConstant: 150).isActive = true
        registerButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        registerButton.addTarget(self, action: #selector(handleRegister), for: .touchUpInside)
    }
    
    func showView() {
        welcomeLabel.center.y = welcomeLabel.center.y - 30
        
        nameTextField.center.x = nameTextField.center.x - 30
        nameSeperator.center.x = nameSeperator.center.x - 30
        displayNameTextField.center.x = displayNameTextField.center.x - 30
        displayNameSeperator.center.x = displayNameSeperator.center.x - 30
        
        emailTextField.center.x = emailTextField.center.x - 30
        emailSeperator.center.x = emailSeperator.center.x - 30
        
        passwordTextField.center.x = passwordTextField.center.x - 30
        passwordSeperator.center.x = passwordSeperator.center.x - 30
        
        UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseIn, animations: {
            self.welcomeLabel.alpha = 1
            self.welcomeLabel.center.y = self.welcomeLabel.center.y + 30
        }) { (_) in
            UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseInOut, animations: {
                self.closeButton.alpha = 1
                self.emailTextField.center.x = self.emailTextField.center.x + 30
                self.emailTextField.alpha = 1
                self.emailSeperator.center.x = self.emailSeperator.center.x + 30
                self.emailSeperator.alpha = 1
            }, completion: { (_) in
                UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseInOut, animations: {
                    self.passwordTextField.center.x = self.passwordTextField.center.x + 30
                    self.passwordTextField.alpha = 1
                    self.passwordSeperator.center.x = self.passwordSeperator.center.x + 30
                    self.passwordSeperator.alpha = 1
                }, completion: { (_) in
                    UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseInOut, animations: {
                        self.nameTextField.center.x = self.nameTextField.center.x + 30
                        self.nameTextField.alpha = 1
                        self.nameSeperator.center.x = self.nameSeperator.center.x + 30
                        self.nameSeperator.alpha = 1
                    }, completion: { (_) in
                        UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseInOut, animations: {
                            self.displayNameTextField.center.x = self.displayNameTextField.center.x + 30
                            self.displayNameTextField.alpha = 1
                            self.displayNameSeperator.center.x = self.displayNameSeperator.center.x + 30
                            self.displayNameSeperator.alpha = 1
                        }, completion: { (_) in
                            UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseIn, animations: {
                                self.registerButton.alpha = 1
                            }, completion: nil)
                        })
                    })
                })
            })
        }
    }
    
    @objc func dismissRegister() {
        dismiss(animated: true, completion: nil)
    }
}
