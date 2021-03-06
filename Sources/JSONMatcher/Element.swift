import Foundation

typealias ElementArray = [BaseElementType]
typealias ElementDictionary = [String: BaseElementType]

protocol BaseElementType { }

protocol ElementType: BaseElementType, CustomStringConvertible {
    associatedtype T
    var value: T { get }
    var type: Type.RawType { get }
}

extension ElementType {
    var description: String {
        return String(self.value)
    }
}

struct NumberElement: ElementType {
    let value: NSNumber
    let type: Type.RawType = .Number

    init(_ number: NSNumber) {
        self.value = number
    }

    init(_ number: Int) {
        self.value = NSNumber(integer: number)
    }

    init(_ number: Double) {
        self.value = NSNumber(double: number)
    }
}

struct StringElement: ElementType {
    let value: String
    let type: Type.RawType = .String

    init(_ string: String) {
        self.value = string
    }
}

struct BooleanElement: ElementType {
    let value: Bool
    let type: Type.RawType = .Boolean

    init(_ bool: Bool) {
        self.value = bool
    }
}

struct NullElement: ElementType {
    let value: NSNull
    let type: Type.RawType = .Null

    init(_ null: NSNull) {
        self.value = null
    }

    init() {
        self.value = NSNull()
    }
}

struct ArrayElement: ElementType {
    let value: ElementArray
    let type: Type.RawType = .Array

    init(_ array: ElementArray) {
        self.value = array
    }
}

struct DictionaryElement: ElementType {
    let value: ElementDictionary
    let type: Type.RawType = .Dictionary

    init(_ dictionary: ElementDictionary) {
        self.value = dictionary
    }
}

struct RegexElement: ElementType {
    let value: NSRegularExpression
    let type: Type.RawType = .Unknown

    init(_ regex: NSRegularExpression) {
        self.value = regex
    }
}

struct TypeElement: ElementType {
    let value: Type
    let type: Type.RawType = .Unknown

    init(_ type: Type) {
        self.value = type
    }
}
