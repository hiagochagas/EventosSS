//
//  APIRequester.swift
//  EventosSS
//
//  Created by Hiago Chagas on 07/10/21.
//

import Foundation

class APIRequester {
    private let apiURL = "http://5f5a8f24d44d640016169133.mockapi.io/api/events"
    
    public func fetchAllEvents(session: URLSession = URLSession.shared, completion: @escaping ([Event]?, Error?) -> ()) {
           guard let url = URL(string: apiURL) else { return }
           let task = session.dataTask(with: url){ data, response, error in
               if error != nil{
                   completion(nil, error)
                   return
               }
               do {
                   let decoder = JSONDecoder()
                   let results = try decoder.decode([Event].self,from: data!)
                   completion(results, nil)
               } catch {
                   completion(nil, error)
                   return
               }
           }
           task.resume()
       }
}
