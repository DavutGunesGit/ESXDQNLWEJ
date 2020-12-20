import UIKit
import ObjectMapper
//import Alamofire

class ConnectionManager: NSObject, URLSessionDelegate {
    func getConnectionResult()  {
        
    }

    static let sharedInstance = ConnectionManager()
    var requestArrayForProgressHud: [BaseRequest] = []
    let TIMEOUT_INTERVAL = Constant.numberRequestTimeout
    override init() {
        super.init()
    }

    func createRequestURLString(request: BaseRequest) -> String {
        let parameterString = request.toJSON().stringFromHttpParameters()
        var requestUrlString = String()
        requestUrlString = "\(request.PATH!)" + "?\(parameterString)"
        return requestUrlString
    }

    func createURLRequest(request: BaseRequest, requestURL: URL?) -> URLRequest {
        var urlRequest = URLRequest.init(url: requestURL!, cachePolicy: .useProtocolCachePolicy, timeoutInterval: TIMEOUT_INTERVAL)
        urlRequest.httpMethod = request.METHOD
        return urlRequest
    }
    func requestWithConnection<T: BaseResponse>(request: BaseRequest, callback: @escaping (_ response: T?, _ error: String?) -> Void) {
        let requestUrlString = self.createRequestURLString(request: request)
        let urlRequest = self.createURLRequest(request: request, requestURL: URL.init(string: requestUrlString))
        
        let session = URLSession.shared
        let task = session.dataTask(with: urlRequest) { (data, response, error) in
            if data == nil {
            } else{
                do {
                    let json = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as! [AnyHashable: Any]
                    let datastring = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)

                    print("datastring1 = \(datastring)")
                    if json["response"] != nil && json["meta"] != nil{
                        let response: T = Mapper<T>().map(JSONObject: json)!
                        callback(response, nil)
                    }else{
                        callback(nil,"Hata oluştu lütfen tekrar deneyiniz.")
                    }

                }catch {
                    callback(nil,"Hata oluştu lütfen tekrar deneyiniz.")
                }
            }
            
        }
        task.resume()
    }
}
