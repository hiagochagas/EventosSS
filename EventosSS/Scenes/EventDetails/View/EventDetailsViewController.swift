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
        let alert = UIAlertController(title: "Preencha seus dados", message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cancelar", style: .cancel, handler: nil))
        alert.addTextField(configurationHandler: { textField in
            textField.placeholder = "Nome"
        })
        alert.addTextField(configurationHandler: { textField in
            textField.placeholder = "Email"
        })
        
        alert.addAction(UIAlertAction(title: "Salvar", style: .default, handler: { action in
            guard let name = alert.textFields?[0].text, name != "" else {
                self.showTimerAlert("Dados incompletos", message: "Por favor preencher o campo do nome", timer: 2.0)
                return
            }
            guard let email = alert.textFields?[1].text, email != "" else {
                self.showTimerAlert("Dados incompletos", message: "Por favor preencher o campo do email", timer: 2.0)
                return
            }
            self.checkIn(withEventID: self.event?.id ?? 0, userName: name, userEmail: email)
        }))
        self.present(alert, animated: true)
    }
    
    private func checkIn(withEventID id: Int, userName name: String, userEmail email: String) {
        viewModel.checkIn(forEventId: id, userName: name, userEmail: email) { result in
            if result {
                self.showTimerAlert("Parabéns!", message: "Você fez o check in com sucesso", timer: 3.5)
            } else {
                self.showTimerAlert("Algo deu errado", message: "Você não conseguiu fazer o check in", timer: 3.5)
            }
        }
    }
    
    private func showTimerAlert(_ title: String, message: String, timer: Double) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        DispatchQueue.main.async {
            self.present(alert, animated: true, completion: nil)
        }
        let when = DispatchTime.now() + timer
        DispatchQueue.main.asyncAfter(deadline: when){
            alert.dismiss(animated: true, completion: nil)
        }
    }
}
