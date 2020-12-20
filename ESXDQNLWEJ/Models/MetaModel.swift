import UIKit
import ObjectMapper

class MetaModel: BaseModel {
    private struct SerializationKeys {
        static let errorDetail = "errorDetail"
        static let code = "code"
        static let requestId = "requestId"
    }
    public var code: Int?
    public var requestId: String?
    public var errorDetail: String?

    public required init?(map: Map) {
        super.init(map: map)
    }
    public override func mapping(map: Map) {
        errorDetail <- map[SerializationKeys.errorDetail]
        code <- map[SerializationKeys.code]
        requestId <- map[SerializationKeys.requestId]
    }
    
}
