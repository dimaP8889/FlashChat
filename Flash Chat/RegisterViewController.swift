//
//  RegisterViewController.swift
//  Flash Chat
//
//  This is the View Controller which registers new users with Firebase
//

import UIKit
import Firebase
import SVProgressHUD


class RegisterViewController: UIViewController, UITextFieldDelegate {

    
    //Pre-linked IBOutlets

    @IBOutlet var emailTextfield: UITextField!
    @IBOutlet var passwordTextfield: UITextField!
    
    var keyboardHeight : CGFloat = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailTextfield.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillShow),
            name: NSNotification.Name.UIKeyboardWillShow,
            object: nil
        )
    }
    
    //TODO: Keyboard size
    
    @objc func keyboardWillShow(_ notification: Notification) {
        if let keyboardFrame: NSValue = notification.userInfo?[UIKeyboardFrameEndUserInfoKey] as? NSValue {
            let keyboardRectangle = keyboardFrame.cgRectValue
            if keyboardRectangle.height > self.keyboardHeight {
                
                self.keyboardHeight = keyboardRectangle.height
                print("In Login", self.keyboardHeight)
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier! == "goToChat" {
            
            let chatViewController = segue.destination as! ChatViewController
            
            print(self.keyboardHeight)
            chatViewController.keyboardHeight = self.keyboardHeight
        }
    }
  
    @IBAction func registerPressed(_ sender: AnyObject) {
        

    
        //TODO: Set up a new user on our Firbase database
        SVProgressHUD.show()
        
        Auth.auth().createUser(withEmail: emailTextfield.text!, password: passwordTextfield.text!) {
            (user, error) in
            if error != nil {
                print(error!)
            } else {
                print("Reg Succes")
                SVProgressHUD.dismiss()
                self.performSegue(withIdentifier: "goToChat", sender: self)
            }
        }
        

        
        
    } 
    
    
}
