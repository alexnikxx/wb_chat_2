//
// CreateChatCompletion200ResponseChoicesInnerMessage.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct CreateChatCompletion200ResponseChoicesInnerMessage: Codable, JSONEncodable, Hashable {

    /** The role of the message sender in the completion. */
    public var role: String?
    /** The content of the generated message. */
    public var content: String?

    public init(role: String? = nil, content: String? = nil) {
        self.role = role
        self.content = content
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case role
        case content
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(role, forKey: .role)
        try container.encodeIfPresent(content, forKey: .content)
    }
}

