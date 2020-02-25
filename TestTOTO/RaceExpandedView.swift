//
//  RaceExpandedView.swift
//  TestTOTO
//
//  Created by usr01 on 25.02.2020.
//  Copyright © 2020 bhdn. All rights reserved.
//

import UIKit
import SnapKit

protocol RaceMapProtocol {
    
    var time: String { get }
    var places: String { get }
    var runners: String { get }
    var mapDescriptuon: String { get }
    var mapImage: UIImage? { get }
    var raceDescription: String { get }
}

class RaceExpandedView: UIView {
    
    private(set) var expandedHeight: CGFloat?
    private var isExpanded: Bool = false {
        didSet {
            //            mapDescriptionLabel.isHidden = isExpanded ? false : true
            //            expandedMapDescriptionView.isHidden = isExpanded ? false : true
        }
    }
    
    private lazy var timeView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    private lazy var placeView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    private lazy var runnerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    private lazy var moreView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        
        return view
    }()
    private lazy var expandedMapDescriptionView: UIView = {
        let view = UIView()
        view.alpha = 0
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        
        return view
    }()
    private lazy var expandedMapImageView: UIView = {
        let view = UIView()
        view.alpha = 0
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        
        return view
    }()
    private lazy var expandedRaceDescriptionView: UIView = {
        let view = UIView()
        view.alpha = 0
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        
        return view
    }()
    
    
    private lazy var timeTextLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = label.font.withSize(12)
        label.numberOfLines = 1
        return label
    }()
    private lazy var placesTextLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = label.font.withSize(12)
        //        label.text = "Place:"
        label.numberOfLines = 1
        return label
    }()
    private lazy var runnersTextLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = label.font.withSize(12)
        //        label.text = "Runners:"
        label.numberOfLines = 1
        return label
    }()
    private lazy var moreLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        //           label.adjustsFontSizeToFitWidth = true
        label.textAlignment = .right
        label.font = label.font.withSize(12)
        label.text = "More:"
        label.numberOfLines = 1
        return label
    }()
    lazy internal var mapDescriptionLabel: UILabel = {
        let label = UILabel()
        label.alpha = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        //           label.adjustsFontSizeToFitWidth = true
        label.textAlignment = .center
        label.font = label.font.withSize(12)
        //        label.textColor = .white
        label.numberOfLines = 0
        return label
    }()
    lazy internal var mapImageView: UIImageView = {
        
        let iv = UIImageView()
        iv.alpha = 0
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFit
        
        return iv
        
    }()
    lazy internal var raceDescriptionLabel: UILabel = {
        let label = UILabel()
        label.alpha = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        //           label.adjustsFontSizeToFitWidth = true
        label.textAlignment = .center
        label.font = label.font.withSize(12)
        //        label.textColor = .white
        label.numberOfLines = 0
        return label
    }()
    
    
    
    private var moreButton: UIButton = UIButton()
    
    func configure(object: RaceMapProtocol) {
        
        timeTextLabel.text = "Time:\(object.time)"
        placesTextLabel.text = "Place:\(object.places)"
        runnersTextLabel.text = "Runners:\(object.runners)"
        mapDescriptionLabel.text = object.mapDescriptuon
        mapImageView.image = object.mapImage
        raceDescriptionLabel.text = object.raceDescription
        
        calculateExpandedHeight(mapDescription: object.mapDescriptuon, raceDescription: object.raceDescription, mapImage: object.mapImage, sidePaddings: 15)
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .lightGray
        setup()
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func makeMoreButton() -> UIButton{
        let button = UIButton()
        //        button.backgroundColor = .white
        //        button.titleLabel?.text = "MRR"
        button.setImage(UIImage(named: "arrow"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(moreButtonTapped), for: .touchUpInside)
        return button
    }
    
}

private extension RaceExpandedView {
    @objc func moreButtonTapped() {
        
        print(#function)
        isExpanded = !isExpanded
        if let exHeight = expandedHeight {
            
            UIView.animate(withDuration: 0.4) {
                
                self.expandedMapDescriptionView.isHidden = self.isExpanded ? false : true
                self.expandedMapImageView.isHidden = self.isExpanded ? false : true
                self.expandedRaceDescriptionView.isHidden = self.isExpanded ? false : true
                self.expandedMapDescriptionView.alpha = self.isExpanded ? 1 : 0
                self.expandedMapImageView.alpha = self.isExpanded ? 1 : 0
                self.expandedRaceDescriptionView.alpha = self.isExpanded ? 1 : 0
                self.mapDescriptionLabel.alpha = self.isExpanded ? 1 : 0
                self.mapImageView.alpha = self.isExpanded ? 1 : 0
                self.raceDescriptionLabel.alpha = self.isExpanded ? 1 : 0
                self.frame.size.height = self.isExpanded ? (exHeight + 50 ): 50
                if (self.isExpanded) {
                    self.setupConstraintsForExpanded()
                } else {
                    self.expandedRaceDescriptionView.snp.removeConstraints()
                    self.expandedMapImageView.snp.removeConstraints()
                    self.expandedMapDescriptionView.snp.removeConstraints()
                    self.mapImageView.snp.removeConstraints()
                    self.mapDescriptionLabel.snp.removeConstraints()
                    self.raceDescriptionLabel.snp.removeConstraints()
                    //                    self.expandedRaceDescriptionView.snp.removeConstraints()
                }
            }
        }
    }
    
    func setupConstraintsForExpanded() {
        self.mapDescriptionLabel.snp.makeConstraints { (make) in
            make.leading.top.equalToSuperview().offset(15)
            make.trailing.bottom.equalToSuperview().offset(-15)
        }
        
        self.mapImageView.snp.makeConstraints { (make) in
            make.leading.top.equalToSuperview().offset(10)
            make.trailing.bottom.equalToSuperview().offset(-10)
            
        }
        
        self.raceDescriptionLabel.snp.makeConstraints { (make) in
            make.leading.top.equalToSuperview().offset(15)
            make.trailing.bottom.equalToSuperview().offset(-15)
            
        }
        
        self.expandedMapDescriptionView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(51)
            make.width.equalToSuperview()
        }
        //IMAGE
        self.expandedMapImageView.snp.makeConstraints { (make) in
            make.top.equalTo(self.expandedMapDescriptionView.snp.bottom).offset(1)
            //            make.height.equalTo(mapImageView.snp.height)
            make.width.equalToSuperview()
            
        }
        
        self.expandedRaceDescriptionView.snp.makeConstraints { (make) in
            make.top.equalTo(self.expandedMapImageView.snp.bottom).offset(1)
            //            make.height.equalTo(raceDescriptionLabel.snp.height)
            make.width.bottom.equalToSuperview()
        }
    }
    
    func setupExpandedViews() {
        
        //MARK: Description Expanded view
        addSubview(expandedMapDescriptionView)
        addSubview(expandedMapImageView)
        addSubview(expandedRaceDescriptionView)
        
        expandedMapDescriptionView.addSubview(mapDescriptionLabel)
        expandedMapImageView.addSubview(mapImageView)
        expandedRaceDescriptionView.addSubview(raceDescriptionLabel)
        
        //        mapDescriptionLabel.snp.makeConstraints { (make) in
        //            make.leading.top.equalToSuperview().offset(15)
        //            make.trailing.bottom.equalToSuperview().offset(-15)
        //        }
        //
        //        mapImageView.snp.makeConstraints { (make) in
        //            make.leading.top.equalToSuperview().offset(10)
        //            make.trailing.bottom.equalToSuperview().offset(-10)
        //
        //        }
        //
        //        raceDescriptionLabel.snp.makeConstraints { (make) in
        //            make.leading.top.equalToSuperview().offset(15)
        //            make.trailing.bottom.equalToSuperview().offset(-15)
        //
        //        }
        //
        //        expandedMapDescriptionView.snp.makeConstraints { (make) in
        //            make.top.equalToSuperview().offset(51)
        //            make.width.equalToSuperview()
        //        }
        //        //IMAGE
        //        expandedMapImageView.snp.makeConstraints { (make) in
        //            make.top.equalTo(expandedMapDescriptionView.snp.bottom).offset(1)
        ////            make.height.equalTo(mapImageView.snp.height)
        //            make.width.equalToSuperview()
        //
        //        }
        //
        //        expandedRaceDescriptionView.snp.makeConstraints { (make) in
        //            make.top.equalTo(expandedMapImageView.snp.bottom).offset(1)
        ////            make.height.equalTo(raceDescriptionLabel.snp.height)
        //            make.width.bottom.equalToSuperview()
        //        }
        //
        
    }
    
    func getLabelHeight(text: String, font: UIFont, paddings: CGFloat) -> CGFloat {
        
        let screenWidth = UIScreen.main.bounds.width
        let labelWidth = screenWidth - ( 2 * paddings ) // (side paddings)
        let height = text.height(withConstrainedWidth: labelWidth, font: font)
        return height
    }
    
    func calculateExpandedHeight(mapDescription: String, raceDescription: String, mapImage: UIImage?, sidePaddings: CGFloat?) {
        let mapDescriptionHeight = getLabelHeight(text: mapDescription, font: .systemFont(ofSize: 12), paddings: 15) + 15*2 //paddings top/bottom
        var mapImageHeight: CGFloat = 0
        if let image = mapImage {
            mapImageHeight = image.size.height + (10 * 2) //paddings top/bottom
        }
        let raceDescriptionHeight = getLabelHeight(text: raceDescription, font: .systemFont(ofSize: 12), paddings: 15) + 15*2  //paddings top/bottom
        print(mapDescriptionHeight, mapImageHeight, raceDescriptionHeight)
        expandedHeight = mapDescriptionHeight + mapImageHeight + raceDescriptionHeight + 3
        print(#function, expandedHeight )
    }
    
    func setup() {
        //        isExpanded = false
        moreButton = makeMoreButton()
        
        addSubview(timeView)
        addSubview(placeView)
        addSubview(runnerView)
        addSubview(moreView)
        
        
        timeView.snp.makeConstraints { (make) in
            make.leading.top.equalToSuperview()
            make.height.equalTo(50)
            make.width.equalTo(placeView)
        }
        placeView.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.height.equalTo(50)
            make.leading.equalTo(timeView.snp.trailing).offset(1)
            
        }
        runnerView.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.height.equalTo(50)
            make.width.equalTo(placeView)
            make.leading.equalTo(placeView.snp.trailing).offset(1)
            
        }
        
        moreView.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.height.equalTo(50)
            make.width.equalTo(placeView)
            
            
            make.leading.equalTo(runnerView.snp.trailing).offset(1)
            make.trailing.equalToSuperview()
        }
        
        
        timeView.addSubview(timeTextLabel)
        placeView.addSubview(placesTextLabel)
        runnerView.addSubview(runnersTextLabel)
        moreView.addSubview(moreButton)
        moreView.addSubview(moreLabel)
        
        timeTextLabel.snp.makeConstraints { (make) in
            make.width.lessThanOrEqualToSuperview()
            make.centerY.equalTo(timeView.snp.centerY)
            make.centerX.equalTo(timeView.snp.centerX)
            
        }
        placesTextLabel.snp.makeConstraints { (make) in
            make.width.lessThanOrEqualToSuperview()
            make.centerY.equalTo(placeView.snp.centerY)
            make.centerX.equalTo(placeView.snp.centerX)
            
        }
        runnersTextLabel.snp.makeConstraints { (make) in
            make.width.lessThanOrEqualToSuperview()
            make.centerX.equalTo(runnerView.snp.centerX)
            make.centerY.equalTo(runnerView.snp.centerY)
        }
        moreLabel.snp.makeConstraints { (make) in
            make.trailing.equalTo(moreView.snp.centerX).offset(10)
            make.leading.equalToSuperview()
            make.centerY.equalTo(moreView.snp.centerY)
        }
        moreButton.snp.makeConstraints { (make) in
            make.top.bottom.trailing.equalToSuperview()
            make.leading.equalTo(moreView.snp.centerX).offset(-10)
        }
        self.setupExpandedViews()
    }
    
    func setupLayout() {
        moreButton = makeMoreButton()
        
        
        
    }
}


struct SomeStruct: RaceMapProtocol {
    var time: String
    
    var places: String
    
    var runners: String
    
    var mapDescriptuon: String
    
    var mapImage: UIImage?
    
    var raceDescription: String
    
    
    
}


extension String {
    func height(withConstrainedWidth width: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [.font: font], context: nil)
        
        return ceil(boundingBox.height)
    }
}












//MARK: Middle section (MapDescription)

//           addSubview(mapDescriptionLabel)
//        //        addSubview(mapImage)
//        //        addSubview(raceDescription)
//        mapDescriptionLabel.snp.makeConstraints { (make) in
//            make.left.equalToSuperview().offset(15)
//            make.trailing.equalToSuperview().offset(-15)
//            make.top.equalTo( placeView.snp.bottom).offset(-15)
//            make.bottom.equalToSuperview().offset(-15)
//
//        }
