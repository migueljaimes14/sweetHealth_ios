//
//  APIManager.swift
//  SweetHealth
//
//  Created by Miguel Jaimes on 19/01/2020.
//  Copyright © 2020 Miguel Jaimes. All rights reserved.
//

import Foundation
import Alamofire

class ApiManger {
    func getAllData(completion: @escaping (App) -> Void){
        guard let path = Bundle.main.path(forResource: "AppJSON", ofType: "json") else {return}
        let url = URL(fileURLWithPath: path)
        Alamofire.request(url).responseJSON { response in
            switch (response.result) {
            case .success:
                if let jsonData = response.result.value  {
                  print("JSON: \(jsonData)") 
                }
            case .failure(_):
                fatalError(Literals.errorConexion)
            }
        }
    }
}
