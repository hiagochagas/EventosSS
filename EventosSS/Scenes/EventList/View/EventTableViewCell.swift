//
//  EventTableViewCell.swift
//  EventosSS
//
//  Created by Hiago Chagas on 07/10/21.
//

import UIKit

class EventTableViewCell: UITableViewCell {

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
        lbl.font = .systemFont(ofSize: 17, weight: .bold)
        return lbl
    }()
    
    public let eventDescriptionLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Description"
        lbl.font = .systemFont(ofSize: 13, weight: .regular)
        lbl.numberOfLines = 3
        return lbl
    }()
    
    public let eventDateLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "DD/MM/YYYY"
        lbl.font = .systemFont(ofSize: 15, weight: .regular)
        return lbl
    }()
    
    public let eventPriceLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "R$ 00,00"
        lbl.font = .systemFont(ofSize: 15, weight: .regular)
        return lbl
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.addSubviews()
        self.addConstraints()
    }
    
    private func addSubviews() {
        self.addSubview(eventImageView)
        self.addSubview(eventNameLabel)
        self.addSubview(eventDescriptionLabel)
        self.addSubview(eventDateLabel)
        self.addSubview(eventPriceLabel)
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            eventImageView.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 16),
            eventImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 8),
            eventImageView.widthAnchor.constraint(equalToConstant: 80),
            eventImageView.heightAnchor.constraint(equalToConstant: 80),
            eventNameLabel.leftAnchor.constraint(equalTo: eventImageView.rightAnchor, constant: 16),
            eventNameLabel.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: -16),
            eventNameLabel.topAnchor.constraint(equalTo: eventImageView.topAnchor, constant: 0),
            eventDateLabel.leftAnchor.constraint(equalTo: eventNameLabel.leftAnchor, constant: 0),
            eventDateLabel.topAnchor.constraint(equalTo: eventNameLabel.bottomAnchor, constant: 8),
            eventDescriptionLabel.leftAnchor.constraint(equalTo: eventNameLabel.leftAnchor, constant: 0),
            eventDescriptionLabel.topAnchor.constraint(equalTo: eventDateLabel.bottomAnchor, constant: 8),
            eventDescriptionLabel.rightAnchor.constraint(lessThanOrEqualTo: safeAreaLayoutGuide.rightAnchor, constant: -16),
            eventDescriptionLabel.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -16),
            eventPriceLabel.leftAnchor.constraint(equalTo: eventDateLabel.rightAnchor, constant: 8),
            eventPriceLabel.topAnchor.constraint(equalTo: eventDateLabel.topAnchor, constant: 0)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
