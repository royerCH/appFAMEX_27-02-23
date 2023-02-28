//
//  NetworkingProvider.swift
//  appFAMEX
//
//  Created by Desarrollador FAMEX on 30/11/22.
//

import Foundation
import Alamofire

final class NetworkingProvider {
    
    static let shared = NetworkingProvider ()
    
    private let kBaseUrl = "https://gorest.co.in/public-api/"
    private let kStatusOk = 200...299                           // respuesta de servidor RESPUESTAS SATISFACTORIAS
    
    func getUser(id: Int, succes: @escaping (_ user: User) -> (),failure: @escaping (_ user: Error?) -> ()) {
        
        let url = "\(kBaseUrl)todos/\(id)"

        AF.request(url, method: .get).validate(statusCode: kStatusOk).responseDecodable (of: UserRespone.self, decoder: DateDecoder()) { response in
            
            if let user = response.value?.data {
                
                print(user)
                succes(user)
                
            } else {
                failure(response.error)
            }
            
        }
        
        // Metodo: request de Alamofire
            // convertible - URL del servicio web
            // method - Metodos Http (get, post, delete, put, etc)
            // parameter - Parametros si se desea enviar algo al servidor.
            // encoder - Tipo de encoding
            // header - tipo de cabecera
            // interceptor -
            // requestModifier -
            //          *BORRAR si no se ocupa algun parametro (parametros opcionales)
        
        // Metodo: validate
            // Para validar que se realizo correctamente la conexion al servidor
        
        // Metdo: response
            // Capturar la respuesta del servidor
        
    }
    
}
