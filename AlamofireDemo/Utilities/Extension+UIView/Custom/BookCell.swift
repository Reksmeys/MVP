//
//  BookCell.swift
//  AlamofireDemo
//
//  Created by រស្មី on 15/11/22.
//

import UIKit

class BookCell: UITableViewCell {
    
    @IBOutlet weak var coverImageView: UIImageView!
    

    @IBOutlet weak var bookTitleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
