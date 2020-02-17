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
                let decoder = JSONDecoder()
                guard let value = try? decoder.decode(App.self, from: response.data!) else {
                    fatalError("Error decoder")
                }
                completion(value)
            case .failure(_):
                print("Error de conexion")
        }
    }
}
}
