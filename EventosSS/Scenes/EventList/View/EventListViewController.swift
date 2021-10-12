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
    private var events: [Event]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.largeTitleDisplayMode = .always
        contentView.tableView.register(EventTableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        contentView.tableView.delegate = self
        contentView.tableView.dataSource = self
        view = contentView
        getEvents()
    }
    
    public func getEvents() {
        viewModel.getAllEvents { events in
            DispatchQueue.main.async {
                self.events = events
                self.contentView.tableView.reloadData()
            }
        }
    }

}

extension EventListViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return events?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! EventTableViewCell
        if let event = events?[indexPath.row] {
            cell.eventNameLabel.text = event.title
            cell.eventDescriptionLabel.text = event.description
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd/MM/yyyy"
            cell.eventDateLabel.text = dateFormatter.string(from: event.date)
            cell.eventPriceLabel.text = "R$ \(event.price)"
            viewModel.fetchImage(fromURL: event.imageURL) { image in
                DispatchQueue.main.async {
                    cell.eventImageView.image = image
                }
            }
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! EventTableViewCell
        let viewController = EventDetailsViewController()
        viewController.event = events?[indexPath.row]
        viewController.eventImage = cell.eventImageView.image
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    
}
