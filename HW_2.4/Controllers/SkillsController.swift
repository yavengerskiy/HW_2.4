//
//  SkillsController.swift
//  HW_2.4
//
//  Created by Beelab on 31/10/21.
//

import UIKit

class SkillsController: UITableViewController {

    var skills: [Skill] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        skills.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellSkill", for: indexPath) as! CellSkill
        
        cell.skillTitle.text = skills[indexPath.row].title
        cell.skillDescription.text = skills[indexPath.row].description
       
        return cell
    }
    
}
