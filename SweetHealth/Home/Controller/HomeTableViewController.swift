//
//  HomeTableViewController.swift
//  SweetHealth
//
//  Created by Miguel Jaimes on 11/02/2020.
//  Copyright © 2020 Miguel Jaimes. All rights reserved.
//

import UIKit

class HomeTableViewController: UITableViewController {

    var listApps:[AppElement]? = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.callApi()
       
    }
    
    func callApi(){
        let apiManager = ApiManger()
        apiManager.getAllData(completion:{ appResult in
            let arrayApps = appResult
            self.addListApp(ArrayApp:arrayApps)
        })
    }
    
    func addListApp(ArrayApp arrayApp:App){
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
       
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      
        return 0
    }
   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "HomeTableViewCell"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? HomeTableViewCell else {
            fatalError("La celda no es una instancia de HomeCell")
        }
        return cell
    }
    
    

}
