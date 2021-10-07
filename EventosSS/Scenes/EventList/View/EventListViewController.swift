//
//  EventListViewController.swift
//  EventosSS
//
//  Created by Hiago Chagas on 07/10/21.
//

import UIKit

class EventListViewController: UIViewController {
    
    private let contentView = EventListView()
    private let cellIdentifier = "EventListCellIdentifier"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        contentView.tableView.register(EventTableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        contentView.tableView.delegate = self
        contentView.tableView.dataSource = self
        view = contentView
    }

}

extension EventListViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! EventTableViewCell
        if indexPath.row == 1 {
            cell.eventDescriptionLabel.text = "LOREM LOREM LOREM LOREM LOREM LOREM LOREM LOREM LOREM LOREM LOREM LOREM LOREM LOREM LOREM LOREM LOREM LOREM LOREM LOREM LOREM LOREM LOREM LOREM LOREM LOREM LOREM LOREM "
        }
        return cell
    }
    
    
}
