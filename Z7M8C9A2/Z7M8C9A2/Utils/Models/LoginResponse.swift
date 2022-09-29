//
//  LoginResponse.swift
//  Z7M8C9A2
//
//  Created by David Lopez on 29/09/22.
//

import Foundation

// MARK: - LoginResponse
class LoginResponse: Codable {
    let success: Bool?
    let mensaje: String?

    init(success: Bool?, mensaje: String?) {
        self.success = success
        self.mensaje = mensaje
    }
}
