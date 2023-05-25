//
//  SignUpViewController.swift
//  Food-Receipe-App
//
//  Created by Kajol   on 22/05/23.
//

import UIKit

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var signUpRegisterLabel: UILabel!
    @IBOutlet weak var registerHereLabel: UILabel!
    @IBOutlet weak var passwordRegisterLabel: UITextField!
    @IBOutlet weak var emailRegisterLabel: UITextField!
    @IBOutlet weak var usernameRegisterLabel: UITextField!
    
    @IBOutlet weak var signUpBtn: CustomButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        signUpBtn.addTarget(self, action: #selector(didTapSignUpButton),
                           for: .touchUpInside)
                self.view.addSubview(signUpBtn)
    }
    
    
    @IBAction func signUpClicked(_ sender: UIButton!){
        if let email = emailRegisterLabel.text, let password = passwordRegisterLabel.text,
           let username = usernameRegisterLabel.text {
            if username == ""{
                print("Please enter username")
            }
            else if !email.validateEmail(){
                openAlert(title: "Alert", message: "Please enter valid email", alertStyle: .alert, actionTitles: ["Okay"], actionStyles: [.default], actions: [{ _ in print("Okay clicked")}])
                print("email is not valid")
            }else if !password.validatePassword(){
                print("Password is not valid")
            }else{
                print("Please chech your details")
            }
        }
    }
    
    @objc func didTapSignUpButton() {
        //create and present tab bar controller
        let rootVC = SignUpViewController()
//        let vc = HomeViewController()
        let navVC = UINavigationController(rootViewController: rootVC)
        navVC.modalPresentationStyle = .fullScreen
        // present(navVC, animated: true)
//        self.navigationController?.pushViewController(vc, animated: true)
        
       let tabBarVC = UITabBarController()
       let storyBoard = UIStoryboard(name: "Main", bundle: nil)

       let vc1 = storyBoard.instantiateViewController(withIdentifier: "HomeNav")
       vc1.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), tag: 0)
       let vc2 = storyBoard.instantiateViewController(withIdentifier: "CategoryViewController") as! CategoryViewController
       vc2.tabBarItem = UITabBarItem(title: "Category", image: UIImage(systemName: "fork.knife"), tag: 0)
        let vc3 = storyBoard.instantiateViewController(withIdentifier: "FavouriteViewController") as! FavouriteViewController
        vc3.tabBarItem = UITabBarItem(title: "Favourite", image: UIImage(systemName: "heart.fill"), tag: 0)
        let vc4 = storyBoard.instantiateViewController(withIdentifier: "ProfileViewController") as! ProfileViewController
        vc4.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(systemName: "person.fill"), tag: 0)

       tabBarVC.setViewControllers([vc1, vc2, vc3, vc4], animated: false)
//       self.navigationController?.pushViewController(tabBarVC, animated: true)
        tabBarVC.modalPresentationStyle = .fullScreen
        self.present(tabBarVC, animated: false, completion: nil)
        
    }
}

