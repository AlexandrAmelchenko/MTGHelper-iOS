//
//  CardsSearchViewController.swift
//  MTGHelper
//
//  Created by Alex Amelchenko on 01/07/16.
//  Copyright © 2016 Alex Amelchenko. All rights reserved.
//

import UIKit

protocol CardsSearchViewControllerInterface: class {
    
    func showLoading()
    
    func hideLoading()
    
    func showError(message: String?)
    
}

class CardsSearchViewController: UIViewController, CardsSearchViewControllerInterface, UITableViewDelegate, UITableViewDataSource {
    
    var viewModel = CardsSearchViewModel()
    
    @IBOutlet var searchTextField : UITextField!
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            self.tableView.rowHeight = UITableViewAutomaticDimension
            self.tableView.estimatedRowHeight = 60
//            self.tableView.registerNib(UINib(nibName: appointmentCellIdentifier, bundle: nil), forCellReuseIdentifier: appointmentCellIdentifier)
//            self.tableView.registerNib(UINib(nibName: headerCellIdentifier, bundle: nil), forCellReuseIdentifier: headerCellIdentifier)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel.searchController = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func searchButtonClicked(sender: AnyObject) {
        if (searchTextField.text?.characters.count < 1) {
            //TODO : move text checking to viewmodel and add additional checks
            showNoTextAlert()
        }
        else {
            viewModel.loadCardsByName("qa")
        }
    }
    
    func showNoTextAlert() {
        showDropdown("Name of card cant be empty")
    }
    
    func showLoading() {
        showLoading(true)
    }
    
    func hideLoading() {
        showLoading(false)
    }
    
    func showError(message: String?) {
        showDropdown(message)
    }
    
    //MARK: TableView
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        return UITableViewCell()
    }

}
