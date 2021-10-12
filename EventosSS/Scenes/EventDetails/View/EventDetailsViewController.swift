//
//  EventDetailsViewController.swift
//  EventosSS
//
//  Created by Hiago Chagas on 11/10/21.
//

import UIKit

class EventDetailsViewController: UIViewController {
    public var event: Event?
    public var eventImage: UIImage?
    private let contentView = EventDetailsView()
    override func viewDidLoad() {
        self.view = contentView
        self.navigationItem.largeTitleDisplayMode = .never
        fullfilContentView()
    }
    
    private func fullfilContentView() {
        contentView.eventImageView.image = eventImage
        contentView.eventNameLabel.text = event?.title
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        contentView.eventDateLabel.text = dateFormatter.string(from: event?.date ?? Date())
        contentView.eventPriceLabel.text = "R$ \(event?.price ?? 0.0)"
        contentView.eventDescriptionLabel.text = event?.description
    }
    
}
