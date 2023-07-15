//
//  AuthManager.swift
//  WhatsappClone
//
//  Created by Basheer Abdulmalik on 15/07/2023.
//

import Foundation
import FirebaseAuth

final class AuthManager {
    static let shared = AuthManager()
    private let auth = Auth.auth()
    
    public func authenticateUser(phoneNumber: String, completion: @escaping (Bool) -> Void) {
        PhoneAuthProvider.provider().verifyPhoneNumber(phoneNumber, uiDelegate: nil) {
            verificationID, error in
            guard error == nil,
                  let verificationID = verificationID else {
                completion(false)
                return
            }
            
            UserDefaults.standard.set(verificationID, forKey: "phoneVerificationID")
            completion(true)
        }
    }
    
    
    public func verifySMSCode(SMSCode: String, completion: @escaping (Bool) -> Void) {
        guard let verificationID = UserDefaults.standard.string(forKey: "phoneVerificationID") else {
            completion(false)
            return
        }
        
        let credential = PhoneAuthProvider.provider().credential(withVerificationID: verificationID, verificationCode: SMSCode)
        auth.signIn(with: credential) {
            results, error in
            guard error == nil else {
                completion(false)
                return
            }
            
            completion(true)
        }
    }
}
