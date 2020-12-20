import UIKit
import ObjectMapper

class LocationModel: BaseModel {
    private struct SerializationKeys {
        static let city = "city"
        static let address = "address"
        static let state = "state"
        static let country = "country"
        static let lat = "lat"
        static let lng = "lng"
        static let formattedAddress = "formattedAddress"
    }
    public var city: String?
    public var state: String?
    public var country: String?
    public var lat: Double?
    public var lng: Double?
    public var address: String?
    public var formattedAddress: [String]?

    public required init?(map: Map) {
        super.init(map: map)
    }
    public override func mapping(map: Map) {
        city <- map[SerializationKeys.city]
        state <- map[SerializationKeys.state]
        country <- map[SerializationKeys.country]
        lng <- map[SerializationKeys.lng]
        lat <- map[SerializationKeys.lat]
        address <- map[SerializationKeys.address]
        formattedAddress <- map[SerializationKeys.formattedAddress]
    }
}

