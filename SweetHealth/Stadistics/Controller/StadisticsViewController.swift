//
//  StadisticsViewController.swift
//  SweetHealth
//
//  Created by Miguel Jaimes on 18/02/2020.
//  Copyright © 2020 Miguel Jaimes. All rights reserved.
//

import UIKit
import AAInfographics
import EFCircularSlider

class StadisticsViewController: UIViewController {
    
    
    @IBOutlet weak var imageApp: UIImageView!
    @IBOutlet weak var nameApp: UILabel!
    @IBOutlet weak var titlePercentage: UILabel!
    @IBOutlet weak var boxPercentage: UIView!
    @IBOutlet weak var numberPercentage: UILabel!
    @IBOutlet weak var btnSave: UIButton!
    @IBOutlet weak var titleTimer: UILabel!
    
    @IBAction func btnActionSave(_ sender: Any) {
        performSegue(withIdentifier: "returnHome", sender: nil)
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
        self.setUpTimer()
    }
    
    func setUpTimer(){
        let sliderFrame = CGRect(x:0, y:0, width: self.viewTimer.frame.size.width, height: self.viewTimer.frame.size.height)
        let circularSlider = EFCircularSlider(frame: sliderFrame)
        let hoursArray = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12"]
        circularSlider.snapToLabels = true
        circularSlider.labelColor = #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)
        circularSlider.setInnerMarkingLabels(hoursArray)
        circularSlider.handleColor = UIColor.white
        circularSlider.filledColor = MyColors.pinkApp
        circularSlider.unfilledColor = UIColor.purple
        viewTimer.addSubview(circularSlider)
    }
    
    func setUpGraf(array:[AppElement]){
        let heightGrafic  = CGFloat(self.viewGraf.frame.size.height)
        let widthGrafic  = CGFloat(self.viewGraf.frame.size.width)
        let aaChartView = AAChartView()
        aaChartView.frame = CGRect(x:0,y:0,width:widthGrafic,height:heightGrafic)
        self.grafics(array: array, BoxGrafic: aaChartView)
        self.viewGraf.addSubview(aaChartView)
    }
    
    func makeList(_ n: Int) -> [Int] {
        return (0..<n).map{ _ in Int.random(in: 1 ... 20) }
    }
    
    func grafics(array:[AppElement],BoxGrafic boxGrafic:AAChartView){
        let valuesOne = makeList(6)
        let valuesTwo = makeList(6)
        let aaChartModel = AAChartModel()
            .title("Promedio de uso")
            .chartType(.column)//Can be any of the chart types listed under `AAChartType`.
            .animationType(.easeFromTo)
            .dataLabelsEnabled(false) //Enable or disable the data labels. Defaults to false
            .tooltipValueSuffix(" Times")//the value suffix of the chart tooltip
            .categories(["Lun", "Mar", "Mier","Jue","Vier", "Sab", "Dom"])
            .colorsTheme(["#fe117c","#ffc069","#06caf4","#7dffc0"])
            .series([
                AASeriesElement()
                    .name("Open")
                    .data(valuesOne),
                AASeriesElement()
                    .name("Close")
                    .data(valuesTwo),
            ])
        boxGrafic.aa_drawChartWithChartModel(aaChartModel)
        
    }
    
    func setUpView(){
        guard let urlImge = app?.image else { return }
        imageDownloader.downloader(URLString: urlImge, completion: { (image:UIImage?) in
            self.imageApp.image = image
            self.imageApp.roundImage()
        })
        self.animation()
        titleTimer.text = "Restringir"
        nameApp.text = app?.name.map{ $0.rawValue}
        titlePercentage.text = "Uso"
        boxPercentage.layer.cornerRadius = 7
        boxPercentage.layer.borderWidth = 3
        boxPercentage.layer.borderColor =  MyColors.pinkApp.cgColor
        btnSave.setTitle("Guardar cambios", for: .normal)
        btnSave.backgroundColor = MyColors.pinkApp
        btnSave.tintColor = UIColor.white
    }
    
    func animation(){
        self.imageApp.alpha = 0.0
        UIView.animate(withDuration: 0.5, delay: 1, options: .curveEaseOut, animations: {
            self.imageApp.alpha = 1
        }, completion: nil)
        self.viewGraf.alpha = 0.0
        UIView.animate(withDuration: 1, delay: 1, options: .curveEaseOut, animations: {
            self.viewGraf.alpha = 1
        }, completion: nil)
        self.viewTimer.alpha = 0.0
        UIView.animate(withDuration: 0.5, delay: 1, options: .curveEaseOut, animations: {
            self.viewTimer.alpha = 1
        }, completion: nil)
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
            self.setUpGraf(array: self.listApps)
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
