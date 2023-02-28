//
//  user.swift
//  appFAMEX
//
//  Created by Desarrollador FAMEX on 30/11/22.
//

import Foundation

    // Mapeo de la respuesta
struct UserRespone: Decodable {
    
    let code: Int?
    let meta: Meta?
    let data: User?
    
}
// Protocolo Decodable - El objeto es capaz de decodificar la respuesta en diferentes parametros entendibles por swift
    // *NOTA: CON EL STRUCT SE DESCOMPONE LA RESPUESTA DEL SERVIDOR EN OBJETOS

struct User: Decodable {
    let id: Int?
    let user_id: Int?
    let title: String?
    let dueOn: Date?
    let status: String?
    
        // Camel case
    enum CodingKeys: String, CodingKey {
        case id
        case user_id
        case title
        case dueOn = "due_on"   // Convertir de Snake case a Camel case
        case status
    }
    
}

struct Meta: Decodable {

    
}


//  Respuesta del servidor (JSON)
/*
 // URL: https://gorest.co.in/public-api/todos/2000
 
 {
    "code":200,
    "meta":null,
    "data":{
       "id":2000,
       "user_id":4126,
       "title":"Thymbra caries votum ducimus velum corrumpo defessus tricesimus denuncio.",
       "due_on":"2023-01-01T00:00:00.000+05:30",
       "status":"completed"
    }
 }
 
*/
  
