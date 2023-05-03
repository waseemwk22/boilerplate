//
// StoryService.swift
// Created by waseem on 10/1/19
//

import UIKit

typealias CompletionHandler =  (Bool, AnyObject?) -> Void

class StoryService {

    /// fetch stories from API
    /// - Parameter username: user
    /// - Parameter limit: limit
    /// - Parameter pageNumber: pageNumber for pagination
    /// - Parameter completion: completion
    func fetchStoriesByUsername(username: String, limit: Int?, pageNumber: Int, completion: @escaping CompletionHandler) {
        let request = GetStoriesByUsernameRequest()
        request.username = username
        request.limit = limit
        request.pageNumber = pageNumber
        NetworkApiClient().callApi(request: request) { (apiResponse) in
            if apiResponse.success {
                completion(true, apiResponse.data)
            } else {
                completion(false, apiResponse.message as AnyObject?)
            }
        }
    }

}
