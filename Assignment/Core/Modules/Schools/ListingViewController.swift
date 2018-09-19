//
//  ListingViewController.swift
//  Assignment
//
//  Created by Umair Ali on 9/18/18.
//  Copyright © 2018 Umair Ali. All rights reserved.
//

import UIKit

protocol AppCoordinatorDelegate : class {
    
    func schoolItemSelected(_ item : SchoolAPIModel)
}

class ListingViewController : UIViewController , Coordinated, SchoolSelectionDelegate {
    
    @IBOutlet weak var activityIndicatorView : UIActivityIndicatorView!
    @IBOutlet weak var tableView : UITableView!
    
    weak var coordinationDelegate: CoordinationDelegate?
    weak var delegate : AppCoordinatorDelegate?
    
    private let viewModel = ListingViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        
        // ViewModel binding
        bindViewModel()
        
        // Load data
        self.activityIndicatorView.isHidden = false
        viewModel.fetchTestData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    private func bindViewModel() {
        
        viewModel.isDataLoaded.bind {[unowned self] (value) in
            
            self.activityIndicatorView.isHidden = true
            self.tableView.reloadData()
        }
        
        viewModel.errorOccurred.bind { (value) in
            
            self.activityIndicatorView.isHidden = true
        }
    }
    
    private func setupView() {
        navigationItem.title = "School List"
        tableView.contentInset = UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0)
        self.tableView.tableFooterView = UIView()
        tableView.estimatedRowHeight = 200.0
        tableView.rowHeight = UITableViewAutomaticDimension
    }
    
    // MARK: SchoolSelectionDelegate
    func schoolItemSelected(_ item: SchoolAPIModel) {
        delegate?.schoolItemSelected(item)
    }
}

extension ListingViewController : UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return viewModel.searchQueryList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: SchoolTableViewCell.cellIdentifier, for: indexPath) as! SchoolTableViewCell
        cell.delegate = self
        cell.data = viewModel.searchQueryList[safe:indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let selectedItem = viewModel.searchQueryList[safe:indexPath.row] else {return}
        (coordinationDelegate as? AppCoordinator)?.schoolItemSelected(selectedItem)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
