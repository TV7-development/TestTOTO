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
        let raceView = RaceVeiw(frame: CGRect(x:0, y: self.view.center.y, width: UIScreen.main.bounds.width, height: 50))
        self.view.addSubview(raceView)
    }


}

