//
//  SchoolTableViewCell.swift
//  Assignment
//
//  Created by Umair Ali on 4/9/18.
//  Copyright © 2018 Umair Ali. All rights reserved.
//

import UIKit

protocol SchoolSelectionDelegate : class {
    
    func schoolItemSelected( _ item : SchoolAPIModel)
}

class SchoolTableViewCell : UITableViewCell {
    
    @IBOutlet weak var schoolLabel: UILabel!
    @IBOutlet weak var detailsLabel: UILabel!
    
    weak var delegate : SchoolSelectionDelegate?
    
    static var cellIdentifier : String {
        
        return String(describing: SchoolTableViewCell.self)
    }
    
    var data : SchoolAPIModel? {
        
        didSet{
            
            configureCell()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    private func configureCell() {
        schoolLabel.text = data?.schoolName
        detailsLabel.text = data?.details
       
    }
}

