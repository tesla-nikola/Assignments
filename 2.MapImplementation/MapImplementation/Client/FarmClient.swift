//
//  FarmClient.swift
//  MapImplementation
//
//  Created by Soham Ray on 30/09/18.
//  Copyright © 2018 Soham Ray. All rights reserved.
//

import Foundation

class FarmClient: APIClient{
    let session: URLSession
    
    init(configuration: URLSessionConfiguration) {
        self.session = URLSession(configuration: configuration)
    }
    
    convenience init() {
        self.init(configuration: .default)
    }
    
    func getGeoJSONData(from areaType: APIEndpointType, completion: @escaping (Result<GeoData?, APIError>) -> Void) {
        fetch(with: areaType.request , decode: { json -> GeoData? in
            guard let areaResult = json as? GeoData else { return  nil }
            return areaResult
        }, completion: completion)
    }

}
