import UIKit
import ObjectMapper

class GroupsModel: BaseModel {
    private struct SerializationKeys {
        static let items = "items"
        static let name = "name"

    }
    public var name: String?
    public var items: [ItemModel]?
    public required init?(map: Map) {
        super.init(map: map)
    }
    public override func mapping(map: Map) {
        name <- map[SerializationKeys.name]
        items <- map[SerializationKeys.items]

    }
    
}
