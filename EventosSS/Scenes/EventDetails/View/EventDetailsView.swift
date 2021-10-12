//
//  EventDetailsView.swift
//  EventosSS
//
//  Created by Hiago Chagas on 11/10/21.
//

import UIKit

class EventDetailsView: UIView {
    public let eventImageView: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.backgroundColor = .blue
        return img
    }()
    
    public let eventNameLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Title"
        lbl.numberOfLines = 2
        lbl.font = .systemFont(ofSize: 28, weight: .bold)
        return lbl
    }()
    
    public let eventDescriptionLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Description"
        lbl.font = .systemFont(ofSize: 17, weight: .regular)
        lbl.numberOfLines = 0
        return lbl
    }()
    
    public let eventDateLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "DD/MM/YYYY"
        lbl.font = .systemFont(ofSize: 20, weight: .regular)
        return lbl
    }()
    
    public let eventPriceLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "R$ 00,00"
        lbl.font = .systemFont(ofSize: 20, weight: .regular)
        return lbl
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .systemBackground
        addSubviews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews() {
        self.addSubview(eventImageView)
        self.addSubview(eventNameLabel)
        self.addSubview(eventDateLabel)
        self.addSubview(eventDescriptionLabel)
        self.addSubview(eventPriceLabel)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            eventImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            eventImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            eventImageView.widthAnchor.constraint(equalToConstant: 200),
            eventImageView.heightAnchor.constraint(equalToConstant: 200),
            eventNameLabel.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 16),
            eventNameLabel.topAnchor.constraint(equalTo: eventImageView.bottomAnchor, constant: 8),
            eventNameLabel.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: -16),
            eventDateLabel.leftAnchor.constraint(equalTo: eventNameLabel.leftAnchor),
            eventDateLabel.topAnchor.constraint(equalTo: eventNameLabel.bottomAnchor, constant: 16),
            eventPriceLabel.leftAnchor.constraint(equalTo: eventDateLabel.rightAnchor, constant: 8),
            eventPriceLabel.topAnchor.constraint(equalTo: eventDateLabel.topAnchor),
            eventDescriptionLabel.topAnchor.constraint(equalTo: eventDateLabel.bottomAnchor, constant: 8),
            eventDescriptionLabel.leftAnchor.constraint(equalTo: eventDateLabel.leftAnchor),
            eventDescriptionLabel.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: -16)
        ])
    }
}
