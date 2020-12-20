import UIKit
import ObjectMapper

class ItemModel: BaseModel {
    private struct SerializationKeys {
        static let venue = "venue"
        static let tips = "tips"
    }
    public var venue: VeneuModel?
    public var tips: [TipModel]?
    public required init?(map: Map) {
        super.init(map: map)
    }
    public override func mapping(map: Map) {
        venue <- map[SerializationKeys.venue]
        tips <- map[SerializationKeys.tips]
    }
    
}
