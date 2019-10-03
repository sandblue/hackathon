//
//  APIManager.swift
//  hackthon
//
//  Created by Aksorn Khantasit on 3/10/2562 BE.
//  Copyright © 2562 SandBlue. All rights reserved.
//

import Foundation
import Alamofire

enum APIError: Error {
  case invalidJson
  case invalidData
}

struct responseToken: Codable {
  var status: statusToken
  var data: dataToken
}

struct statusToken: Codable {
  var code: Int
  var description: String
}

struct dataToken: Codable {
  var accessToken: String
  var tokenType: String
  var expiresIn: Int
  var expireAt: Int
}

struct DeeplinkData: Codable {
  var deeplinkUrl: String
}

class APIManager {
  
  
  //  func getToken(completion: @escaping (Result<responseToken, APIError>) -> Void) {
  //    let oauthToken = URL(string: "https://api.partners.scb/partners/sandbox/v1/oauth/token")
  //    var request = URLRequest(url: oauthToken!)
  //
  //    request.httpMethod = "GET"
  //    request.setValue("Content-Type", forHTTPHeaderField: "application/json")
  //    request.setValue("resourceOwnerId", forHTTPHeaderField: "l7a02b32cbfd774988882e58a6c2d5c77e")
  //    request.setValue("requestUId", forHTTPHeaderField: "1")
  //    request.setValue("accept-language", forHTTPHeaderField: "en")
  //
  //    let json = [
  //      "applicationKey": "l7a02b32cbfd774988882e58a6c2d5c77e",
  //      "applicationSecret": "a1d71fad366340d8bd4a7516f5c5d250"
  //    ]
  //    let jsonData = try! JSONSerialization.data(withJSONObject: json, options: [])
  //     request.httpBody = jsonData
  //
  //    print("request: \(request)")
  //
  //    let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
  //      if let _ = error {
  //        completion(.failure(.invalidData))
  //      } else if let data = data, let response = response as? HTTPURLResponse {
  //        if response.statusCode == 200 {
  //          do {
  //            print("data: \(data)")
  //            let values = try JSONDecoder().decode(responseToken.self, from: data)
  //            completion(.success(values))
  //          } catch {
  //            print("error: \(error)")
  //            completion(.failure(.invalidJson))
  //          }
  //        }
  //      }
  //    }
  //    task.resume()
  //  }
  
  func postCustomer() {
    let body: [String: Any] = [
      "applicationKey" : "l7a02b32cbfd774988882e58a6c2d5c77e",
      "applicationSecret" : "a1d71fad366340d8bd4a7516f5c5d250"
    ]
    let urlString = "https://api.partners.scb/partners/sandbox/v1/oauth/token"
    let headers: HTTPHeaders = ["Content-Type": "application/json",
                                "resourceOwnerId": "l7a02b32cbfd774988882e58a6c2d5c77e",
                                "requestUId": "1",
                                "accept-language": "EN"]
    
    Alamofire.request(urlString,
                      method: .post,
                      parameters: body,
                      encoding: JSONEncoding.default,
                      headers: headers).responseJSON { (response) -> Void in
                        switch response.result {
                          
                        case .success(let json):
                          print(json)
                        case .failure(let error):
                          print(error)
                        }
    }
  }
  
  func generateDeeplink(completion: @escaping(_ result: Any) -> Void) {
    let urlString = "https://api.partners.scb/partners/sandbox/v3/deeplink/transactions"
    let ref: Parameters = ["paymentAmount": 100.00,
                           "accountTo": "448204658651865",
                           "ref1": "QMM",
                           "ref2": "QMM",
                           "ref3": "QMM"]
    
    let body: Parameters = ["transactionType": "PURCHASE",
                            "transactionSubType": ["BP"],
                            "sessionValidityPeriod": 1800,
                            "sessionValidUntil": "",
                            "billPayment": ref]
    let headers: HTTPHeaders = ["Content-Type": "application/json",
                                "authorization": "Bearer 531fbfa4-b71b-4b3e-8892-a7d99a432a60",
                                "resourceOwnerId": "l7a02b32cbfd774988882e58a6c2d5c77e",
                                "requestUId": "1",
                                "channel": "scbeasy"]
    Alamofire.request(urlString,
                      method: .post,
                      parameters: body,
                      encoding: JSONEncoding.default,
                      headers: headers).responseJSON { (response) -> Void in
                        switch response.result {
                        case .success(let json):
                          let data = json as! [String: AnyObject]
                          for index in data {
                            if index.key == "data" {
                              print("data: \(index)")
                              completion(index.value)
                            }
                          }
                        case .failure(let error):
                          print(error)
                        }
    }
  }
  
}
