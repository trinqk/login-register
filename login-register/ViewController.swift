import UIKit

class ViewController: UIViewController {
    
    let blue = UIColor(red: 53, green: 152, blue: 220)
    
    var logoImage: UIImageView = {
        var imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 250, height: 250));
        imageView.image = UIImage(named:"winter")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.alpha = 0
        return imageView
    }()
    
    lazy var loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor.white
        button.alpha = 0
        button.setTitleColor(blue, for: .normal)
        button.setTitle("login", for: .normal)
        button.titleLabel?.font = UIFont.init(name: "AvenirNext-Regular", size: 24)!
        button.layer.borderColor = blue.cgColor
        button.layer.borderWidth = 2.0
        button.layer.cornerRadius = 65
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var registerButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = blue
        button.alpha = 0
        button.setTitleColor(UIColor.white, for: .normal)
        button.setTitle("register", for: .normal)
        button.titleLabel?.font = UIFont.init(name: "AvenirNext-Regular", size: 24)!
        button.layer.cornerRadius = 65
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var bottomPadding: CGFloat!
    var topPadding: CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if #available(iOS 11.0, *) {
            let window = UIApplication.shared.keyWindow
            topPadding = window?.safeAreaInsets.top
            bottomPadding = window?.safeAreaInsets.bottom
        }
        
        setUpView()
    }
    
    func setUpView() {
        view.backgroundColor = UIColor.white
        
        view.addSubview(logoImage)
        logoImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        logoImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 150).isActive = true
        
        view.addSubview(loginButton)
        loginButton.leftAnchor.constraint(equalTo: view.centerXAnchor, constant: loginButton.frame.width + 12).isActive = true
        loginButton.topAnchor.constraint(equalTo: view.bottomAnchor, constant: -250).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: 130).isActive = true
        loginButton.widthAnchor.constraint(equalToConstant: 130).isActive = true
        loginButton.addTarget(self, action: #selector(presentLogin), for: .touchUpInside)
        
        view.addSubview(registerButton)
        registerButton.rightAnchor.constraint(equalTo: view.centerXAnchor, constant: -registerButton.frame.width - 12).isActive = true
        registerButton.topAnchor.constraint(equalTo: view.bottomAnchor, constant: -250).isActive = true
        registerButton.heightAnchor.constraint(equalToConstant: 130).isActive = true
        registerButton.widthAnchor.constraint(equalToConstant: 130).isActive = true
        registerButton.addTarget(self, action: #selector(presentRegister), for: .touchUpInside)
        
        UIView.animate(withDuration: 1.25, delay: 0.5, options: .curveEaseInOut, animations: {
            self.logoImage.alpha = 1
        }) { (_) in
            UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
                self.loginButton.alpha = 1
                self.registerButton.alpha = 1
            })
        }
    }
    
    @objc func presentLogin() {
        let loginDest = self.view.frame.height - 100 - bottomPadding
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.8, options: .curveEaseInOut, animations: {
            self.logoImage.center.y = (self.logoImage.frame.height / 2) + 60
            self.loginButton.frame.size = CGSize(width: 250, height: 50)
            self.loginButton.layer.cornerRadius = 25
            self.loginButton.center.x = self.view.center.x
            self.loginButton.center.y = loginDest
            self.registerButton.alpha = 0
            
        })
        loginButton.removeTarget(nil, action: nil, for: .allEvents)
        loginButton.addTarget(self, action: #selector(dismissLogin), for: .touchUpInside)
    }
    
    @objc func handleLogin() {
        
    }
    
    @objc func dismissLogin() {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.8, options: .curveEaseInOut, animations: {
            self.logoImage.center.y = (self.logoImage.frame.height / 2) + 120
            self.loginButton.frame.size = CGSize(width: 130, height: 130)
            self.loginButton.layer.cornerRadius = 65
            self.loginButton.center.x = self.view.center.x + (self.loginButton.frame.width / 2) + 12
            self.loginButton.center.y = self.registerButton.center.y
            self.registerButton.alpha = 1
        })
        loginButton.removeTarget(nil, action: nil, for: .allEvents)
        loginButton.addTarget(self, action: #selector(presentLogin), for: .touchUpInside)
    }
    
    @objc func presentRegister() {
        let registerDest = self.view.frame.height - 75 - bottomPadding
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: .curveEaseInOut, animations: {
            self.logoImage.center.y = (self.logoImage.frame.height / 2) + 60
            self.registerButton.frame.size = CGSize(width: 250, height: 50)
            self.registerButton.layer.cornerRadius = 25
            self.registerButton.center.x = self.view.center.x
            self.registerButton.center.y = registerDest
            self.loginButton.alpha = 0
        })
        registerButton.removeTarget(nil, action: nil, for: .allEvents)
        registerButton.addTarget(self, action: #selector(dismissRegister), for: .touchUpInside)
    }
    
    @objc func handleRegister() {
        
    }
    
    @objc func dismissRegister() {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: .curveEaseInOut, animations: {
            self.logoImage.center.y = (self.logoImage.frame.height / 2) + 120
            self.registerButton.frame.size = CGSize(width: 130, height: 130)
            self.registerButton.layer.cornerRadius = 65
            self.registerButton.center.x = self.view.center.x - (self.registerButton.frame.width / 2) - 12
            self.registerButton.center.y = self.loginButton.center.y
            self.loginButton.alpha = 1
        })
        registerButton.removeTarget(nil, action: nil, for: .allEvents)
        registerButton.addTarget(self, action: #selector(presentRegister), for: .touchUpInside)
    }
    
}

extension UIColor {
    convenience init(red: CGFloat, green: CGFloat, blue: CGFloat) {
        self.init(red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }
}


