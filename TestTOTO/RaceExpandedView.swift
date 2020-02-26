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
    
    
    private var heightMapDescriptionConstraint: Constraint?
    private var heightMapConstraint: Constraint?
    private var heightRaceDescriptionConstraint: Constraint?
    
    private(set) var expandedHeight: CGFloat?
    private var isExpanded: Bool = false
    
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
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        
        return view
    }()
    private lazy var expandedMapImageView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        
        return view
    }()
    private lazy var expandedRaceDescriptionView: UIView = {
        let view = UIView()
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
        label.numberOfLines = 1
        return label
    }()
    private lazy var runnersTextLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = label.font.withSize(12)
        label.numberOfLines = 1
        return label
    }()
    private lazy var moreLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .right
        label.font = label.font.withSize(12)
        label.text = "More:"
        label.numberOfLines = 1
        return label
    }()
    lazy internal var mapDescriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = label.font.withSize(12)
        label.numberOfLines = 0
        return label
    }()
    lazy internal var mapImageView: UIImageView = {
        
        let iv = UIImageView()
//        iv.backgroundColor = .gray
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFit
        
        return iv
        
    }()
    lazy internal var raceDescriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = label.font.withSize(12)
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var separator: UIView = {
        let view = UIView()
        view.frame.size.height = 1
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black
        return view
        
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
        setup()
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func makeMoreButton() -> UIButton{
        let button = UIButton()
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
                
                self.frame.size.height = self.isExpanded ? (exHeight + 50 ): 50
                if (self.isExpanded) {
                    self.updateConstraintsForExpanded()
              
                } else {
                    self.updateConstraintsForHidden()
                    
                }
                
                self.layoutIfNeeded()
            }
        }
    }
    
    private func setupConstraintsForHidden() {
        self.mapDescriptionLabel.snp.makeConstraints { (make) in
            make.leading.equalToSuperview().offset(15)
            make.trailing.equalToSuperview().offset(-15)
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
        }

        self.mapImageView.snp.makeConstraints { (make) in
            make.leading.equalToSuperview().offset(15)
            make.trailing.equalToSuperview().offset(-15)
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        self.raceDescriptionLabel.snp.makeConstraints { (make) in
            make.leading.equalToSuperview().offset(15)
            make.trailing.equalToSuperview().offset(-15)
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        
        self.expandedMapDescriptionView.snp.makeConstraints { (make) in
            make.top.equalTo(placeView.snp.bottom)
            make.width.equalToSuperview()
            heightMapDescriptionConstraint = make.height.equalTo(0).constraint
        }
        
        self.expandedMapImageView.snp.makeConstraints { (make) in
            make.top.equalTo(self.expandedMapDescriptionView.snp.bottom)
            make.width.equalToSuperview()
            heightMapConstraint = make.height.equalTo(0).constraint
        }
        
        self.expandedRaceDescriptionView.snp.makeConstraints { (make) in
            make.top.equalTo(self.expandedMapImageView.snp.bottom)
            make.bottom.width.equalToSuperview()
            heightRaceDescriptionConstraint = make.height.equalTo(0).constraint
        }
    }
    
    
    private func updateConstraintsForExpanded() {
        
        heightMapDescriptionConstraint?.deactivate()
        heightMapConstraint?.deactivate()
        heightRaceDescriptionConstraint?.deactivate()
        
        self.mapDescriptionLabel.snp.updateConstraints { (make) in
            make.top.equalToSuperview().offset(15)
            make.bottom.equalToSuperview().offset(-15)
        }

        self.mapImageView.snp.updateConstraints { (make) in
            make.top.equalToSuperview().offset(10)
            make.bottom.equalToSuperview().offset(-10)
        }

        self.raceDescriptionLabel.snp.updateConstraints { (make) in
            make.top.equalToSuperview().offset(15)
            make.bottom.equalToSuperview().offset(-15)
        }
    }
    
    private func updateConstraintsForHidden() {
        
        self.mapDescriptionLabel.snp.updateConstraints { (make) in
            make.top.bottom.equalToSuperview()
        }
        
        self.mapImageView.snp.updateConstraints { (make) in
            make.top.bottom.equalToSuperview()
        }

        self.raceDescriptionLabel.snp.updateConstraints { (make) in
            make.top.bottom.equalToSuperview()
        }
        
        heightMapDescriptionConstraint?.activate()
        heightMapConstraint?.activate()
        heightRaceDescriptionConstraint?.activate()

    }
    
    private func setupExpandedViews() {
        //MARK: Description Expanded view
        addSubview(expandedMapDescriptionView)
        addSubview(expandedMapImageView)
        addSubview(expandedRaceDescriptionView)
        
        expandedMapDescriptionView.addSubview(mapDescriptionLabel)
        expandedMapImageView.addSubview(mapImageView)
        expandedRaceDescriptionView.addSubview(raceDescriptionLabel)
        
        setupConstraintsForHidden()
    }
    
    private func getLabelHeight(text: String, font: UIFont, paddings: CGFloat) -> CGFloat {
        
        let screenWidth = UIScreen.main.bounds.width
        let labelWidth = screenWidth - ( 2 * paddings ) // (side paddings)
        let height = text.height(withConstrainedWidth: labelWidth, font: font)
        return height
    }
    
    private func calculateExpandedHeight(mapDescription: String, raceDescription: String, mapImage: UIImage?, sidePaddings: CGFloat?) {
        let mapDescriptionHeight = getLabelHeight(text: mapDescription, font: .systemFont(ofSize: 12), paddings: 15) + 15*2 //paddings top/bottom
        var mapImageHeight: CGFloat = 0
        if let image = mapImage {
            mapImageHeight = image.size.height + (10 * 2) //paddings top/bottom
        }
        let raceDescriptionHeight = getLabelHeight(text: raceDescription, font: .systemFont(ofSize: 12), paddings: 15) + 15*2  //paddings top/bottom
        print(mapDescriptionHeight, mapImageHeight, raceDescriptionHeight)
        expandedHeight = mapDescriptionHeight + mapImageHeight + raceDescriptionHeight
        print(#function, expandedHeight )
    }
    
    private func setup() {
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
