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
    func getAllData(){
        guard let path = Bundle.main.path(forResource: "AppJSON", ofType: "json") else {return}
        let url = URL(fileURLWithPath: path)
        Alamofire.request(url).responseJSON { response in
            switch (response.result) {
            case .success:
                guard let data = response.result.value as? [String: Any] else {return}
                print(data)
            case .failure(_):
                print("Error de conexion")
            }
        }
    }
}
