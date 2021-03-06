//
// SourceData.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation


/** Information regarding the source of any API item */
open class SourceData: JSONEncodable {
    /** Name of the source */
    public var name: String?
    /** URL of the source */
    public var url: String?
    /** Disclaimer text of the source */
    public var disclaimer: String?
    /** URL of the source icon */
    public var image: String?

    public init() {}

    // MARK: JSONEncodable
    open func encodeToJSON() -> Any {
        var nillableDictionary = [String:Any?]()
        nillableDictionary["name"] = self.name
        nillableDictionary["url"] = self.url
        nillableDictionary["disclaimer"] = self.disclaimer
        nillableDictionary["image"] = self.image
        let dictionary: [String:Any] = APIHelper.rejectNil(nillableDictionary) ?? [:]
        return dictionary
    }
}
