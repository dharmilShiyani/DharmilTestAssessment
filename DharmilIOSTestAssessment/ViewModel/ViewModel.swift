//
//  ViewModel.swift
//  DharmilIOSTestAssessment
//
//  Created by Shiyani on 02/05/24.
//

import UIKit

class ViewModel: NSObject {

    var viewController: ViewController?
    var arrList = [ModelData](){
        didSet{
            DispatchQueue.main.async {
                self.viewController?.tblView.reloadData()
            }
        }
    }
    
    func fetchDataFromServer() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {
            print("Invalid URL")
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "Unknown error")
                return
            }
            
            if let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [[String:Any]] {
                print(json)
                self.arrList = json.compactMap(ModelData.init)
            }
            else {
                print("Something went wrong")
            }
        }
        
        task.resume()
    }
}
