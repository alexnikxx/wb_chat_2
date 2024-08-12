//
// CreateChatCompletionRequest.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct CreateChatCompletionRequest: Codable, JSONEncodable, Hashable {

    /** The model to use (e.g., gpt-3.5-turbo). */
    public var model: String?
    /** The messages to send to the model. */
    public var messages: [CreateChatCompletionRequestMessagesInner]?
    /** The maximum number of tokens to generate in the completion. */
    public var maxTokens: Int?
    /** The sampling temperature to use, between 0 and 1. */
    public var temperature: Double? = 1
    /** An alternative to sampling with temperature, called nucleus sampling. */
    public var topP: Double? = 1

    public init(model: String? = nil, messages: [CreateChatCompletionRequestMessagesInner]? = nil, maxTokens: Int? = nil, temperature: Double? = 1, topP: Double? = 1) {
        self.model = model
        self.messages = messages
        self.maxTokens = maxTokens
        self.temperature = temperature
        self.topP = topP
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case model
        case messages
        case maxTokens = "max_tokens"
        case temperature
        case topP = "top_p"
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(model, forKey: .model)
        try container.encodeIfPresent(messages, forKey: .messages)
        try container.encodeIfPresent(maxTokens, forKey: .maxTokens)
        try container.encodeIfPresent(temperature, forKey: .temperature)
        try container.encodeIfPresent(topP, forKey: .topP)
    }
}

