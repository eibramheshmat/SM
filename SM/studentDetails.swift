//
//  studentDetails.swift
//  SM
//
//  Created by IBRAM on 2/8/19.
//  Copyright © 2019 IBRAM. All rights reserved.
//

import UIKit

class studentDetails: UIViewController {

    var studentSelect : Student?
    @IBOutlet weak var studentName: UILabel!
    @IBOutlet weak var studentBatch: UILabel!
    @IBOutlet weak var studentDepart: UILabel!
    @IBOutlet weak var studentGPA: UILabel!
    @IBOutlet weak var studentMob: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        studentName.layer.masksToBounds = true
        studentName.layer.cornerRadius = 10
        studentBatch.layer.masksToBounds = true
        studentBatch.layer.cornerRadius = 10
        studentDepart.layer.masksToBounds = true
        studentDepart.layer.cornerRadius = 10
        studentGPA.layer.masksToBounds = true
        studentGPA.layer.cornerRadius = 10
        studentMob.layer.masksToBounds = true
        studentMob.layer.cornerRadius = 10
        studentName.text = " Name : \(studentSelect?.name ?? "name")"
        studentBatch.text = " Batch : \(studentSelect?.batch ?? "batch")"
        studentDepart.text = " Depart : \(studentSelect?.depart ?? "depart")"
        studentGPA.text = " GPA : \(studentSelect?.gpa ?? "GPA")"
        studentMob.text = " Telephone : \(studentSelect?.telephone ?? "mob")"
        // Do any additional setup after loading the view.
    }
    

   
}
