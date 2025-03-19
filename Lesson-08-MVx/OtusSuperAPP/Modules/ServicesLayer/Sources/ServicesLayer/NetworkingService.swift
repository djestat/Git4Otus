//
//  NetworkingService.swift
//  ServicesLayer
//
//  Created by Igor on 10.02.2025.
//

import Foundation
import Networking

public class NetworkingService {
    
    public init() { }
    
    public func getArticles(
        q: String,
        from: String,
        sortBy: String,
        language: String,
        apiKey: String,
        page: Int? = nil,
        apiResponseQueue: DispatchQueue = OpenAPIClientAPI.apiResponseQueue,
        completion: @escaping ((_ data: ArticleList?, _ error: Error?) -> Void)
    ) -> RequestTask {
        ArticlesAPI.everythingGet(q: q, from: from, sortBy: sortBy,
                                  language: language, apiKey: apiKey, page: page,
                                  apiResponseQueue: apiResponseQueue, completion: completion)
    }
    
    public func getArticlesWithRequestBuilder(
        q: String,
        from: String,
        sortBy: String,
        language: String,
        apiKey: String,
        page: Int? = nil
    ) -> RequestBuilder<ArticleList> {
        ArticlesAPI
            .everythingGetWithRequestBuilder(q: q, from: from, sortBy: sortBy,
                                             language: language, apiKey: apiKey, page: page)
    }
}
