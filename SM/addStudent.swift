//
//  addStudent.swift
//  SM
//
//  Created by IBRAM on 2/6/19.
//  Copyright © 2019 IBRAM. All rights reserved.
//

import UIKit
import  CoreData
class addStudent: UIViewController {

    var context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    @IBOutlet weak var backImg: UIImageView!
    @IBOutlet weak var studentName: UITextField!
    @IBOutlet weak var studentBatch: UITextField!
    @IBOutlet weak var studentDepaet: UITextField!
    @IBOutlet weak var studentGPA: UITextField!
    @IBOutlet weak var studentMob: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func addStudent(_ sender: Any) {
        if studentName.text != "" && studentBatch.text != "" && studentDepaet.text != "" && studentGPA.text != "" && studentMob.text != ""  {
            let newUser = NSEntityDescription.insertNewObject(forEntityName: "Student", into: context)
            newUser.setValue(self.studentName!.text, forKey: "name")
            newUser.setValue(self.studentBatch!.text, forKey: "batch")
            newUser.setValue(self.studentDepaet!.text, forKey: "depart")
            newUser.setValue(self.studentGPA!.text, forKey: "gpa")
            newUser.setValue(self.studentMob!.text, forKey: "telephone")
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
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }


}
