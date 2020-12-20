import UIKit
import ObjectMapper

class ResponseModel: BaseModel {
    private struct SerializationKeys {
        static let totalResults = "totalResults"
        static let query = "query"
        static let groups = "groups"

    }
    public var totalResults: Int?
    public var query: String?
    public var groups: [GroupsModel]?
    public required init?(map: Map) {
        super.init(map: map)
    }
    public override func mapping(map: Map) {
        totalResults <- map[SerializationKeys.totalResults]
        query <- map[SerializationKeys.query]
        groups <- map[SerializationKeys.groups]
    }
    
}
