//
//  DetailViewController.swift
//  SweetHealth
//
//  Created by Miguel Jaimes on 17/02/2020.
//  Copyright © 2020 Miguel Jaimes. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var nameApp: UILabel!
    @IBOutlet weak var logoApp: UIImageView!
    
    let imageDownloader = ImagenCharged()
    var app:AppElement?
    var listApps:[AppElement] = [] {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        guard let name = (app?.name.map{$0.rawValue}) else{return}
        let appSelection = appSelect(AppSelect: name)
        self.callApi(JSONSelect: appSelection)
            setUpView()
    }
    
    func appSelect(AppSelect appSelect:String) -> String {
        var selectionApp:String = ""
        switch appSelect {
        case "Chrome":
            selectionApp = "chromeJSON"
            break
        case "Facebook":
            selectionApp = "facebookJSON"
            break
        case "Instagram":
            selectionApp = "instagramJSON"
            break
        case "Gmail":
            selectionApp = "gmailJSON"
            break
        case "Reloj":
            selectionApp = "relojJSON"
            break
        case "Whatsapp":
            selectionApp = "whatsappJSON"
            break
        default:
            print("")
        }
        return selectionApp
    }
    
    func callApi(JSONSelect jsonSelected:String){
        let apiManager = ApiManger()
        apiManager.getAllData(File: jsonSelected, completion:{ appResult in
            self.listApps = self.CreatListApp(ArrayApp:appResult)
        })
        
    }
    
    func CreatListApp(ArrayApp arrayApp:App)->[AppElement]{
        let arrayLocal = arrayApp.compactMap( {result in
            AppElement(id: result.id, name: result.name, image: result.image, date: result.date, time: result.time, event: result.event, latitude: result.latitude, longitude: result.longitude) })
        return arrayLocal
    }
    
    func setUpView(){
        nameApp.text = app?.name.map{ $0.rawValue }
        guard let image = app?.image else { return }
        imageDownloader.downloader(URLString: image, completion: { (image:UIImage?) in
            self.logoApp.image = image
            self.logoApp.roundImage()
        })
        self.logoApp.alpha = 0.0
        UIView.animate(withDuration: 0.5, delay: 0.5, options: .curveEaseOut, animations: {
            self.logoApp.alpha = 1
        }, completion: nil)
    }
}

extension DetailViewController: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let section = listApps.count
        return section
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 100 //or whatever you need
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let imageUrl = listApps[indexPath.row].image else { fatalError("URL imagen no encontrada") }
        let cellIdentifier = "cellDetail"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? DetailTableViewCell else {
            fatalError("La celda no es una instancia de HomeCell")
        }
        imageDownloader.downloader(URLString: imageUrl, completion: { (image:UIImage?) in
            cell.imageApp.image = image
        })
        cell.nameApp.text = listApps[indexPath.row].name.map { $0.rawValue }
        cell.dateApp.text = listApps[indexPath.row].date
        cell.timeApp.text = listApps[indexPath.row].time
        return cell
    }
}

