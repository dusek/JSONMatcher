import Foundation

struct Extractor {
    func extract<T>(_ object: T) -> BaseElementType {
        let builder = Builder()
        if let JSONString = object as? String {
            let JSONObject = self.extractJSONString(JSONString)
            return builder.buildJSONElement(JSONObject)
        }
        return builder.buildJSONElement(object)
    }

    func isValid<T>(_ object: T) -> Bool {
        if object is NSNull {
            return true
        }
        let element = self.extract(object)
        if element is NullElement {
            return false
        }
        return true
    }

    fileprivate func extractJSONString(_ JSONString: String) -> AnyObject? {
        if let data = JSONString.data(using: String.Encoding.utf8) {
            return try? JSONSerialization.jsonObject(with: data, options: [])
        }
        return nil
    }
}
