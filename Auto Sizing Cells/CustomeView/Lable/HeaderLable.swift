//
//  HeaderLable.swift
//  Auto Sizing Cells
//
//  Created by mohamed sayed on 12/6/20.
//

import UIKit

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
