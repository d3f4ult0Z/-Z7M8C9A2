//
//  APIs.swift
//  Z7M8C9A2
//
//  Created by Adrián Jacobo on 01/07/22.
//

import Foundation
import Alamofire
import UIKit
import CoreLocation

enum API {
    
    static var enviroment:Enviroment = .prd
    // MARK: - Ambiente
    enum Enviroment{
        case dev
        case prd
    }
    // MARK: - URL Base
    static var urlBase:String {
        switch API.enviroment {
        case .prd:
            return "https://api.latitudmegalopolis.com/functions/test.php?keycode"
        case .dev:
            return "https://api.latitudmegalopolis.com/functions/test.php?keycode"
        }
    }
    
    
    // MARK: - Servicios de Z7M8C9A2
    case test
    case login(user:String, pass:String)
}

// MARK: - Metodos
extension API{
    var method:HTTPMethod{
        switch self {
        default:
            return .post
        }
    }
    // MARK: - Parametros
    var params:[String:String]?{
        switch self {
        case .login(let user, let pass):
            return ["phone":user, "pass":pass]
        
        default:
            return nil
        }
    }
    
    
    // MARK: - URL de Servicios
    var urlComplement:String{
        switch self {
        case .test:
            return ""
        
        case .login:
            return "\(API.urlBase)=LOGINPOST"
            
        }
    }
    // MARK: - Headers
    var headers:HTTPHeaders{
        switch self {
        default:
            return [HTTPHeader(name: "Content-Type", value: "application/x-www-form-urlencoded")]
        }
    }
}

extension API{
    func request<ResponseType:Codable>(model: ResponseType.Type,handler: @escaping (_ response:ResponseType?, _ error:String?, _ statusCode:Int?) -> Void){
        let method:HTTPMethod = self.method
        let params:[String:String]? = self.params
        let urlComplement:String = self.urlComplement
        let headers:HTTPHeaders = self.headers
        debugPrint("-------------------Conectandose a API-------------------")
        debugPrint("URL---------->\(urlComplement)")
        debugPrint("Metodo------->\(method)")
        debugPrint("Parametros--->\(params ?? ["Parametros":"No tenemos parametros"])")
        debugPrint("Modelo------->\(model)")
        debugPrint("Cabeceras---->\(headers)")
        debugPrint("--------------------------------------------------------")
        AF.request(urlComplement, method: method, parameters: params, encoder: URLEncodedFormParameterEncoder.default, headers: headers).responseData{ response in
            let decoder = JSONDecoder()
            if let data = response.data{
                do{
                    let responseModel = try decoder.decode(model, from: data)
                    handler(responseModel, nil, response.response?.statusCode)
                    debugPrint("Response:")
                    debugPrint(responseModel)
                    debugPrint("Error:")
                    debugPrint("--------")
                }catch let error{
                    handler(nil,"Error en respuesta del servidor", response.response?.statusCode)
                    debugPrint("Response:")
                    debugPrint("--------")
                    debugPrint("Error:")
                    debugPrint(error.localizedDescription)
                }
            }else{
                handler(nil, response.error?.localizedDescription, response.response?.statusCode)
                debugPrint("Response:")
                debugPrint("--------")
                debugPrint("Error:")
                debugPrint(response.error?.localizedDescription ?? "Error no identificado")
            }
        }
    }
}
