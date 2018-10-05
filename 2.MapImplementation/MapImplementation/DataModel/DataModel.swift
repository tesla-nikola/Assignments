//
//  DataModel.swift
//  MapImplementation
//
//  Created by Soham Ray on 30/09/18.
//  Copyright © 2018 Soham Ray. All rights reserved.
//

import Foundation

typealias GeoData = [GeoJSONResponse]
struct GeoJSONResponse: Codable {
    let farms: [Farm]
    let fields: [Field]
}

struct Farm: Codable {
    let geometry: FarmGeometry
    let type: String
    let properties: FarmProperties
}

struct FarmGeometry: Codable {
    let type: String
    let coordinates: [Double]
}

struct FarmProperties: Codable {
    let farmLatitude: Double
    let permission: Bool
    let farmLongitude: Double
    let farmName, farmSlug: String
    let teamID: Int
    let farmLocation: String
    let ownership: Bool
    let locationSlug: String
    
    enum CodingKeys: String, CodingKey {
        case farmLatitude = "farm_latitude"
        case permission
        case farmLongitude = "farm_longitude"
        case farmName = "farm_name"
        case farmSlug = "farm_slug"
        case teamID = "team_id"
        case farmLocation = "farm_location"
        case ownership
        case locationSlug = "location_slug"
    }
}

struct Field: Codable {
    let geometry: FieldGeometry
    let type: String
    let properties: FieldProperties
}

struct FieldGeometry: Codable {
    let type: String
    let coordinates: [[[Double]]]
}

struct FieldProperties: Codable {
    let permission: Bool
    let soilType: String
    let fieldID: Int
    let farmSlug: String
    let teamID: Int
    let ownership: Bool
    let teamName, locationSlug: String
    let fieldArea: Double
    let farmName, fieldName: String
    let notes: String?
    let fieldLongitude: Double
    let fieldSlug: String
    let workableArea, fieldLatitude: Double
    
    enum CodingKeys: String, CodingKey {
        case permission
        case soilType = "soil_type"
        case fieldID = "field_id"
        case farmSlug = "farm_slug"
        case teamID = "team_id"
        case ownership
        case teamName = "team_name"
        case locationSlug = "location_slug"
        case fieldArea = "field_area"
        case farmName = "farm_name"
        case fieldName = "field_name"
        case notes
        case fieldLongitude = "field_longitude"
        case fieldSlug = "field_slug"
        case workableArea = "workable_area"
        case fieldLatitude = "field_latitude"
    }
}
