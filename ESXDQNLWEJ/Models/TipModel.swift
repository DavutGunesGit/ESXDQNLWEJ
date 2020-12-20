import UIKit
import ObjectMapper

class TipModel: BaseModel {
    private struct SerializationKeys {
        static let text = "text"
    }
    public var text: String?
    public required init?(map: Map) {
        super.init(map: map)
    }
    public override func mapping(map: Map) {
        text <- map[SerializationKeys.text]
    }
    
}

