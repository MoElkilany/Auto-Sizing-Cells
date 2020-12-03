//
//  TableCell.swift
//  Auto Sizing Cells
//
//  Created by mohamed sayed on 12/3/20.
//

import UIKit



class TableCell: UITableViewCell {
    
    let textLable = UILabel()
    let containerView = UIView()
    
    var trailingAnchors:NSLayoutConstraint!
    var leadingAnchors:NSLayoutConstraint!
    
    let padding : CGFloat = 16
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear
        selectionStyle = .none
        configureView()
        configureLable()
       
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    var chatMessage : MessageModel!{
        didSet {
            containerView.backgroundColor = chatMessage.isComing ? .white : .darkGray
            textLable.textColor = chatMessage.isComing ? .black : .white
            textLable.text = chatMessage.text
            
            if chatMessage.isComing {
                trailingAnchors.isActive = false
                leadingAnchors.isActive = true
            }else{
                trailingAnchors.isActive = true
                leadingAnchors.isActive = false
            }
        }
    }
    
    
    
    func configureLable(){
        
        addSubview(textLable)
        textLable.translatesAutoresizingMaskIntoConstraints = false
        textLable.numberOfLines = 0
        let constraints = [textLable.topAnchor.constraint(equalTo: containerView.topAnchor, constant: padding),
                           textLable.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -padding ),
                           textLable.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: padding),
                           textLable.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -padding),
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    func configureView(){
        addSubview(containerView)
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.layer.cornerRadius = 12
        containerView.backgroundColor = .yellow
        let containerViewConstraints = [containerView.topAnchor.constraint(equalTo: self.topAnchor, constant: padding),
                                        containerView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -padding),
                                        containerView.widthAnchor.constraint(lessThanOrEqualToConstant:300)]
        NSLayoutConstraint.activate(containerViewConstraints)
        
        self.trailingAnchors =  containerView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -padding)
        self.trailingAnchors.isActive = true
        
        self.leadingAnchors =  containerView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: padding)
        self.leadingAnchors.isActive = false
    }
}
