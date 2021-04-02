//
//  NetworkService.swift
//  MyNetwork
//
//  Created by 맥북프로에임메드 on 2021/03/04.
//

import UIKit
import RxSwift

enum NetworkError: Error {
    case noneSelf
    case invalidURL
    case noneData
    case APIInvalidResponse
    case parsingError
    case status300Error
    case status400Error
    case status500Error
    case unknownError(message: String)
    
    var localizedDescription: String {
        switch self {
        case .noneSelf:
            return "self is None"
        case .invalidURL:
            return "Invalid URL"
        case .noneData:
            return "Data is None"
        case .parsingError:
            return "parsing Error"
        case .APIInvalidResponse:
            return "API Invalid Response"
        case .status300Error:
            return "Client Error"
        case .status400Error:
            return "Client Error"
        case .status500Error:
            return "Server Error"
        case .unknownError(let message):
            return "Unkown error : \(message)"
        }
    }
}

enum RequestType: CustomStringConvertible {
    case get
    case post
    case delete
    
    var description: String {
        switch self {
        case .get:
            return "GET"
        case .post:
            return "POST"
        case .delete:
            return "DELETE"
        }
    }
}


typealias NetworkResult = ((Result<Data, NetworkError>) -> Void)

protocol NetworkServiceType {
    
    static func request<T:Codable>(request type: RequestType, url: String, param: [String:String]?, body: Data?, header: [String:String]?) -> Observable<Result<T,NetworkError>>
    
    static func uploadImage(urlString:String, paramName: String, fileName: String, image: UIImage,token: String)
}

final class NetworkService: NetworkServiceType {
    
    static func request<T:Codable>(request type: RequestType = .get, url: String,param: [String:String]? = nil, body: Data? = nil, header: [String:String]? = nil) -> Observable<Result<T,NetworkError>> {
        let session = URLSession.shared
        
        return Observable.create { observer -> Disposable in
            guard var component = URLComponents(string: url) else {
                observer.onError(NetworkError.invalidURL)
                return Disposables.create()
            }
            if let params = param {
                var parameters = [URLQueryItem]()
                for (name,value) in params {
                    parameters.append(URLQueryItem(name: name, value: value))
                }
                component.queryItems = parameters
            }
            
            var urlRequest = URLRequest(url: component.url!)
            
            urlRequest.httpMethod = type.description
            urlRequest.httpBody = body
            urlRequest.allHTTPHeaderFields = header
            urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
            
            session.dataTask(with: urlRequest) { data, response, error in
                print("리스폰스 :",response)
                if let response = response as? HTTPURLResponse {
                    switch response.statusCode {
                    case 200..<300:
                        guard let data = data else {
                            observer.onNext(.failure(.noneData))
                            return
                        }
                        do {
                            let model:T = try JSONDecoder().decode(T.self, from: data)
                            observer.onNext(.success(model))
                        } catch {
                            observer.onNext(.failure(.noneData))
                        }
                    case 300..<400:
                        observer.onNext(.failure(.status300Error))
                    case 400..<500:
//                        observer.onError(NetworkError.status400Error)
                        observer.onNext(.failure(.status400Error))
                    case 500...:
                        observer.onNext(.failure(.status500Error))
                    default:
                        observer.onNext(.failure(.unknownError(message: error?.localizedDescription ?? "status ?? Error")))
                    }
                } else {
                    observer.onNext(.failure(.APIInvalidResponse))
                }
            }.resume()
            return Disposables.create {
                session.invalidateAndCancel()
            }
            
        }
    }
    
   static func uploadImage(urlString:String, paramName: String, fileName: String, image: UIImage, token: String) {
        let url = URL(string: urlString)

        let boundary = UUID().uuidString

        let session = URLSession.shared

        var urlRequest = URLRequest(url: url!)
        urlRequest.httpMethod = "POST"

        urlRequest.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
        urlRequest.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        var data = Data()

        data.append("\r\n--\(boundary)\r\n".data(using: .utf8)!)
        data.append("Content-Disposition: form-data; name=\"\(paramName)\"; filename=\"\(fileName)\"\r\n".data(using: .utf8)!)
        data.append("Content-Type: image/jpg\r\n\r\n".data(using: .utf8)!)
        data.append(image.jpegData(compressionQuality: 1)!)

        data.append("\r\n--\(boundary)--\r\n".data(using: .utf8)!)

        session.uploadTask(with: urlRequest, from: data, completionHandler: { responseData, response, error in
            print(response)
            if error == nil {
                let jsonData = try? JSONSerialization.jsonObject(with: responseData!, options: .allowFragments)
                if let json = jsonData as? [String: Any] {
                    print(json)
                }
            }
        }).resume()
    }
}



