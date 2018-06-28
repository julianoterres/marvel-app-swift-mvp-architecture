//
//  Character.swift
//  Marvel
//
//  Created by Juliano Terres on 27/06/18.
//  Copyright © 2018 Juliano Terres. All rights reserved.
//

import ObjectMapper

class Character: NSObject, Mappable {
    
    var id: Int?
    var name: String?
    var desc: String?
    var thumbnail: Thumbnail?
    var comics: Comics?
    var series: Series?
    var stories: Stories?
    var events: Events?
    
    override init() {}
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        desc <- map["description"]
        thumbnail <- map["thumbnail"]
        comics <- map["comics"]
        series <- map["series"]
        stories <- map["stories"]
        events <- map["events"]
    }
    
    func getAvatarUrl(size: ImagesSizes) -> URL? {
        guard let thumbnail = thumbnail, let path = thumbnail.path, let type = thumbnail.typeFile,
            let url = URL(string: path+"/" + size.rawValue + "."+type) else {
                return nil
        }
        return url
    }
    
}
