//
//  EventTableViewCell.swift
//  EventosSS
//
//  Created by Hiago Chagas on 07/10/21.
//

import UIKit

class EventTableViewCell: UITableViewCell {

    public let eventImageView: UIImageView = {
        let img = UIImageView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    public let eventNameLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Title"
        return lbl
    }()
    
    public let eventDescriptionLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Description"
        lbl.numberOfLines = 0
        return lbl
    }()
    
    public let eventDateLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "DD/MM/YYYY"
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
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            eventImageView.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 16),
            eventImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 8),
            eventNameLabel.leftAnchor.constraint(equalTo: eventImageView.rightAnchor, constant: 16),
            eventNameLabel.topAnchor.constraint(equalTo: eventImageView.topAnchor, constant: 0),
            eventDateLabel.leftAnchor.constraint(equalTo: eventNameLabel.leftAnchor, constant: 0),
            eventDateLabel.topAnchor.constraint(equalTo: eventNameLabel.bottomAnchor, constant: 8),
            eventDescriptionLabel.leftAnchor.constraint(equalTo: eventNameLabel.leftAnchor, constant: 0),
            eventDescriptionLabel.topAnchor.constraint(equalTo: eventDateLabel.bottomAnchor, constant: 8),
            eventDescriptionLabel.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: -16),
            eventDescriptionLabel.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -16)
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
