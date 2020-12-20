import UIKit
import ObjectMapper

class BaseRequest: Mappable {
    var METHOD: String!
    var PATH: String!
    init() {
    }
    required init?(map: Map) {}
    func mapping(map: Map) {}
}
