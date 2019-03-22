//
//  adding.swift
//  SM
//
//  Created by IBRAM on 2/2/19.
//  Copyright © 2019 IBRAM. All rights reserved.
//

import UIKit
import CoreData
class addUser: UIViewController {

    var context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    @IBOutlet weak var imageBack: UIImageView!
    @IBOutlet weak var nameUser: UITextField!
    @IBOutlet weak var emailUser: UITextField!
    @IBOutlet weak var passUser: UITextField!
    @IBOutlet weak var cpassUser: UITextField!
    @IBOutlet weak var kindUser: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func add(_ sender: UIButton) {
        if nameUser.text != "" && emailUser.text != "" && passUser.text != "" && cpassUser.text != "" && kindUser.text != "" {
            let newUser = NSEntityDescription.insertNewObject(forEntityName: "User", into: context)
            newUser.setValue(self.nameUser!.text, forKey: "name")
            newUser.setValue(self.emailUser!.text, forKey: "email")
            newUser.setValue(self.passUser!.text, forKey: "password")
            newUser.setValue(self.kindUser!.text, forKey: "kind")
            do {
                try context.save()
                let alert = UIAlertView()
                alert.title = "ADD"
                alert.message = "Adding Done Successfully .. !"
                alert.addButton(withTitle: "Ok")
                alert.show()

            }catch{
                print(error)
            }
        }else{
            print("must fill all field")
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
