//
//  BookVC.swift
//  AlamofireDemo
//
//  Created by រស្មី on 14/11/22.
//

import UIKit
import SkeletonView

class BookVC: UIViewController, BookPresenterProtocol, SkeletonTableViewDataSource {
    
    
    @IBOutlet weak var bookTV: UITableView!
    
    var books: BookResponse?
  
    // init object presenter
    var bookPresenter: BookPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        books = BookResponse()
        bookPresenter = BookPresenter()
        bookPresenter?.delegate = self
        bookTV.dataSource = self
        bookTV.rowHeight = 120
        bookTV.estimatedRowHeight = 120
        bookTV.showsVerticalScrollIndicator = false
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.bookTV.isSkeletonable = true
//        self.bookTV.showSkeleton(usingColor: .concrete, transition: .crossDissolve(0.25))
        self.bookTV.showAnimatedGradientSkeleton(usingGradient: .init(baseColor: .concrete, secondaryColor: .concrete), animation: .none, transition: .crossDissolve(0.5))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        bookPresenter?.fetchBooks()
    }
    
    func didResponseBooks(books: BookResponse) {
        print("book response in view controller => \(books)")
        self.books = books
        
        // working in background process
        DispatchQueue.main.async {
            self.bookTV.reloadData()
        }
        self.bookTV.stopSkeletonAnimation()
        self.bookTV.hideSkeleton()
    }
    
    func collectionSkeletonView(_ skeletonView: UITableView, cellIdentifierForRowAt indexPath: IndexPath) -> ReusableCellIdentifier {
        return "bookCell"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.books?.data?.list?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "bookCell") as! BookCell
        
        cell.bookTitleLabel.text = self.books?.data?.list![indexPath.row].title

        var imageAddress = self.books?.data?.list![indexPath.row].cover?.uri

        cell.coverImageView.loadFrom(URLAddress: imageAddress!)
        return cell
    }
    

}
