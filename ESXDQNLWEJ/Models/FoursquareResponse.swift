import UIKit
import ObjectMapper

class FoursquareResponse: BaseResponse {
    var meta: MetaModel?
    var response: ResponseModel?
    public required init?(map: Map) {
        super.init(map: map)
    }
    public override func mapping(map: Map) {
        meta <- map["meta"]
        response <- map["response"]
    }
}
