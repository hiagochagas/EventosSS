//
//  APIRequester.swift
//  EventosSS
//
//  Created by Hiago Chagas on 07/10/21.
//

import Foundation
import UIKit

class APIRequester {
    private let apiURL = "http://5f5a8f24d44d640016169133.mockapi.io/api/events"
    private let session: URLSession = URLSession.shared
    
    public func fetchAllEvents(completion: @escaping ([EventDAO]?, Error?) -> ()) {
        guard let url = URL(string: apiURL) else { return }
        let task = session.dataTask(with: url){ data, response, error in
            if error != nil{
                completion(nil, error)
                return
            }
            do {
                let decoder = JSONDecoder()
                let results = try decoder.decode([EventDAO].self,from: data!)
                completion(results, nil)
            } catch {
                completion(nil, error)
                return
            }
        }
        task.resume()
    }
    
    func downloadImage(fromURL imgURL: String, completionHandler: @escaping (Data?) -> Void){
        guard let url = URL(string: imgURL) else { return }
        let task = session.dataTask(with: url, completionHandler: { (data, response, error) in
            if error != nil{
                print(error?.localizedDescription ?? "An error was found while downloading the image")
                return
            }
            do{
                completionHandler(data)
            }
        })
        task.resume()
        
    }
}
