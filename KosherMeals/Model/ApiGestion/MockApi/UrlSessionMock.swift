//
//  UrlSessionMock.swift
//  KosherMeals
//
//  Created by julie ryan on 29/07/2024.
//

import Combine
import Foundation

class URLSessionMock: NetworkSession {
    private let data: Data
    private let response: URLResponse
    private let error: URLError?

    init(data: Data, response: URLResponse, error: URLError? = nil) {
        self.data = data
        self.response = response
        self.error = error
    }

    func dataTaskPublisher(for url: URL) -> AnyPublisher<(Data, URLResponse), URLError> {
        if let error = error {
            return Fail(outputType: (Data, URLResponse).self, failure: error)
                .eraseToAnyPublisher()
        }
        
        return Just((data, response))
            .setFailureType(to: URLError.self)
            .eraseToAnyPublisher()
    }
}
