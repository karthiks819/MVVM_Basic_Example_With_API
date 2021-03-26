//
//  ParserViewModel.swift
//  MVVMSample
//
//  Created by Karthik on 26/03/21.
//

import Foundation

class ParserViewModel {
    
    
    func parseData(fromURL url: String,  completionHandler: @escaping (ContactsModel)->()) {
        let url = URL(string: url)!
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if (error != nil){
                print(error?.localizedDescription as Any)
            }
            
            do {
                let modelData = try JSONDecoder().decode(ContactsModel.self, from: data!)
                completionHandler(modelData)
            }catch(let error) {
                print(error.localizedDescription)
            }
            
        }.resume()
    }
    
    
}
