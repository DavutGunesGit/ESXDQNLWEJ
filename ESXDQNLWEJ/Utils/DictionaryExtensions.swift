import Foundation

extension Dictionary {
    func stringFromHttpParameters() -> String {
        let parameterArray = self.map { (key, value) -> String in
            let percentEscapedKey = (key as! String).addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
            if value is String {
                let percentEscapedValue = (value as! String).addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
                return "\(percentEscapedKey!)=\(percentEscapedValue!)"
            } else if value is NSDictionary {
                return (value as! Dictionary).stringFromHttpParameters()
            } else {
                return ""
            }
        }
        let array = parameterArray.sorted() { $0 > $1 }
        
        return array.joined(separator: "&")
    }

}
