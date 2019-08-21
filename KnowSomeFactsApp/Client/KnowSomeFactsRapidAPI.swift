//
//  KnowSomeFactsRapidAPI.swift
//  KnowSomeFactsApp
//
//  Created by fordlabs on 20/08/19.
//  Copyright © 2019 fordlabs. All rights reserved.
//

import Foundation

class KnowSomeFactsRapidAPI {
    
    var basicUrl = "https://numbersapi.p.rapidapi.com/"
    var apiHost = "numbersapi.p.rapidapi.com"
    var apiKey = "3c164db4c6msh320f9ffd8a91427p1c3802jsn9cc1f019bbf5"
    var fragment = "true"
    var jsonType = "true"
    var forwardSlash = "/"
    
    func getDateFacts(date: String, month: String, completionHandler: @escaping (FactsModel?, Error?) -> Void) {
        
        let dateFactsURL = basicUrl+month+forwardSlash+date+forwardSlash+"date"
        
        getJSONFromURL(urlString: dateFactsURL) { (data, error) in
            guard let data = data, error == nil else {
                print("Failed to get data")
                return completionHandler(nil, error)
            }
            
            
            self.createFactsObjectWith(json: data) { (factsModel, error) in
                if let error = error {
                    print("Failed to convert data")
                    return completionHandler(nil, error)
                }
                return completionHandler(factsModel, nil)
            }
            
        }
        
    }
    
    func getYearFacts(year: String, completionHandler: @escaping (FactsModel?, Error?) -> Void) {
        
        let yearFactsURL = basicUrl+year+forwardSlash+"year"
        
        getJSONFromURL(urlString: yearFactsURL) { (data, error) in
            guard let data = data, error == nil else {
                print("Failed to get data")
                return completionHandler(nil, error)
            }
            
            
            self.createFactsObjectWith(json: data) { (factsModel, error) in
                if let error = error {
                    print("Failed to convert data")
                    return completionHandler(nil, error)
                }
                return completionHandler(factsModel, nil)
            }
            
        }
        
        
    }
    
    func getMathFacts(math: String, completionHandler: @escaping (FactsModel?, Error?) -> Void) {
        
        let mathFactsURL = basicUrl+math+forwardSlash+"math"
        
        getJSONFromURL(urlString: mathFactsURL) { (data, error) in
            guard let data = data, error == nil else {
                print("Failed to get data")
                return completionHandler(nil, error)
            }
            
            
            self.createFactsObjectWith(json: data) { (factsModel, error) in
                if let error = error {
                    print("Failed to convert data")
                    return completionHandler(nil, error)
                }
                return completionHandler(factsModel, nil)
            }
            
        }
        
        
    }
    
}

extension KnowSomeFactsRapidAPI {
    
    private func getJSONFromURL(urlString: String, completion: @escaping (_ data: Data?, _ error: Error?) -> Void) {
        guard var components = URLComponents(string: urlString) else {
            return
        }
        components.queryItems = [
            URLQueryItem(name: "fragment", value: "true"),
            URLQueryItem(name: "json", value: "true")
        ]
        var urlRequest = URLRequest(url: (components.url)!)
        urlRequest.addValue(apiHost, forHTTPHeaderField: "X-RapidAPI-Host")
        urlRequest.addValue(apiKey, forHTTPHeaderField: "X-RapidAPI-Key")
        let task = URLSession.shared.dataTask(with: urlRequest) { (data, _, error) in
            guard error == nil else {
                print("Error calling api")
                return completion(nil, error)
            }
            guard let responseData = data else {
                return completion(nil, error)
            }
            return completion(responseData, nil)
        }
        task.resume()
    }
    
    private func createFactsObjectWith(json: Data, completion: @escaping (_ data: FactsModel?, _ error: Error?) -> Void) {
        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let factsResult = try decoder.decode(FactsModel.self, from: json)
            return completion(factsResult, nil)
        } catch let error {
            print("Error Obtained : \(error)")
            return completion(nil, error)
        }
    }
    
    
}
