//
// CreateChatCompletion200Response.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct CreateChatCompletion200Response: Codable, JSONEncodable, Hashable {

    /** The ID of the completion. */
    public var id: String?
    /** The object type (e.g., \"text_completion\"). */
    public var object: String?
    /** The timestamp when the completion was created. */
    public var created: Int?
    public var choices: [CreateChatCompletion200ResponseChoicesInner]?
    public var usage: CreateChatCompletion200ResponseUsage?

    public init(id: String? = nil, object: String? = nil, created: Int? = nil, choices: [CreateChatCompletion200ResponseChoicesInner]? = nil, usage: CreateChatCompletion200ResponseUsage? = nil) {
        self.id = id
        self.object = object
        self.created = created
        self.choices = choices
        self.usage = usage
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case id
        case object
        case created
        case choices
        case usage
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(id, forKey: .id)
        try container.encodeIfPresent(object, forKey: .object)
        try container.encodeIfPresent(created, forKey: .created)
        try container.encodeIfPresent(choices, forKey: .choices)
        try container.encodeIfPresent(usage, forKey: .usage)
    }
}

