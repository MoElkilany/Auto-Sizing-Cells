//
//  Date+Ext.swift
//  Auto Sizing Cells
//
//  Created by mohamed sayed on 12/6/20.
//

import Foundation
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
