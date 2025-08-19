//
//  CodableTransformer.swift
//  Dealit
//
//  Created by Mohammed Ismayil on 18/08/25.
//

import Foundation
import CoreData

import Foundation

@objc(CodableWrapper)
public class CodableWrapper: NSObject, NSSecureCoding {
    public static var supportsSecureCoding: Bool = true
    
    private let data: Data
    private var cachedValue: Any?
    
    // MARK: - Init with Codable
    public init<T: Codable>(_ value: T) {
        self.data = (try? JSONEncoder().encode(value)) ?? Data()
        self.cachedValue = value
        super.init()
    }
    
    // MARK: - NSSecureCoding
    public func encode(with coder: NSCoder) {
        coder.encode(data, forKey: "data")
    }
    
    required public init?(coder: NSCoder) {
        guard let d = coder.decodeObject(of: NSData.self, forKey: "data") as Data? else { return nil }
        self.data = d
        self.cachedValue = nil
        super.init()
    }
    
    // MARK: - Decode into your type
    public func decoded<T: Codable>(as type: T.Type) -> T? {
        if let cached = cachedValue as? T {
            return cached
        }
        if let decoded = try? JSONDecoder().decode(T.self, from: data) {
            cachedValue = decoded
            return decoded
        }
        return nil
    }
}




struct AnyCodable: Codable {
    let value: Any
    
    init<T: Codable>(_ value: T) {
        self.value = value
        self.encodeFunc = { encoder in
            try value.encode(to: encoder)
        }
    }
    
    private let encodeFunc: (Encoder) throws -> Void
    
    func encode(to encoder: Encoder) throws {
        try encodeFunc(encoder)
    }
    
    init(from decoder: Decoder) throws {
        // ⚠️ We don’t know the type here — needs external type info to decode properly.
        throw DecodingError.dataCorrupted(
            .init(codingPath: decoder.codingPath,
                  debugDescription: "AnyCodable requires type info to decode")
        )
    }
}

extension NSValueTransformerName {
    static let CodableWrapperTransformerName = NSValueTransformerName(rawValue: "CodableWrapperTransformer")
}

@objc(CodableWrapperTransformer)
final class CodableWrapperTransformer: ValueTransformer {
    override class func transformedValueClass() -> AnyClass { NSData.self }
    override class func allowsReverseTransformation() -> Bool { true }

    override func transformedValue(_ value: Any?) -> Any? {
        guard let wrapper = value as? CodableWrapper else { return nil }
        return try? NSKeyedArchiver.archivedData(
            withRootObject: wrapper,
            requiringSecureCoding: true
        )
    }

    override func reverseTransformedValue(_ value: Any?) -> Any? {
        guard let data = value as? Data else { return nil }
        return try? NSKeyedUnarchiver.unarchivedObject(
            ofClass: CodableWrapper.self,
            from: data
        )
    }
}
