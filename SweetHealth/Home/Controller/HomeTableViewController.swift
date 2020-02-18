//
//  HomeTableViewController.swift
//  SweetHealth
//
//  Created by Miguel Jaimes on 11/02/2020.
//  Copyright © 2020 Miguel Jaimes. All rights reserved.
//

import UIKit

class HomeTableViewController: UITableViewController {
    
    var listApps:[AppElement] = [] {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.callApi()
        self.tableView.reloadData()
    }
    
    func callApi(){
        let apiManager = ApiManger()
        apiManager.getAllData(File: "listAppJSON", completion:{ appResult in
            self.listApps = self.CreatListApp(ArrayApp:appResult)
        })
    }
    
    func CreatListApp(ArrayApp arrayApp:App)->[AppElement]{
        let arrayLocal = arrayApp.compactMap( {result in
            AppElement(id: result.id, name: result.name, image: result.image, date: result.date, time: result.time, event: result.event, latitude: result.latitude, longitude: result.longitude) })
        return arrayLocal
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let section = listApps.count
        return section
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let imageDownloader = ImagenCharged()
        guard let imageUrl = listApps[indexPath.row].image else { fatalError("URL imagen no encontrada") }
        let cellIdentifier = "HomeTableViewCell"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? HomeTableViewCell else {
            fatalError("La celda no es una instancia de HomeCell")
        }
        cell.nameApp.text = listApps[indexPath.row].name.map { $0.rawValue }
        imageDownloader.downloader(URLString: imageUrl, completion: { (image:UIImage?) in
            cell.imageApp.image = image
        })
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let indexPath = tableView.indexPathForSelectedRow {
            guard let detailViewController = segue.destination as? DetailViewController else {return}
            let selectRow = indexPath.row
            detailViewController.app = listApps[selectRow]
        }
    }
}
