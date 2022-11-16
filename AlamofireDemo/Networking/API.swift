//
//  File.swift
//  AlamofireDemo
//
//  Created by រស្មី on 14/11/22.
//

import Foundation

struct API{
    static var baseURL: String{
        return "http://34.125.206.73:15000/api/v1/"
    }
    
    // MARK: fetching book url
    static var BOOK_LIST: String{
        return baseURL + "books"
    }
}
