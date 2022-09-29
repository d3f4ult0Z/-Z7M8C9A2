//
//  RegisterResponse.swift
//  Z7M8C9A2
//
//  Created by Montse Contreras on 29/09/22.
//

import Foundation

import Foundation

// MARK: - RegisterResponse
class RegisterResponse: Codable {
    let success: Bool?
    let mensaje: String?

    init(success: Bool?, mensaje: String?) {
        self.success = success
        self.mensaje = mensaje
    }
}
