//
//  MapCollectionViewMapCell.swift
//  CafeSpot
//
//  Created by Doyoung Song on 7/13/20.
//  Copyright © 2020 Giftbot. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class DetailCollectionViewMapCell: UICollectionViewCell {
    
    static let identifier = "DetailCollectionViewMapCell"
    let locationManager = CLLocationManager()
    
    let title: UILabel = {
        let label = UILabel()
        label.text = "위치 정보"
        label.font = UIFont.systemFont(ofSize: 25)
        label.numberOfLines = 0
        return label
    }()
    
    let mapView = MKMapView()
    var latitude: Float = 0
    var longitude: Float = 0
    
    
    // MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLocationManager()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        configureUI()
    }
    
    
    // MARK: - UI
    private func configureUI() {
        setupConstraints()
    }
    
    private func setupConstraints() {
        [title, mapView].forEach {
            addSubview($0)
        }
        
        // Layout
        title.snp.makeConstraints({
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().inset(20)
            $0.height.equalToSuperview().multipliedBy(0.2)
        })
        
        mapView.snp.makeConstraints({
            $0.top.equalTo(title.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview().inset(10)
        })
    }
    
    // MARK: - Private Methods
    private func setupLocationManager() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        
    }
    
}

extension DetailCollectionViewMapCell: CLLocationManagerDelegate {
    
}
