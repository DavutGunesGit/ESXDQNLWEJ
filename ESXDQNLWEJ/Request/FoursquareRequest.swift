import UIKit
import ObjectMapper

class FoursquareRequest: BaseRequest {
    var client_id: String!
    var near: String!
    var client_secret: String!
    var query: String!
    var v: String!
    var ll: String!
    var locale: String!
    var limit: Int!
    override init() {
        super.init()
        self.METHOD = "GET"
        self.PATH = "https://api.foursquare.com/v2/venues/explore"
    }

    required init?(map: Map) {
        fatalError("init(map:) has not been implemented")
    }

    override func mapping(map: Map) {
        self.locale     <- map["locale"]
        self.client_secret     <- map["client_secret"]
        self.client_id     <- map["client_id"]
        self.query     <- map["query"]
        self.limit     <- map["limit"]
        self.v     <- map["v"]
        self.ll     <- map["ll"]
        self.near     <- map["near"]
    }


}
