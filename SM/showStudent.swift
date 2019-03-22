//
//  showStudent.swift
//  SM
//
//  Created by IBRAM on 2/6/19.
//  Copyright © 2019 IBRAM. All rights reserved.
//

import UIKit
import CoreData
class showStudent: UIViewController , UITableViewDelegate , UITableViewDataSource {
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var students : [Student] = []
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate=self
        tableView.dataSource=self
        isFetch()
        // Do any additional setup after loading the view.
        
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return students.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
       
        do {
            students = try context.fetch(Student.fetchRequest())
        }catch{
            print(error)
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = students[indexPath.row].name
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "studentdetails", sender: students[indexPath.row])
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any? ) {
        if let dis = segue.destination as? studentDetails {
            if let student = sender as? Student {
                dis.studentSelect = student
            }
        }
        
    }
    
    func isFetch() {
        do {
            students = try context.fetch(Student.fetchRequest())
        }catch{
            print(error)
        }
    }


}
