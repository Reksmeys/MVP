//
//  BookService.swift
//  AlamofireDemo
//
//  Created by រស្មី on 14/11/22.
//

import Foundation
import Alamofire

class BookService{
    var delegate: BookServiceProtocol?
    
    func fetchBooks(){
        AF.request(API.BOOK_LIST)
            .responseData { response in
                guard let data = response.data else{
                    return
                }
                let jsonDecoder = JSONDecoder()
                
                do{
                    let books = try jsonDecoder.decode(BookResponse.self, from: data)
                    self.delegate?.didResponseBooks(books: books)
                    
                }catch{
                    print("error")
                }
                
            }
    }
}
protocol BookServiceProtocol{
    func didResponseBooks(books: BookResponse)
}
