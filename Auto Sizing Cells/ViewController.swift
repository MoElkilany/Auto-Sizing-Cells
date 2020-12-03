//
//  ViewController.swift
//  Auto Sizing Cells
//
//  Created by mohamed sayed on 12/3/20.
//

import UIKit

struct MessageModel  {

    let text :String
    let isComing:Bool
}


class ViewController: UITableViewController {

    let reuseID = "Cell"
    
    
    let dataArray  = [
        MessageModel(text: "the new team", isComing: true),
        MessageModel(text: "the new company is very good and the team", isComing: false),
        MessageModel(text: "the new company is very good and the team is very very intellegent and has more", isComing: false),
        MessageModel(text: "the new company is very good and the team is very very intellegent and has more informations about technology the new company is very good and the team is very very intellegent and has more informations about technology", isComing: true),
        MessageModel(text: "the new company is very good and the team is very very intellegent and has more informations about technology the new company is very good and the team is very very intellegent and has more informations about technology the new company is very good and the team is very very intellegent and has more informations about technology", isComing: false)]
    
        
        
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Message"
        navigationController?.navigationBar.prefersLargeTitles = true
        tableView.register(TableCell.self, forCellReuseIdentifier:reuseID)
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.showsHorizontalScrollIndicator = false
        tableView.backgroundColor = UIColor(white: 0.95, alpha: 1)
    }

    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseID, for: indexPath) as! TableCell
        cell.chatMessage = dataArray[indexPath.item]
        return cell
    }

}

