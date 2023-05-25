//
//  LoginSignupViewController.swift
//  Food-Receipe-App
//
//  Created by Kajol   on 21/05/23.
//

import UIKit

class LoginSignupViewController: UIViewController {

    @IBOutlet weak var foodRecpBackImgView: UIImageView!
    @IBOutlet weak var foodReceipeLabel: CustomLabel!
    @IBOutlet weak var loginInHereLabel: UILabel!
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var dontHaveAccLabel: UILabel!
    @IBOutlet weak var signUpBtn: UIButton!
    @IBOutlet weak var passwordLabel: UITextField!
    @IBOutlet weak var usernameLabel: UITextField!
    @IBOutlet weak var forgotPasswordLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpProperties()
        
        loginBtn.addTarget(self, action: #selector(didTapLoginButton),
                           for: .touchUpInside)
                self.view.addSubview(loginBtn)
      
    }
    
    func setUpProperties(){

        loginBtn.layer.cornerRadius = loginBtn.layer.frame.height/2
        signUpBtn.layer.cornerRadius = signUpBtn.layer.frame.height/2
    }
    
    @IBAction func loginBtnClicked(_sender: UIButton){
        if let username = usernameLabel.text, let password = passwordLabel.text{
            if username == ""{
                //Alert
            }
            else{
                
            }
            if !username.validateUsername(){
                openAlert(title: "Alert", message: "Username not found", alertStyle: .alert, actionTitles: ["Okay"], actionStyles: [.default], actions: [{ _ in print("Okay clicked")}])
            }
            else if !password.validatePassword(){
                openAlert(title: "Alert", message: "Please enter valid password", alertStyle: .alert, actionTitles: ["Okay"], actionStyles: [.default], actions: [{ _ in print("Okay clicked")}])
            }
//
//            else{
//                openAlert(title: "Alert", message: "Please add detail", alertStyle: .alert, actionTitles: ["Okay"], actionStyles: [.default], actions: [{ _ in print("Okay clicked")}])
//            }
        }
    }
    
    @IBAction func signUpBtnClicked(_sender: UIButton){

        if let signUpVc = self.storyboard?.instantiateViewController(withIdentifier: "SignUpViewController") as? SignUpViewController{
            self.navigationController?.pushViewController(signUpVc, animated: true)
        }
    }
    
    @objc func didTapLoginButton() {
        //create and present tab bar controller
        let rootVC = LoginSignupViewController()
        let vc = HomeViewController()
        let navVC = UINavigationController(rootViewController: rootVC)
        navVC.modalPresentationStyle = .fullScreen
        // present(navVC, animated: true)
        self.navigationController?.pushViewController(vc, animated: true)
        
       let tabBarVC = UITabBarController()
       let storyBoard = UIStoryboard(name: "Main", bundle: nil)

       let vc1 = storyBoard.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
       vc1.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), tag: 0)
        
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.gray], for: .normal)
            
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.systemOrange], for: .selected)
      

       let vc2 = storyBoard.instantiateViewController(withIdentifier: "CategoryViewController") as! CategoryViewController
       vc2.tabBarItem = UITabBarItem(title: "Category", image: UIImage(systemName: "fork.knife"), tag: 0)
        let vc3 = storyBoard.instantiateViewController(withIdentifier: "FavouriteViewController") as! FavouriteViewController
        vc3.tabBarItem = UITabBarItem(title: "Favourite", image: UIImage(systemName: "heart.fill"), tag: 0)
        let vc4 = storyBoard.instantiateViewController(withIdentifier: "ProfileViewController") as! ProfileViewController
        vc4.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(systemName: "person.fill"), tag: 0)

       tabBarVC.setViewControllers([vc1, vc2, vc3, vc4], animated: false)
       self.navigationController?.pushViewController(tabBarVC, animated: true)
        
    }
}

