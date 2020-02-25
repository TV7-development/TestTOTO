//
//  ViewController.swift
//  TestTOTO
//
//  Created by usr01 on 24.02.2020.
//  Copyright © 2020 bhdn. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        let raceView = RaceVeiw(frame: CGRect(x:0, y: self.view.center.y, width: UIScreen.main.bounds.width, height: 50))
//        self.view.addSubview(raceView)
        let someObj = SomeStruct(time: "12:22", places: "1-2-3", runners: "7", mapDescriptuon: "RaceDesc riptiodajbdj hsbjhcbs jhvjs bedbsdba iubdiawb dubwakdb akwbd kawbk duba wkbdk awbdkuba kwubd ku awku dbn", mapImage: UIImage(named: "Bitmap"), raceDescription: "RaceDescription bkbkfbdjsn  fkjbskjfbe jrnfiwnf iwi efnwin efenof nwoin foiwnf oinweoifnoiw nfoin wiefwef")
        
        let rView = RaceExpandedView(frame: CGRect(x:0, y: self.view.center.y/2, width: UIScreen.main.bounds.width, height: 50))
        rView.configure(object: someObj)
        self.view.addSubview(rView)
    }
    
    
}

