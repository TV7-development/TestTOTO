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
    private var isExpanded: Bool = false
    
    private lazy var topStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 0
        stack.distribution = .fillEqually
        stack.addArrangedSubview(timeView)
        stack.addArrangedSubview(placeView)
        stack.addArrangedSubview(runnerView)
        stack.addArrangedSubview(moreView)
        return stack
    }()
    
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
    private lazy var timeTextLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = label.font.withSize(14)
        label.numberOfLines = 1
        return label
    }()
    private lazy var placesTextLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = label.font.withSize(14)
        label.numberOfLines = 1
        return label
    }()
    private lazy var runnersTextLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = label.font.withSize(14)
        label.numberOfLines = 1
        return label
    }()
    private lazy var moreLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .right
        label.font = label.font.withSize(14)
        label.text = "More:"
        label.numberOfLines = 1
        return label
    }()
    //MARK: Expanded section views
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
        return view
    }()
    private lazy var expandedRaceDescriptionView: UIView = {
        let view = UIView()
        view.alpha = 0
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    private lazy var mapDescriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .justified
        label.font = label.font.withSize(14)
        label.numberOfLines = 0
        return label
    }()
    private lazy var mapImageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    private lazy var raceDescriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .justified
        label.font = label.font.withSize(14)
        label.numberOfLines = 0
        return label
    }()
    private lazy var raceDescriptionTopImage: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(named: "racingpost")
        iv.frame.size = CGSize(width: 168, height: 12)
        return iv
    }()
    
    private var moreButton: UIButton = UIButton()
    
 
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        setupButtonInsets()
        setupExpandedViews()
        setupSeparators()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(object: RaceMapProtocol) {
         
         timeTextLabel.text = "Time:\(object.time)"
         placesTextLabel.text = "Place:\(object.places)"
         runnersTextLabel.text = "Runners:\(object.runners)"
         mapDescriptionLabel.text = object.mapDescriptuon
         mapImageView.image = object.mapImage
         raceDescriptionLabel.text = object.raceDescription
         calculateExpandedHeight(mapDescription: object.mapDescriptuon, raceDescription: object.raceDescription, mapImage: object.mapImage, sidePaddings: 15)
         
     }
     
    
    private func separatorView() -> UIView {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black
        return view
    }
    
    private func makeMoreButton() -> UIButton{
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font =  button.titleLabel?.font.withSize(14)
        button.contentHorizontalAlignment = .center
        
        button.setTitle("More ", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.setImage(UIImage(named: "arrow"), for: .normal)
        button.addTarget(self, action: #selector(moreButtonTapped), for: .touchUpInside)
        return button
    }
    
    @objc func moreButtonTapped() {
        
        print(#function)
        isExpanded = !isExpanded
        if let exHeight = expandedHeight {
            
            UIView.animate(withDuration: 0.4) {
                
                self.moreButton.imageView!.transform = CGAffineTransform(rotationAngle: self.isExpanded ? CGFloat.pi : 0)
            
                self.expandedMapDescriptionView.alpha = self.isExpanded ? 1 : 0
                self.expandedMapImageView.alpha = self.isExpanded ? 1 : 0
                self.expandedRaceDescriptionView.alpha = self.isExpanded ? 1 : 0
                
                self.frame.size.height = self.isExpanded ? (exHeight + 50 ): 50
                self.layoutIfNeeded()
            }
        }
    }
}

private extension RaceExpandedView {
    
    private func setupExpandedViews() {
        //MARK: Description Expanded view
        addSubview(expandedMapDescriptionView)
        addSubview(expandedMapImageView)
        addSubview(expandedRaceDescriptionView)
        
        expandedMapDescriptionView.addSubview(mapDescriptionLabel)
        expandedMapImageView.addSubview(mapImageView)
        expandedRaceDescriptionView.addSubview(raceDescriptionTopImage)
        expandedRaceDescriptionView.addSubview(raceDescriptionLabel)
        
        setupConstraintsForExpanded()
    }
    
    private func setupConstraintsForExpanded() {
        
        
        self.mapDescriptionLabel.snp.makeConstraints { (make) in
            make.leading.equalToSuperview().offset(15)
            make.trailing.equalToSuperview().offset(-15)
            make.top.equalToSuperview().offset(15).priority(980)
            make.bottom.equalToSuperview().offset(-15).priority(980)
        }
        
        self.mapImageView.snp.makeConstraints { (make) in
            make.height.equalTo(160).priority(970)
            make.width.equalTo(165).priority(970)
            make.centerX.centerY.equalToSuperview()
            make.top.equalToSuperview().offset(10).priority(980)
            make.bottom.equalToSuperview().offset(-10).priority(980)
        }
        
        self.raceDescriptionTopImage.snp.makeConstraints { (make) in
            make.leading.equalToSuperview().offset(15)
            make.top.equalToSuperview().offset(15).priority(980)
        }
        
        self.raceDescriptionLabel.snp.makeConstraints { (make) in
            make.leading.equalToSuperview().offset(15)
            make.trailing.equalToSuperview().offset(-15)
            make.top.equalTo(raceDescriptionTopImage.snp.bottom).offset(15).priority(980)
            make.bottom.equalToSuperview().offset(-15).priority(980)
        }
        
        self.expandedMapDescriptionView.snp.makeConstraints { (make) in
            make.top.equalTo(topStack.snp.bottom)
            make.width.equalToSuperview()
        }
        
        self.expandedMapImageView.snp.makeConstraints { (make) in
            make.top.equalTo(self.expandedMapDescriptionView.snp.bottom)
            make.width.equalToSuperview()
        }
        
        self.expandedRaceDescriptionView.snp.makeConstraints { (make) in
            make.top.equalTo(self.expandedMapImageView.snp.bottom)
            make.bottom.width.equalToSuperview()
        }
    }
    
    private func setupSeparators() {
        
        let separatorMapDesc = separatorView()
        let separatorMap = separatorView()
        let separatorRaceDesc = separatorView()
        let lastSeparatorRaceDesc = separatorView()
        
        expandedMapDescriptionView.addSubview(separatorMapDesc)
        separatorMapDesc.snp.makeConstraints { (make) in
            make.height.equalTo(0.5)
            make.width.top.equalToSuperview()
            
        }
        expandedMapImageView.addSubview(separatorMap)
        separatorMap.snp.makeConstraints { (make) in
            make.height.equalTo(0.5)
            make.width.top.equalToSuperview()
            
        }
        expandedRaceDescriptionView.addSubview(separatorRaceDesc)
        separatorRaceDesc.snp.makeConstraints { (make) in
            make.height.equalTo(0.5)
            make.width.top.equalToSuperview()
        }
        
        addSubview(lastSeparatorRaceDesc)
        lastSeparatorRaceDesc.snp.makeConstraints { (make) in
            make.height.equalTo(0.5)
            make.width.equalToSuperview()
            make.bottom.equalToSuperview().offset(0.5)
        }
        
    }
    
    private func setup() {
        
        moreButton = makeMoreButton()
        
        addSubview(topStack)
        topStack.snp.makeConstraints { (make) in
            make.leading.top.width.equalToSuperview()
            make.height.equalTo(50)
        }
        
        timeView.addSubview(timeTextLabel)
        placeView.addSubview(placesTextLabel)
        runnerView.addSubview(runnersTextLabel)
        moreView.addSubview(moreButton)
       
        
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

        moreButton.snp.makeConstraints { (make) in
            make.leading.top.bottom.trailing.equalToSuperview()
        }
      
        
    }
    
    private func setupButtonInsets() {
        let spacing: CGFloat = 8.0 / 2
        if moreButton.imageView != nil {
            let buttonWidth = moreButton.frame.width
            let imageWidth = moreButton.imageView!.frame.width
            print(buttonWidth, imageWidth, moreView.frame.width, (buttonWidth-imageWidth))
            moreButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: buttonWidth + spacing - imageWidth - 26, bottom: 0, right: -spacing)
            moreButton.titleEdgeInsets = UIEdgeInsets(top: 0, left: -imageWidth/4, bottom: 0, right: imageWidth)
            moreButton.contentEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: imageWidth)
        }
    }
    
    private func getLabelHeight(text: String, font: UIFont, paddings: CGFloat) -> CGFloat {
        
        let screenWidth = UIScreen.main.bounds.width
        let labelWidth = screenWidth - ( 2 * paddings ) // (side paddings)
        let height = text.height(withConstrainedWidth: labelWidth, font: font)
        return height
    }
    
    private func calculateExpandedHeight(mapDescription: String, raceDescription: String, mapImage: UIImage?, sidePaddings: CGFloat?) {
        let mapDescriptionHeight = getLabelHeight(text: mapDescription, font: .systemFont(ofSize: 14), paddings: 15) + 15*2 //paddings top/bottom
        var mapImageHeight: CGFloat = 0
        if let image = mapImage {
            mapImageHeight = 160 + (10 * 2) //paddings top/bottom
        }
        let raceDescriptionHeight = getLabelHeight(text: raceDescription, font: .systemFont(ofSize: 14), paddings: 15) + 15*2 + 12 + 15 //paddings top/bottom + imageHeight + padding image/label
        print(mapDescriptionHeight, mapImageHeight, raceDescriptionHeight)
        expandedHeight = mapDescriptionHeight + mapImageHeight + raceDescriptionHeight
        print(#function, expandedHeight )
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
