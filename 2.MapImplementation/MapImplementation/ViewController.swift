//
//  ViewController.swift
//  MapImplementation
//
//  Created by Soham Ray on 30/09/18.
//  Copyright © 2018 Soham Ray. All rights reserved.
//

import UIKit
import GoogleMaps

let puneLatLong = CLLocationCoordinate2D(latitude: 18.5204, longitude: 73.8567)

class ViewController: UIViewController {
    @IBOutlet weak var mapView: GMSMapView!
    
    let client = FarmClient()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.camera = GMSCameraPosition(target: puneLatLong, zoom: 10.0, bearing: 0.5, viewingAngle: 0)
        loadData()
    }

    private func loadData() {
        client.getGeoJSONData(from: .farm) { result in
            switch result {
            case .success(let geoJsonData):
                guard let geoJsonResult = geoJsonData else { return }
                print(geoJsonResult)
                geoJsonResult.forEach({
                    self.drawPointsFor(Farms: $0.farms)
                    self.drawPolygonsFor(Fields: $0.fields)
                })
            case .failure(let error):
                print("the error \(error)")
            }
        }
    }
    
    private func drawPointsFor(Farms farms: [Farm]) {
        farms.forEach { (farm) in
            let marker = GMSMarker(position: CLLocationCoordinate2D(latitude: farm.geometry.coordinates[1], longitude: farm.geometry.coordinates[0]))
            marker.title = farm.properties.farmName
            marker.map = self.mapView
        }
    }
    
    private func drawPolygonsFor(Fields fields: [Field]) {
        fields.forEach { (field) in
            let path = GMSMutablePath()
            field.geometry.coordinates.forEach({(position) in
                let locationArray = self.getPosition(position: position)
                locationArray.forEach({path.add($0)})
            })
            let polygon = GMSPolygon(path: path)
            polygon.strokeColor = .red
            polygon.fillColor = .lightGray
            polygon.map = self.mapView
        }
    }
    
    private func getPosition(position: [[Double]]) -> [CLLocationCoordinate2D] {
        var locationArray: [CLLocationCoordinate2D] = []
        position.forEach({locationArray.append(CLLocationCoordinate2D(latitude: $0[1], longitude: $0[0]))})
        return locationArray
    }
    
}

