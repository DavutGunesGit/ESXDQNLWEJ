import UIKit
import ObjectMapper

class BaseModel: Mappable {

    init() {}
    required init?(map: Map) {}

    // Mappable
    func mapping(map: Map) {}
}
