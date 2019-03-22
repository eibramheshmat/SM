//
//  detailsJobs.swift
//  SM
//
//  Created by IBRAM on 2/7/19.
//  Copyright © 2019 IBRAM. All rights reserved.
//

import UIKit
class detailsJobs: UIViewController {
    var jobSelect : Job?
    @IBOutlet weak var jobTitle: UILabel!
    @IBOutlet weak var jobDetails: UILabel!
    @IBOutlet weak var jobMob: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        jobTitle.layer.masksToBounds = true
        jobTitle.layer.cornerRadius = 20
        jobDetails.layer.masksToBounds = true
        jobDetails.layer.cornerRadius = 20
        jobMob.layer.masksToBounds = true
        jobMob.layer.cornerRadius = 20
        jobTitle.text = " Title : \(jobSelect?.title ?? "Title")"
        jobDetails.text = " Details : \(jobSelect?.details ?? "Details")"
        jobMob.text = " Telephone : \(jobSelect?.telephone ?? "mob")"

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
