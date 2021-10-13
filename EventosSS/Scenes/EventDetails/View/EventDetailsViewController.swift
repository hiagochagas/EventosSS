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
    private let viewModel = EventDetailsViewModel()
    override func viewDidLoad() {
        self.view = contentView
        self.navigationItem.largeTitleDisplayMode = .never
        fullfilContentView()
        shareButtonSetup()
        checkInButtonSetup()
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
    
    private func shareButtonSetup() {
        guard let image = UIImage(systemName: "square.and.arrow.up") else { return }
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(shareButtonTapped))
    }
    
    private func checkInButtonSetup() {
        contentView.checkInButton.addTarget(self, action: #selector(checkInUser), for: .touchUpInside)
    }
    
    @objc private func shareButtonTapped() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        let date = dateFormatter.string(from: event?.date ?? Date())
        let message = """
        Oi! Vi esse evento e lembrei de você! Gostaria de ir comigo? Detalhes:
        Nome do evento: \(event?.title ?? "Sem título")
        Data: \(date)
        Preço do ingresso: R$ \(event?.price ?? 0.0)
        E aí? Vamos?
        """
        let activityController = UIActivityViewController(activityItems: [message], applicationActivities: nil)
        present(activityController, animated: true) { }
    }
    
    @objc private func checkInUser() {
        viewModel.checkIn(forEventId: 1, userName: "Otávio", userEmail: "otavio_souza@gmail.com") { result in
            if result {
                print("Everything worked out")
            } else {
                print("Something went wrong")
            }
        }
    }
}
