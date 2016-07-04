//
//  DeckbrewAPI.swift
//  MTGHelper
//
//  Created by Alex Amelchenko on 03/07/16.
//  Copyright © 2016 Alex Amelchenko. All rights reserved.
//


import Foundation
import Moya
import ObjectMapper
import RxSwift

let basicHeaders = [
    "App-Platform-Version": UIDevice.currentDevice().systemVersion,
    "App-Platform": "iOS"
]

let endpoint = {
    (target: Call) -> Endpoint<Call> in
    var endpoint = Endpoint<Call>(URL: target.baseURL.URLByAppendingPathComponent(target.path).absoluteString,
        sampleResponseClosure: { .NetworkResponse(200, target.sampleData) },
        method: target.method,
        parameters: target.parameters,
        parameterEncoding: .JSON)
        .endpointByAddingHTTPHeaderFields(basicHeaders)
    return endpoint
}

let apiProvider = RxMoyaProvider<Call>(endpointClosure: endpoint, plugins: [NetworkLoggerPlugin(verbose: true, responseDataFormatter: JSONResponseDataFormatter)])

private func JSONResponseDataFormatter(data: NSData) -> NSData {
    do {
        let dataAsJSON = try NSJSONSerialization.JSONObjectWithData(data, options: [])
        let prettyData = try NSJSONSerialization.dataWithJSONObject(dataAsJSON, options: .PrettyPrinted)
        return prettyData
    } catch {
        return data
    }
}

public enum Call {
    case CardsByName(String?)
}

extension Call: TargetType {
    
    public var baseURL: NSURL {
        return Config.baseEndpoint
    }
    
    public var path: String {
        switch self {
        case .CardsByName(_):
            return "/cards"
        }
    }
    
    public var method: Moya.Method {
        switch self {
        case .CardsByName(_):
            return .GET
        }
    }
    
    
    public var parameters: [String:AnyObject]? {
        switch self {
        case .CardsByName(let name):
            return [
                "name" : name ?? ""
            ]
        default:
            return nil
        }
    }
    
    public var sampleData: NSData {
        return "{}".dataUsingEncoding(NSUTF8StringEncoding)!
    }
    
}

// MARK: Extensions

extension RxMoyaProvider {
    public func requestObject<T:Mappable>(token: Call) -> Observable<T> {
        let result: Observable<Response> = apiProvider.request(token)
        return result.result()
    }
    
    public func requestArray<T:Mappable>(token: Call) -> Observable<[T]> {
        let result: Observable<Response> = apiProvider.request(token)
        return result.resultArray()
    }
    
}

extension Observable {
    func result<T:Mappable>() -> Observable<T> {
        return self.flatMap {
            result -> Observable<T> in
            
            if let moyaResponse = result as? Moya.Response {
                if (moyaResponse.statusCode >= 200 && moyaResponse.statusCode <= 299) {
                    do {
                        let response = try moyaResponse.mapString()
                        let o: T = Mapper<T>().map(response)!
                        return Observable<T>.just(o)
                    } catch {
                    }
                } else {
                    do {
                        let response = try moyaResponse.mapString()
                        guard let o: ServerResponse = Mapper<ServerResponse>().map(response) else {
                            return Observable<T>.error(CustomError(message: "error"))
                        }
                        return Observable<T>.error(CustomError(message: o.message))
                    } catch {
                    }
                }
                return Observable<T>.error(CustomError(message: "Error"))
            } else {
                preconditionFailure("This method only works for Observable<Moya.Response>")
            }
        }
    }
    
    func resultArray<T:Mappable>() -> Observable<[T]> {
        return self.flatMap {
            result -> Observable<[T]> in
            
            if let moyaResponse = result as? Moya.Response {
                if (moyaResponse.statusCode >= 200 && moyaResponse.statusCode <= 299) {
                    do {
                        let response = try moyaResponse.mapString()
                        guard let b = Mapper<T>().mapArray(response) else {
                            return Observable<[T]>.error(CustomError(message: "error"))
                        }
                        let a: [T] = b
                        return Observable<[T]>.just(a)
                    } catch {
                        //TODO
                    }
                } else {
                    do {
                        let response = try moyaResponse.mapString()
                        guard let o: ServerResponse = Mapper<ServerResponse>().map(response) else {
                            return Observable<[T]>.error(CustomError(message: "error"))
                        }
                        return Observable<[T]>.error(CustomError(message: o.message))
                    } catch {
                        //TODO
                    }
                }
                return Observable<[T]>.error(CustomError(message: "Error"))
            } else {
                preconditionFailure("This method only works for Observable<Moya.Response>")
            }
        }
    }
}

extension Mappable {
    func dictFromObject() -> [String:AnyObject]? {
        let text = Mapper().toJSONString(self)
        if let data = text?.dataUsingEncoding(NSUTF8StringEncoding) {
            do {
                return try NSJSONSerialization.JSONObjectWithData(data, options: []) as? [String:AnyObject]
            } catch let error as NSError {
                print(error)
            } catch {
            }
        }
        return nil
    }
}



