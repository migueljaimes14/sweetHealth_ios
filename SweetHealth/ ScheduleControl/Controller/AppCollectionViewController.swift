//
//  AppCollectionViewController.swift
//  SweetHealth
//
//  Created by Miguel Jaimes on 18/02/2020.
//  Copyright © 2020 Miguel Jaimes. All rights reserved.
//

import UIKit

private let reuseIdentifier = "cellCollection"

class AppCollectionViewController: UICollectionViewController {
    
    var listApps:[AppElement] = [] {
        didSet {
            self.collectionView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.callApi()
        self.setUpLayout()
        self.collectionView.reloadData()
    }
    
    func setUpLayout(){
          let layout = UICollectionViewFlowLayout()
              layout.itemSize = CGSize(width: 180, height: 180)
              layout.minimumInteritemSpacing = 4
              layout.minimumLineSpacing = 4
              collectionView.collectionViewLayout = layout
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
    // MARK: UICollectionViewDataSourc
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        let section = listApps.count
        return section
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let imageDownloader = ImagenCharged()
        guard let imageUrl = listApps[indexPath.row].image else { fatalError("URL imagen no encontrada") }
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! AppCollectionViewCell
        // Configure the cell
        cell.nameApp.text = listApps[indexPath.row].name.map {$0.rawValue}
        imageDownloader.downloader(URLString: imageUrl, completion: { (image:UIImage?) in
            cell.imageApp.image = image
        })
        return cell
    }
    
    // MARK: UICollectionViewDelegate
}
