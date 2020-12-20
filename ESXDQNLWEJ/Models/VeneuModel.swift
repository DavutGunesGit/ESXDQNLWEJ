import UIKit
import ObjectMapper

class VeneuModel: BaseModel {
    private struct SerializationKeys {
        static let name = "name"
        static let location = "location"
    }
    public var name: String?
    public var location: LocationModel?
    public required init?(map: Map) {
        super.init(map: map)
    }
    public override func mapping(map: Map) {
        name <- map[SerializationKeys.name]
        location <- map[SerializationKeys.location]
    }
    
}

