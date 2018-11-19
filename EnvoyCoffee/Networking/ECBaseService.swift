//
//  ECBaseService.swift
//  EnvoyCoffee
//
//  Created by Goran Tokovic on 11/19/18.
//  Copyright © 2018 Goran Tokovic. All rights reserved.
//

import Foundation
import Alamofire

class ECBaseService: NSObject {
    
    public typealias ServiceCompletionBlock = ((_ error: Error?, _ response: Any?) -> Void)?
    
    static let shared: ECBaseService = ECBaseService()
    private let defaultSession = URLSession.shared
    private var dataTask: URLSessionDataTask?
    
    func baseGetService(url : String, params : [String : Any]? = nil, aCompletion : ServiceCompletionBlock) -> Void{
        Alamofire.request(url, method: .get, parameters: params, encoding: JSONEncoding.default, headers: [:]).responseJSON { response in
            //debugPrint(response)
            if aCompletion != nil
            {
                self.handleResponse(response: response, aCompletion: { (error, responseObject) in
                    aCompletion!(error, responseObject)
                })
            }
        }
    }
    
    private func handleResponse(response : DataResponse<Any>, aCompletion : (_ anError : Error?, _ responseObject : Any?) -> Void) -> Void {
        
        let statusCode = response.response?.statusCode
        
        switch response.result {
            
        case .success(let data):
            //if success
            
            if let response = data as? Array <Any> {
                //if response is Array
                aCompletion(nil, response)
                
            }else if let response = data as? Dictionary <String, Any> {
                //if response is Dictionary
                if let meta = response["meta"] as? [String:Any], let errorString = meta["errorDetail"] as? String{
                    let nsError = NSError.init(domain: "", code: statusCode ?? 0, userInfo: [NSLocalizedDescriptionKey: errorString])
                    let error = nsError as Error
                    aCompletion(error, nil)
                }else{
                    aCompletion(nil, response)
                }
            }else {
                //if response is not array nor dictionary
                aCompletion(nil, nil)
            }
            
        case .failure(let failError):
            //if failure
            aCompletion(failError, nil)
        }
    }
}
