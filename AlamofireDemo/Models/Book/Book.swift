//
//  Book.swift
//  AlamofireDemo
//
//  Created by រស្មី on 14/11/22.
//

import Foundation

struct BookResponse: Codable{
    var status: Bool?
    var code: Int?
    var message: String?
    var data: MyData?
}

struct MyData: Codable{
    var total: Int?
    var list: [Book]?
    var pageNum: Int?
    var pageSize: Int?
    var size: Int?
    var page: Int?
}

struct Book: Codable{
    var id: Int?
    var title: String?
    var description: String?
    var author: String?
    var starRating: Float?
    var datePublished: String?
    var cover: BookCover?
}

struct BookCover: Codable{
    var id: Int?
    var uri: String?
}


