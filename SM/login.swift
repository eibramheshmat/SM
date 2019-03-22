//
//  login.swift
//  SM
//
//  Created by IBRAM on 2/2/19.
//  Copyright © 2019 IBRAM. All rights reserved.
//

import UIKit

class login: UIViewController  {

   
   
    @IBOutlet weak var loginBack: UIImageView!
    @IBOutlet weak var loginIcon: UIImageView!
    @IBOutlet weak var emailin: UITextField!
    @IBOutlet weak var passwordin: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func login(_ sender: UIButton) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        var users : [User] = []
        do {
            users = try context.fetch(User.fetchRequest())
        }catch{
            print(error)
        }
        var x=0
        let emaillin = emailin.text
        let passin = passwordin.text
        for index in 0..<users.count{
            let user = users[index]
            let emailfromdb = user.email
            let passfromdb = user.password
            if emaillin == emailfromdb && passin == passfromdb {
                mainView.globalVar.userKind = Int(user.kind!)!
                shouldPerformSegue(withIdentifier: "homefromlogin", sender: nil)
                x = 1
                break
            }
        }
        if x == 1{
            print("done")
        }else{
        let alert = UIAlertController(title: "Alert", message: "Try Again ..!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            switch action.style{
            case .default:
                print("default")
                
            case .cancel:
                print("cancel")
                
            case .destructive:
                print("destructive")
                
                
            }}))
            self.present(alert, animated: true, completion: nil)
            
        }
       
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }

}
