//
//  addJob.swift
//  SM
//
//  Created by IBRAM on 2/6/19.
//  Copyright © 2019 IBRAM. All rights reserved.
//

import UIKit
import CoreData
class addJob: UIViewController {

    var context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    @IBOutlet weak var backImg: UIImageView!
    @IBOutlet weak var titleJob: UITextField!
    @IBOutlet weak var detailJob: UITextField!
    @IBOutlet weak var mobJob: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func addJob(_ sender: UIButton) {
        if titleJob.text != "" && detailJob.text != "" && mobJob.text != ""  {
            let newUser = NSEntityDescription.insertNewObject(forEntityName: "Job", into: context)
            newUser.setValue(self.titleJob!.text, forKey: "title")
            newUser.setValue(self.detailJob!.text, forKey: "details")
            newUser.setValue(self.mobJob!.text, forKey: "telephone")
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
