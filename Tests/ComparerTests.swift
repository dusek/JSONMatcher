import XCTest
import Nimble
@testable import JSONMatcher

class ComparerTestCase: XCTestCase {
    func testSimpleStringElement() {
        expect(Comparer.compare("foo", "foo")).to(beTrue())
        expect(Comparer.compare("foo", "bar")).to(beFalse())
    }
    
    func testSimpleNumberElement() {
        expect(Comparer.compare(10, 10)).to(beTrue())
        expect(Comparer.compare(10, 10.0)).to(beTrue())
        expect(Comparer.compare(2, 0x10)).to(beTrue())
        expect(Comparer.compare(30, 30.0000001)).to(beTrue())
    }
    
    func testSimpleBoolElement() {
        expect(Comparer.compare(true, true)).to(beTrue())
        expect(Comparer.compare(false, true)).to(beFalse())
    }
    
    func testSimpleNilElement() {
        expect(Comparer.compare(nil, nil)).to(beTrue())
        //expect(Comparer.compare(nil, NSNull())).to(beTrue())
        expect(Comparer.compare(nil, true)).to(beFalse())
    }
    /*
    func testSimpleRegex() {
        expect(Comparer.compare("foo", RegexElement(".+"))).to(beTrue())
        expect(Comparer.compare("10", RegexElement("[0-9]{2}"))).to(beTrue())
        expect(Comparer.compare(10, RegexElement("10"))).to(beFalse())
        expect(Comparer.compare(false, RegexElement(".+"))).to(beFalse())
    }*/
    
    func testSimpleArray() {
        expect(Comparer.compare([10, 20], [10, 20])).to(beTrue())
        expect(Comparer.compare([10, "foo", true], [10, "foo", true])).to(beTrue())
        expect(Comparer.compare([10, 20], [10])).to(beFalse())
        expect(Comparer.compare([5, 10, 15], ["5", "10", "15"])).to(beFalse())
    }
    
    func testSimpleDictionary() {
        expect(Comparer.compare(["name": "bob", "age": 30], ["name": "bob", "age": 30])).to(beTrue())
    }
    /*
    func testArrayWithRegex() {
        expect(Comparer.compare([10, "foo", "bar", "apple"], [10, RegexElement("^fo+$"), "bar", RegexElement("[a-z]+")])).to(beTrue())
    }*/
    
    /*func testComplexObject() {
        expect(Comparer.compare(json: JSON([
                "title" : "Introduce new feature!",
                "body" : "New feature is now available. Please check it out",
                "url" : "https://example.com/articles/305/",
                "published_at" : "2016-04-23T15:50:00+09:00",
                "published" : true,
                "author" : [
                    "name" : "alice",
                    "age" : 30
                ],
                "tags" : ["new feature", "update", "diary"]
                ]),
            expected: [
                "title" : "Introduce new feature!",
                "body" : "New feature is now available. Please check it out",
                "url" : "https://example.com/articles/305/",
                "published_at" : Regex("\\d{4}\\-\\d{2}-\\d{2}T\\d{2}:\\d{2}:\\d{2}\\+\\d{2}:0{2}"),
                "published" : true,
                "author" : [
                    "name" : "alice",
                    "age" : 30
                ],
                "tags" : ["new feature", "update", "diary"]
                
            ]).compare()).to(beTrue())
    }*/

}