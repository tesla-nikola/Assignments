//
//  File.swift
//  MapImplementation
//
//  Created by Soham Ray on 30/09/18.
//  Copyright © 2018 Soham Ray. All rights reserved.
//

import Foundation

public enum APIEndpointType : Endpoint {
    case farm

    var path: String {
        switch self {
        case .farm:
            return "/interview-question-data/farm/farms.json"
        }
    }
    
    var base: String {
        switch self {
        case .farm:
            return "https://s3.eu-west-2.amazonaws.com"
        }
    }

}
