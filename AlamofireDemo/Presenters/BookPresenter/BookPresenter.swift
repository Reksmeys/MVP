//
//  BookPresenter.swift
//  AlamofireDemo
//
//  Created by រស្មី on 14/11/22.
//

import Foundation

class BookPresenter: BookServiceProtocol{
    
    var delegate: BookPresenterProtocol?
    var bookService: BookService?
    
    // constructor
    init(){
        self.bookService = BookService()
        self.bookService?.delegate = self
    }
    
    func didResponseBooks(books: BookResponse) {
        self.delegate?.didResponseBooks(books: books)
    }
    
    // create own fetching book function
    
    func fetchBooks(){
        self.bookService?.fetchBooks()
    }
    
    
    
}

protocol BookPresenterProtocol{
    func didResponseBooks(books: BookResponse)
}
