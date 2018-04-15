import UIKit

class ViewController: UIViewController {
    
    let blue = UIColor(red: 53, green: 152, blue: 220)
    
    // MARK: - UI ELEMENTS
    var logoImage: UIImageView = {
        var imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 250, height: 250));
        imageView.image = UIImage(named:"winter")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor.white
        button.setTitleColor(blue, for: .normal)
        button.setTitle("login", for: .normal)
        button.layer.borderColor = blue.cgColor
        button.layer.borderWidth = 2.0
        button.layer.cornerRadius = 25
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var registerButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = blue
        button.setTitleColor(UIColor.white, for: .normal)
        button.setTitle("register", for: .normal)
        button.layer.cornerRadius = 25
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var closeButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = blue
        button.setImage(UIImage(named: "close"), for: .normal)
        button.imageEdgeInsets = UIEdgeInsetsMake(10, 10, 10, 10)
        button.layer.cornerRadius = 20
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let emailTextField: UITextField = {
        let field = UITextField()
        field.placeholder = "email"
        field.clearButtonMode = UITextFieldViewMode.whileEditing;
        field.autocorrectionType = UITextAutocorrectionType.no
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()
    
    let passwordTextField: UITextField = {
        let field = UITextField()
        field.placeholder = "password"
        field.clearButtonMode = UITextFieldViewMode.whileEditing;
        field.autocorrectionType = UITextAutocorrectionType.no
        field.isSecureTextEntry = true
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()
    
    let emailSeperator: UIView = {
        let line = UIView()
        line.backgroundColor = UIColor.lightGray
        line.translatesAutoresizingMaskIntoConstraints = false
        return line
    }()
    
    let passwordSeperator: UIView = {
        let line = UIView()
        line.backgroundColor = UIColor.lightGray
        line.translatesAutoresizingMaskIntoConstraints = false
        return line
    }()
    
    // MARK: - INITIAL STARTUP SETUP
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        setUpLoginContainer()
        setUpFonts()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        UIView.animate(withDuration: 0.7, delay: 0.5, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: .curveEaseIn, animations: {
            self.logoImage.alpha = 1
        }) { (_) in
            UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: .curveEaseIn, animations: {
                self.loginButton.alpha = 1
                self.registerButton.alpha = 1
            }, completion: nil)
        }
    }
    
    // MARK: - FIREBASE METHODS
    @objc func handleLogin() {
        print("login")
    }
    
    // MARK: - ANIMATIONS AND SETUP
    func setUpView() {
        view.backgroundColor = UIColor.white
        
        view.addSubview(logoImage)
        logoImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        logoImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 120).isActive = true
        logoImage.alpha = 0
        
        view.addSubview(loginButton)
        loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loginButton.topAnchor.constraint(equalTo: view.bottomAnchor, constant: -180).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        loginButton.widthAnchor.constraint(equalToConstant: 250).isActive = true
        loginButton.addTarget(self, action: #selector(presentLogin), for: .touchUpInside)
        loginButton.alpha = 0
        
        view.addSubview(registerButton)
        registerButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        registerButton.topAnchor.constraint(equalTo: view.bottomAnchor, constant: -110).isActive = true
        registerButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        registerButton.widthAnchor.constraint(equalToConstant: 250).isActive = true
        registerButton.addTarget(self, action: #selector(presentRegister), for: .touchUpInside)
        registerButton.alpha = 0
        
        view.addSubview(closeButton)
        closeButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 8).isActive = true
        closeButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        closeButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        closeButton.widthAnchor.constraint(equalToConstant: 40).isActive = true
        closeButton.addTarget(self, action: #selector(dismissLogin), for: .touchUpInside)
        closeButton.alpha = 0
        
    }
    
    func setUpLoginContainer() {
        view.addSubview(emailTextField)
        emailTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        emailTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        emailTextField.widthAnchor.constraint(equalToConstant: 240).isActive = true
        emailTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        emailTextField.alpha = 0
        
        view.addSubview(emailSeperator)
        emailSeperator.centerXAnchor.constraint(equalTo: emailTextField.centerXAnchor).isActive = true
        emailSeperator.topAnchor.constraint(equalTo: emailTextField.bottomAnchor).isActive = true
        emailSeperator.widthAnchor.constraint(equalToConstant: 250).isActive = true
        emailSeperator.heightAnchor.constraint(equalToConstant: 3).isActive = true
        emailSeperator.alpha = 0
        
        view.addSubview(passwordTextField)
        passwordTextField.centerXAnchor.constraint(equalTo: emailTextField.centerXAnchor).isActive = true
        passwordTextField.topAnchor.constraint(equalTo: emailSeperator.bottomAnchor, constant: 12).isActive = true
        passwordTextField.widthAnchor.constraint(equalTo: emailTextField.widthAnchor, constant: 0).isActive = true
        passwordTextField.heightAnchor.constraint(equalTo: emailTextField.heightAnchor, constant: 0).isActive = true
        passwordTextField.alpha = 0
        
        view.addSubview(passwordSeperator)
        passwordSeperator.centerXAnchor.constraint(equalTo: passwordTextField.centerXAnchor).isActive = true
        passwordSeperator.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor).isActive = true
        passwordSeperator.widthAnchor.constraint(equalToConstant: 250).isActive = true
        passwordSeperator.heightAnchor.constraint(equalToConstant: 3).isActive = true
        passwordSeperator.alpha = 0
    }
    
    func setUpFonts() {
        if let avenir = UIFont (name: "AvenirNext-Regular", size: 24.0) {
            loginButton.titleLabel?.font = avenir
            registerButton.titleLabel?.font = avenir
            emailTextField.font = avenir
            passwordTextField.font = avenir
        }
    }
    
    @objc func presentLogin() {
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseInOut, animations: {
            self.registerButton.alpha = 0
        }) { (_) in
            UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseInOut, animations: {
                self.closeButton.alpha = 1
                self.emailTextField.alpha = 1
                self.emailSeperator.alpha = 1
                self.passwordTextField.alpha = 1
                self.passwordSeperator.alpha = 1
            }, completion: nil)
        }
        loginButton.removeTarget(nil, action: nil, for: .allEvents)
        loginButton.addTarget(self, action: #selector(handleLogin), for: .touchUpInside)
    }
    
    @objc func presentRegister() {
        let registerVC = RegisterViewController()
        present(registerVC, animated: true, completion: nil)
    }
    
    @objc func dismissLogin() {
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseInOut, animations: {
            self.closeButton.alpha = 0
            self.emailTextField.alpha = 0
            self.emailSeperator.alpha = 0
            self.passwordTextField.alpha = 0
            self.passwordSeperator.alpha = 0
        }) { (_) in
            self.emailTextField.text = ""
            self.passwordTextField.text = ""
            UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseInOut, animations: {
                self.registerButton.alpha = 1
            }, completion: nil)
        }
        loginButton.removeTarget(nil, action: nil, for: .allEvents)
        loginButton.addTarget(self, action: #selector(presentLogin), for: .touchUpInside)
    }
    
}

extension UIColor {
    convenience init(red: CGFloat, green: CGFloat, blue: CGFloat) {
        self.init(red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }
}


