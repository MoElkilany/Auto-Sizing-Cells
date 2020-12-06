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
    let data : Date
}


class ViewController: UITableViewController {

    let reuseID = "Cell"
    

//    let dataArray = [
//
//     [
//        MessageModel(text: "the new team", isComing: true, data: Date.customStringDate(StringDate: "01-12-2020")),
//      MessageModel(text: "the new company is very good and the team", isComing: false, data: Date())
//     ],
//     [
//        MessageModel(text: "the new company is very good and the team is very very intellegent and has more", isComing: false, data:  Date.customStringDate(StringDate: "02-12-2020")),
//        MessageModel(text: "the new company is very good and the team is very very intellegent and has more informations about technology the new company is very good and the team is very very intellegent and has more informations about technology", isComing: true, data: Date.customStringDate(StringDate: "03-12-2020")),
//        MessageModel(text: "the new company is very good and the team is very very intellegent and has more informations about technology the new company is very good and the team is very very intellegent and has more informations about technology the new company is very good and the team is very very intellegent and has more informations about technology", isComing: false, data: Date.customStringDate(StringDate: "04-12-2020"))
//     ],
//     [
//        MessageModel(text: "the new company is very good and the team is very very intellegent and has more informations about technology the new company is very good and the team is very very intellegent and has more informations about technology", isComing: true, data:  Date.customStringDate(StringDate: "05-12-2020")),
//        MessageModel(text: "the new company is very good and the team is very very intellegent and has more informations about technology the new company is very good and the team is very very intellegent and has more informations about technology the new company is very good and the team is very very intellegent and has more informations about technology", isComing: false, data:  Date.customStringDate(StringDate: "06-12-2020")),
//        MessageModel(text: "new company is very good and the team is very very intellegent and has more informations about technology", isComing: false, data:  Date.customStringDate(StringDate: "07-12-2020"))
//     ]
//
//    ]
    
    
    let serverMessages = [
        MessageModel(text: "the new company is very good and the team is very very intellegent and has more informations about technology the new company is very good and the team is very very intellegent and has more informations about technology", isComing: true, data:  Date.customStringDate(StringDate: "05-12-2020")),
        MessageModel(text: "the new company is very good and the team is very very intellegent and has more informations about technology the new company is very good and the team is very very intellegent and has more informations about technology the new company is very good and the team is very very intellegent and has more informations about technology", isComing: false, data:  Date.customStringDate(StringDate: "06-12-2020")),
        MessageModel(text: "new company is very good and the team is very very intellegent and has more informations about technology", isComing: false, data:  Date.customStringDate(StringDate: "07-12-2020"))
    ]
    
    
    
    var dataArray = [[MessageModel]]()
    
    
    fileprivate func groupingMessage(){
        
        let dic = Dictionary.init(grouping: serverMessages) { (element) -> Date  in
             return  element.data
        }
        
        
      let datasorted =   dic.keys.sorted()
        datasorted.forEach { (data) in
            
            let val = dic[data]

            dataArray.append(val ?? [])

        }
        
        
//
//        dic.keys.forEach { (key) in
//            print("The key is : \(key)")
//         let val = dic[key]
//            print("The val is : \(val ?? [])")
//            dataArray.append(val ?? [])
//        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        groupingMessage()
        
        
        title = "Message"
        navigationController?.navigationBar.prefersLargeTitles = true
        tableView.register(TableCell.self, forCellReuseIdentifier:reuseID)
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.showsHorizontalScrollIndicator = false
        tableView.backgroundColor = UIColor(white: 0.95, alpha: 1)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return dataArray.count
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    let containerView = UIView()
    let lable = DateLableHeader()
        containerView.addSubview(lable)
        lable.translatesAutoresizingMaskIntoConstraints = false
      
        lable.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
        lable.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
        
        if let firstItem = dataArray[section].first {
            lable.text = Date.stringDateFromDate(date:  firstItem.data)
               }
        
        return containerView
    }
    
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray[section].count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseID, for: indexPath) as! TableCell
        cell.chatMessage = dataArray[indexPath.section][indexPath.row]
        return cell
    }

}


extension Date {
    static func customStringDate(StringDate:String)->Date{
        let dateFormatte = DateFormatter()
        dateFormatte.dateFormat = "dd-MM-yyyy"
        let dataString = dateFormatte.date(from: StringDate)
        return dataString ?? Date()
    }
    
    static func stringDateFromDate(date:Date)->String{
        let dateFormatte = DateFormatter()
        dateFormatte.dateFormat = "dd-MM-yyyy"
        let dataString = dateFormatte.string(from: date)
        return dataString
    }
}


    
    


class DateLableHeader : UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configration()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var intrinsicContentSize: CGSize {
        let contentSize = super.intrinsicContentSize
        let hight = contentSize.height + 12
        let width = contentSize.width + 20
        return CGSize(width: width, height: hight)
    }
    
    
    func configration(){
        self.backgroundColor = .black
        self.textColor = .white
        self.layer.cornerRadius = 15
        self.layer.masksToBounds = true
        self.textAlignment = .center
    }
}

