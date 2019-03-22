//
//  showJobs.swift
//  SM
//
//  Created by IBRAM on 2/7/19.
//  Copyright © 2019 IBRAM. All rights reserved.
//

import UIKit
import CoreData
class showJobs: UIViewController , UITableViewDelegate , UITableViewDataSource{

    @IBOutlet weak var tableV: UITableView!
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var jobs : [Job] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        tableV.delegate=self
        tableV.dataSource=self
        isFetch()
        // Do any additional setup after loading the view.
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return jobs.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
     
        do {
            jobs = try context.fetch(Job.fetchRequest())
        }catch{
            print(error)
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "jobCell", for: indexPath)
        cell.textLabel?.text = jobs[indexPath.row].title
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "detailsjob", sender: jobs[indexPath.row])
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any? ) {
        if let way = segue.destination as? detailsJobs {
            if let job = sender as? Job {
              way.jobSelect  = job
            }
        }
        
    }
    
    func isFetch() {
        do {
            jobs = try context.fetch(Job.fetchRequest())
        }catch{
            print(error)
        }
    }

}
