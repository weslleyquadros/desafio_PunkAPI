//
//  Beer.swift
//  desafio_punkAPI
//
//  Created by WeslleyQ on 19/11/19.
//  Copyright © 2019 WeslleyQ. All rights reserved.
//

import Foundation

struct Beer : Codable {
    let id : Int?
    let name : String?
    let tagline : String?
    let first_brewed : String?
    let description : String?
    let image_url : String?
    let abv : Double?
    let ibu : Int?
    let target_fg : Int?
    let target_og : Int?
    let ebc : Int?
    let srm : Int?
    let ph : Double?
    let attenuation_level : Int?
    let volume : Volume?
    let boil_volume : Boil_volume?
    let method : Method?
    let ingredients : Ingredients?
    let food_pairing : [String]?
    let brewers_tips : String?
    let contributed_by : String?

//    enum CodingKeys: String, CodingKey {
//
//        case id = "id"
//        case name = "name"
//        case tagline = "tagline"
//        case first_brewed = "first_brewed"
//        case description = "description"
//        case image_url = "image_url"
//        case abv = "abv"
//        case ibu = "ibu"
//        case target_fg = "target_fg"
//        case target_og = "target_og"
//        case ebc = "ebc"
//        case srm = "srm"
//        case ph = "ph"
//        case attenuation_level = "attenuation_level"
//        case volume = "volume"
//        case boil_volume = "boil_volume"
//        case method = "method"
//        case ingredients = "ingredients"
//        case food_pairing = "food_pairing"
//        case brewers_tips = "brewers_tips"
//        case contributed_by = "contributed_by"
//    }

 init( id : Int? = nil,
          name : String? = nil,
          tagline : String? = nil,
          first_brewed : String? = nil,
          description : String? = nil,
          image_url : String? = nil,
          abv : Double? = nil,
          ibu : Int? = nil,
          target_fg : Int? = nil,
          target_og: Int? = nil,
          ebc : Int? = nil,
          srm : Int? = nil,
          ph : Double? = nil,
          attenuation_level : Int? = nil,
          volume : Volume? = nil,
          boil_volume : Boil_volume? = nil,
          method : Method? = nil,
          ingredients : Ingredients? = nil,
          food_pairing : [String]? = nil,
          brewers_tips : String? = nil,
          contributed_by : String? = nil) {
        
        self.id = id
        self.name = name
        self.tagline = tagline
        self.first_brewed = first_brewed
        self.description = description
        self.image_url = image_url
        self.abv = abv
        self.ibu = ibu
        self.target_fg = target_fg
        self.target_og = target_og
        self.ebc = ebc
        self.srm = srm
        self.ph = ph
        self.attenuation_level = attenuation_level
        self.volume = volume
        self.boil_volume = boil_volume
        self.method = method
        self.ingredients = ingredients
        self.food_pairing = food_pairing
        self.brewers_tips = brewers_tips
        self.contributed_by = contributed_by
 
    }
    
}

extension Beer {
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case tagline
        case first_brewed
        case description
        case image_url
        case abv
        case ibu
        case target_fg
        case target_og
        case ebc
        case srm
        case ph
        case attenuation_level
        case volume
        case boil_volume
        case method
        case ingredients
        case food_pairing
        case brewers_tips
        case contributed_by
    }
}
