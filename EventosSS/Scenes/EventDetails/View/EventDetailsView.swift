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
    
    let checkInButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("Check In", for: .normal)
        btn.backgroundColor = .systemBlue
        btn.layer.cornerRadius = 20
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    public let scrollView: UIScrollView = {
        let scrll = UIScrollView(frame: .zero)
        scrll.translatesAutoresizingMaskIntoConstraints = false
        return scrll
    }()
    
    let containerScrollView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
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
        self.addSubview(scrollView)
        scrollView.addSubview(containerScrollView)
        containerScrollView.addSubview(eventImageView)
        containerScrollView.addSubview(eventNameLabel)
        containerScrollView.addSubview(eventDateLabel)
        containerScrollView.addSubview(eventDescriptionLabel)
        containerScrollView.addSubview(eventPriceLabel)
        containerScrollView.addSubview(checkInButton)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            scrollView.leftAnchor.constraint(equalTo: leftAnchor),
            scrollView.rightAnchor.constraint(equalTo: rightAnchor),
            scrollView.topAnchor.constraint(equalTo: topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor),
            containerScrollView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            containerScrollView.leftAnchor.constraint(equalTo: scrollView.leftAnchor),
            containerScrollView.rightAnchor.constraint(equalTo: scrollView.rightAnchor),
            containerScrollView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            containerScrollView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            eventImageView.centerXAnchor.constraint(equalTo: containerScrollView.centerXAnchor),
            eventImageView.topAnchor.constraint(equalTo: containerScrollView.topAnchor, constant: 16),
            eventImageView.widthAnchor.constraint(equalToConstant: 200),
            eventImageView.heightAnchor.constraint(equalToConstant: 200),
            eventNameLabel.leftAnchor.constraint(equalTo: containerScrollView.leftAnchor, constant: 16),
            eventNameLabel.topAnchor.constraint(equalTo: eventImageView.bottomAnchor, constant: 8),
            eventNameLabel.rightAnchor.constraint(equalTo: containerScrollView.rightAnchor, constant: -16),
            eventDateLabel.leftAnchor.constraint(equalTo: eventNameLabel.leftAnchor),
            eventDateLabel.topAnchor.constraint(equalTo: eventNameLabel.bottomAnchor, constant: 16),
            eventPriceLabel.leftAnchor.constraint(equalTo: eventDateLabel.rightAnchor, constant: 8),
            eventPriceLabel.topAnchor.constraint(equalTo: eventDateLabel.topAnchor),
            eventDescriptionLabel.topAnchor.constraint(equalTo: eventDateLabel.bottomAnchor, constant: 8),
            eventDescriptionLabel.leftAnchor.constraint(equalTo: eventDateLabel.leftAnchor),
            eventDescriptionLabel.rightAnchor.constraint(equalTo: containerScrollView.rightAnchor, constant: -16),
            checkInButton.topAnchor.constraint(equalTo: eventDescriptionLabel.bottomAnchor, constant: 8),
            checkInButton.centerXAnchor.constraint(equalTo: containerScrollView.centerXAnchor, constant: 0),
            checkInButton.widthAnchor.constraint(equalToConstant: 200),
            checkInButton.heightAnchor.constraint(equalToConstant: 50),
            checkInButton.bottomAnchor.constraint(equalTo: containerScrollView.bottomAnchor, constant: -16)
        ])
    }
}
