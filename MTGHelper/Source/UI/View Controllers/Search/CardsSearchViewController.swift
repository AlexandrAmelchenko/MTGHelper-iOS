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
    
    func reloadData()
    
}

class CardsSearchViewController: UIViewController, CardsSearchViewControllerInterface, UITableViewDelegate, UITableViewDataSource {
    
    var viewModel = CardsSearchViewModel()
    
    @IBOutlet var searchTextField : UITextField!
    
    let searchItemCellIdentifier = "SearchCardsTableViewCell"
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            self.tableView.rowHeight = UITableViewAutomaticDimension
            self.tableView.estimatedRowHeight = 60
            self.tableView.registerNib(UINib(nibName: searchItemCellIdentifier, bundle: nil), forCellReuseIdentifier: searchItemCellIdentifier)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.searchController = self
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
            viewModel.loadCardsByName(searchTextField.text)
        }
    }
    
    func showNoTextAlert() {
        showDropdown("Name of card cant be empty")
    }
    
    //MARK: CardsSearchViewControllerInterface
    
    func showLoading() {
        showLoading(true)
    }
    
    func hideLoading() {
        showLoading(false)
    }
    
    func showError(message: String?) {
        showDropdown(message)
    }
    
    func reloadData() {
        tableView.reloadData()
    }
    
    //MARK: TableView
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfCards()
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCellWithIdentifier(searchItemCellIdentifier, forIndexPath: indexPath) as? SearchCardsTableViewCell else {
            return UITableViewCell()
        }
        cell.bindWithCard(viewModel.cards[indexPath.row])
        cell.selectionStyle = .None
        return cell
    }

}
