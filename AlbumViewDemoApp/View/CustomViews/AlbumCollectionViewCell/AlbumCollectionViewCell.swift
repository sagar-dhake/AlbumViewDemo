//
//  AlbumCollectionViewCell.swift
//  AlbumViewDemoApp
//
//  Created by Sagar Dhake on 22/08/20.
//  Copyright © 2020 Sagar Dhake. All rights reserved.
//

import UIKit

class AlbumCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var cardView: CardView!
    @IBOutlet weak var authorNameLbl: UILabel!
    @IBOutlet weak var albumImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
}
