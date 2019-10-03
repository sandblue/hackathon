//
//  APIManager.swift
//  TestCollectionView
//
//  Created by Teerawat Vanasapdamrong on 14/8/19.
//  Copyright © 2019 mrhangz. All rights reserved.
//

import Foundation

import UIKit

class ApiManager {
  
  public func request() {
    let test = URL(string: "https://api.partners.scb/partners/sandbox/v1/oauth/token")!
    var request = URLRequest(url: test)
    request.httpMethod = "POST"
    request.addValue("application/json", forHTTPHeaderField: "Content-Type")
    request.addValue("l709c421639b3c41cfb9c94969fd39d173", forHTTPHeaderField: "resourceOwnerId")
    request.addValue("{{$guid}}", forHTTPHeaderField: "requestUId")
    request.addValue("EN", forHTTPHeaderField: "accept-language")
    let json = ["applicationKey":"l709c421639b3c41cfb9c94969fd39d173","applicationSecret":"7198f4dada5e47389ab9e7a6d849136f"]
    let jsonData = try? JSONSerialization.data(withJSONObject: json)
    request.httpBody = jsonData
    
    let taskAuth = URLSession.shared.dataTask(with: request) { (data, response, error) in
      if let _ = error {
      } else if let datax = data, let response = response as? HTTPURLResponse {
        if response.statusCode == 200 {
          do {
            let result = try JSONDecoder().decode(POSTAUTH.self, from: datax)
            print(result)
            let getDeepLink = URL(string: "https://api.partners.scb/partners/sandbox/v3/deeplink/transactions")!
            var request = URLRequest(url: getDeepLink)
            request.httpMethod = "POST"
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            request.addValue("l709c421639b3c41cfb9c94969fd39d173", forHTTPHeaderField: "resourceOwnerId")
            request.addValue("{{$guid}}", forHTTPHeaderField: "requestUId")
            request.addValue("EN", forHTTPHeaderField: "accept-language")
            request.addValue("Bearer " + result.data.accessToken, forHTTPHeaderField: "authorization")
            request.addValue("scbeasy", forHTTPHeaderField: "channel")
            let json = [
              "transactionType": "PURCHASE",
              "transactionSubType": ["BP", "CCFA"],
              "sessionValidityPeriod": 300,
              "sessionValidUntil": "",
              "billPayment": [
                "paymentAmount": 100,
                "accountTo": "264967874136221",
                "accountFrom": "833503",
                "ref1": "ABCDEFGHIJ1234567890",
                "ref2": "ABCDEFGHIJ1234567892",
                "ref3": "ABCDEFGHIJ1234567895"
              ],
              "creditCardFullAmount": [
                "merchantId": "119432274622260",
                "terminalId": "739316464525369",
                "orderReference": "12345678",
                "paymentAmount": 100
              ]
              ] as [String : Any]
            let jsonData = try? JSONSerialization.data(withJSONObject: json)
            request.httpBody = jsonData
            self.requestDepp(request: request)
          } catch {
            print(error)
          }
        }
      }
    }
    taskAuth.resume()
  }
  
  public func requestDepp(request: URLRequest) {
    let taskDeep = URLSession.shared.dataTask(with: request) { (data, response, error) in
      if let _ = error {
      } else if let dataDeep = data, let response = response as? HTTPURLResponse {
        if response.statusCode == 201 {
          do {
            print(response.statusCode)
            let result = try JSONDecoder().decode(DEEPLINK.self, from: dataDeep)
            print(result)
            let x = URL(string: result.data.deeplinkUrl)!
            UIApplication.shared.open( x, options: [:]) { (Bool) in
              print("success")
            }
          } catch {
            print(error)
          }
        }
      }
    }
    taskDeep.resume()
  }
  
  
  
}


// MARK: - TestAPI
struct POSTAUTH: Codable {
  let status: Status
  let data: DataAUTH
}

// MARK: - DataClass
struct DataAUTH: Codable {
  let accessToken, tokenType: String
  let expiresIn, expiresAt: Int
}

// MARK: - Status
struct Status: Codable {
  let code: Int
  let statusDescription: String
  
  enum CodingKeys: String, CodingKey {
    case code
    case statusDescription = "description"
  }
}

struct DEEPLINK: Codable {
  let status: Status
  let data: DataDEEP
}

struct DataDEEP: Codable {
  let transactionId, deeplinkUrl, userRefId: String
}
