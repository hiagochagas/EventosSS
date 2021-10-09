//
//  EventListViewController.swift
//  EventosSS
//
//  Created by Hiago Chagas on 07/10/21.
//

import UIKit

class EventListViewController: UIViewController {
    
    private let contentView = EventListView()
    private let viewModel = EventListViewModel()
    private let cellIdentifier = "EventListCellIdentifier"
    private var events: [Event] {
        get {
            return viewModel.events
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.viewController = self
        viewModel.getAllEvents()
        contentView.tableView.register(EventTableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        contentView.tableView.delegate = self
        contentView.tableView.dataSource = self
        view = contentView
    }
    
    public func reloadData() {
        contentView.tableView.reloadData()
    }

}

extension EventListViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return events.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! EventTableViewCell
        let event = events[indexPath.row]
        cell.eventNameLabel.text = event.title
        cell.eventDescriptionLabel.text = event.description
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        cell.eventDateLabel.text = dateFormatter.string(from: event.date)
        viewModel.fetchImage(fromURL: event.imageURL, toView: cell.eventImageView)
        return cell
    }
    
    
}
