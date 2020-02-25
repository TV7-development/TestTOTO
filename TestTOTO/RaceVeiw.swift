//
//  RaceVeiw.swift
//  TestTOTO
//
//  Created by usr01 on 24.02.2020.
//  Copyright © 2020 bhdn. All rights reserved.
//

import UIKit
import SnapKit

class RaceVeiw: UIView {
    
    var flowHeightConstraint: NSLayoutConstraint?
    var isExpanded: Bool = false
    //    var height = NSLayoutConstraint()
    //
    var time: String = "12:22"
    
    var places: String = "1-2"
    
    var runners: String = "7"
    
    var mapDescriptuon: String = "Bla bla map description"
    
    var mapImage: UIImage?
    
    var raceDescription: String = "Bla bla bla race description"
    lazy var timeTextLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Time:"
        label.adjustsFontSizeToFitWidth = true
        label.font = label.font.withSize(12)
        label.numberOfLines = 1
        return label
    }()
    lazy var placesTextLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontSizeToFitWidth = true
        label.font = label.font.withSize(12)
        label.text = "Place:"
        label.numberOfLines = 1
        return label
    }()
    lazy var runnersTextLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontSizeToFitWidth = true
        label.font = label.font.withSize(12)
        label.text = "Runners:"
        label.numberOfLines = 1
        return label
    }()
    
    lazy var timeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontSizeToFitWidth = true
        label.font = label.font.withSize(12)
        label.text = self.time
        label.numberOfLines = 1
        return label
    }()
    lazy var placesLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontSizeToFitWidth = true
        label.font = label.font.withSize(12)
        label.text = self.places
        label.numberOfLines = 1
        return label
    }()
    lazy var runnersLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontSizeToFitWidth = true
        label.font = label.font.withSize(12)
        label.text = self.runners
        label.numberOfLines = 1
        return label
    }()
    lazy var moreLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontSizeToFitWidth = true
        label.font = label.font.withSize(12)
        label.text = "More:"
        label.numberOfLines = 1
        return label
    }()
    
    lazy var topView: UIView = {
        let v = UIView()
        v.backgroundColor = .green
        
        return v
    }()
    lazy var quaterView: UIView = {
        let v = UIView()
        v.backgroundColor = .gray
        v.alpha = 0.5
        
        return v
    }()
    lazy var secondQuaterView: UIView = {
        let v = UIView()
        v.backgroundColor = .yellow
        v.alpha = 0.5
        
        return v
    }()
    
    lazy var thirdQuaterView: UIView = {
        let v = UIView()
        v.backgroundColor = .white
        v.alpha = 0.5
        
        return v
    }()
    lazy var lastQuaterView: UIView = {
        let v = UIView()
        v.backgroundColor = .red
        v.alpha = 0.5
        
        return v
    }()
    
    var moreButton: UIButton = UIButton()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .black
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func makeMoreButton() -> UIButton{
        let button = UIButton()
        button.backgroundColor = .gray
        button.titleLabel?.text = "MRR"
        //        button.setImage(UIImage(, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(moreButtonTapped), for: .touchUpInside)
        return button
    }
    @objc func moreButtonTapped() {
        isExpanded = !isExpanded
        UIView.animate(withDuration: 1) {
            self.frame.size.height = self.isExpanded ? 200:0
        }
        print(#function, isExpanded)
    }
    
    func setupLayout() {
        moreButton = makeMoreButton()
        
        self.addSubview(topView)
        topView.snp.makeConstraints { (make) in
            make.width.equalToSuperview()
            make.height.equalTo(50)
        }
        
        topView.addSubview(quaterView)
        quaterView.snp.makeConstraints { (make) in
            print(self.frame.height)
            make.width.equalTo(self.frame.width/4)
            make.height.equalTo(self.frame.height)
            make.left.equalToSuperview()
        }
        
        topView.addSubview(secondQuaterView)
        secondQuaterView.snp.makeConstraints { (make) in
            print(self.frame.height)
            make.width.equalTo(quaterView.snp.width)
            make.height.equalTo(self.frame.height)
            make.left.equalTo(quaterView.snp.right)
        }
        
        topView.addSubview(thirdQuaterView)
        thirdQuaterView.snp.makeConstraints { (make) in
            print(self.frame.height)
            make.width.equalTo(secondQuaterView.snp.width)
            make.height.equalTo(self.frame.height)
            make.left.equalTo(secondQuaterView.snp.right)
        }
        
        topView.addSubview(lastQuaterView)
        lastQuaterView.snp.makeConstraints { (make) in
            print(self.frame.height)
            //            make.width.equalTo(thirdQuaterView.snp.width)
            make.height.equalTo(self.frame.height)
            make.left.equalTo(thirdQuaterView.snp.right)
            make.right.equalTo(topView.snp.right)
        }
        
        quaterView.addSubview(timeTextLabel)
        quaterView.addSubview(timeLabel)
        secondQuaterView.addSubview(placesLabel)
        secondQuaterView.addSubview(placesTextLabel)
        thirdQuaterView.addSubview(runnersTextLabel)
        thirdQuaterView.addSubview(runnersLabel)
        lastQuaterView.addSubview(moreLabel)
        lastQuaterView.addSubview(moreButton)
        
        quaterView.snp.makeConstraints { (make) in
            make.centerY.equalTo(timeLabel.snp.centerY)
            make.centerY.equalTo(timeTextLabel.snp.centerY)
            //            make.left.equalTo(<#T##other: ConstraintRelatableTarget##ConstraintRelatableTarget#>)
        }
        secondQuaterView.snp.makeConstraints { (make) in
            make.centerY.equalTo(placesTextLabel.snp.centerY)
            make.centerY.equalTo(placesLabel.snp.centerY)
        }
        thirdQuaterView.snp.makeConstraints { (make) in
            make.centerY.equalTo(runnersLabel.snp.centerY)
            make.centerY.equalTo(runnersTextLabel.snp.centerY)
        }
        lastQuaterView.snp.makeConstraints { (make) in
            make.centerY.equalTo(moreLabel.snp.centerY)
            make.centerY.equalTo(moreButton.snp.centerY)
        }
        
        
        NSLayoutConstraint.activate([
            timeTextLabel.centerXAnchor.constraint(equalTo: quaterView.centerXAnchor, constant: -20),
            timeLabel.leadingAnchor.constraint(equalTo: timeTextLabel.trailingAnchor, constant: 0),
            placesTextLabel.centerXAnchor.constraint(equalTo: secondQuaterView.centerXAnchor, constant: -15),
            placesLabel.leadingAnchor.constraint(equalTo: placesTextLabel.trailingAnchor, constant: 0),
            runnersTextLabel.centerXAnchor.constraint(equalTo: thirdQuaterView.centerXAnchor, constant: -8),
            runnersLabel.leadingAnchor.constraint(equalTo: runnersTextLabel.trailingAnchor, constant: 0),
            moreLabel.centerXAnchor.constraint(equalTo: lastQuaterView.centerXAnchor, constant: -15),
            moreButton.leadingAnchor.constraint(equalTo: moreLabel.trailingAnchor, constant: 0)
        ])
        
        
    }
}
