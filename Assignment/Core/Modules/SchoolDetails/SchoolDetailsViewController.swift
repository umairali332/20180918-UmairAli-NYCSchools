//
//  SchoolDetailsViewController.swift
//  Assignment
//
//  Created by Umair Ali on 4/9/18.
//  Copyright © 2018 Umair Ali. All rights reserved.
//

import UIKit
import AVKit

class SchoolDetailsViewController : UITableViewController, Coordinated {
    
    weak var coordinationDelegate: CoordinationDelegate?
    @IBOutlet var satTestTakerLabel: UILabel!
    @IBOutlet var satCriticalReadingLabel: UILabel!
    @IBOutlet var satMathScoreLabel: UILabel!
    @IBOutlet var satWritingScoreLabel: UILabel!
    @IBOutlet var schoolNameLabel: UILabel!
   
    var viewModel : SchoolDetailViewModel!
    var schoolItem : SchoolAPIModel {
        set {
            viewModel = SchoolDetailViewModel(schoolAPIModel: newValue)
        }
        get {
            return viewModel.schoolAPIModel
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        
        // ViewModel binding
        bindViewModel()
        
        // Load data
        //self.activityIndicatorView.isHidden = false
        
        viewModel.fetchTestData()
    }
    
    private func setupView() {
        navigationItem.title = "School Details"
        self.tableView.tableFooterView = UIView()
        tableView.estimatedRowHeight = 200.0
        tableView.rowHeight = UITableViewAutomaticDimension
    }
    
    private func bindViewModel() {
        
        viewModel.isDataLoaded.bind {[unowned self] (value) in
            self.updateUI()
            //self.activityIndicatorView.isHidden = true
            self.tableView.reloadData()
        }
        
        viewModel.errorOccurred.bind { (value) in
            
            //self.activityIndicatorView.isHidden = true
        }
    }
    
    private func updateUI() {
        
        guard let model = viewModel.schoolDetailModel else {return}
        
        schoolNameLabel.text = model.schoolName
        satMathScoreLabel.text = model.satMathScore
        satWritingScoreLabel.text = model.satWritingScore
        satTestTakerLabel.text = model.satTestTaker
        satCriticalReadingLabel.text = model.satReadingScore
    }
}
