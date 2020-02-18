//
//  StadisticsViewController.swift
//  SweetHealth
//
//  Created by Miguel Jaimes on 18/02/2020.
//  Copyright © 2020 Miguel Jaimes. All rights reserved.
//

import UIKit

class StadisticsViewController: UIViewController {
    
    
    @IBOutlet weak var imageApp: UIImageView!
    @IBOutlet weak var nameApp: UILabel!
    @IBOutlet weak var titlePercentage: UILabel!
    @IBOutlet weak var boxPercentage: UIView!
    @IBOutlet weak var numberPercentage: UILabel!
    @IBOutlet weak var btnSave: UIButton!
    
    
    @IBAction func btnActionSave(_ sender: Any) {
    }
    
    @IBOutlet weak var viewGraf: UIView!
    @IBOutlet weak var viewTimer: UIView!
    
    var listApps:[AppElement] = []
    
    var app:AppElement? = nil
    let imageDownloader = ImagenCharged()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let name = (app?.name.map{$0.rawValue}) else{return}
        let appSelection = appSelect(AppSelect: name)
        self.callApi(JSON: appSelection)
        self.setUpView()
    }
    
    func setUpView(){
        guard let urlImge = app?.image else { return }
        imageDownloader.downloader(URLString: urlImge, completion: { (image:UIImage?) in
            self.imageApp.image = image
            self.imageApp.roundImage()
        })
        nameApp.text = app?.name.map{ $0.rawValue}
        titlePercentage.text = "Uso"
        boxPercentage.layer.cornerRadius = 7
        boxPercentage.layer.borderWidth = 3
        boxPercentage.layer.borderColor =  MyColors.pinkApp.cgColor
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
    
    func callApi(JSON json:String){
        let apiManager = ApiManger()
        apiManager.getAllData(File: json, completion:{ appResult in
            self.listApps = self.CreatListApp(ArrayApp:appResult)
            let number = self.calculatePorcentage()
            self.numberPercentage.text = "\(number) %"
        })
    }
    
    func CreatListApp(ArrayApp arrayApp:App)->[AppElement]{
        let arrayLocal = arrayApp.compactMap( {result in
            AppElement(id: result.id, name: result.name, image: result.image, date: result.date, time: result.time, event: result.event, latitude: result.latitude, longitude: result.longitude) })
        return arrayLocal
    }
    
    func calculatePorcentage() -> Int {
        let number:Int
        number = (listApps.count * 100)/10
        return number
    }
    
}
