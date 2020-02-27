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
        
        let someObj = SomeStruct(time: "12:22", places: "1-2-3", runners: "7", mapDescriptuon: "John Kaye Building & Construction Amateur Riders' Handicap, Class: 5, Distance: 2 mile, 5 furlong", mapImage: nil, raceDescription: "Samuel Drinkwater's well-handicapped 8yo BILLY HICKS rediscovered some form when second in today's headgear combination at Ludlow three weeks ago, and could be seen to even better effect if the ground softens here...")
        
        let rView = RaceExpandedView(frame: CGRect(x:0, y: self.view.center.y/2, width: UIScreen.main.bounds.width, height: 50))
        rView.configure(object: someObj)
        self.view.addSubview(rView)
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //        let raceView = RaceVeiw(frame: CGRect(x:0, y: self.view.center.y, width: UIScreen.main.bounds.width, height: 50))
        //        self.view.addSubview(raceView)
        
    }
    
    
}

