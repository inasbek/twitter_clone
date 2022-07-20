//
//  AuthViewModel.swift
//  twitter-clone
//
//  Created by Inas Bekkouche on 01/07/2022.
//

import SwiftUI
//import Firebase
class AuthViewModel: ObservableObject {
    
//    @Published var userSession: FirebaseAuth.User?
//    @Published var isauthentificated = false
//    @Published var error = Error?
//    @Published var user: User?
    
//    init(){
//        userSession = Auth.auth().currentUser
//          fetchUser()
//    }
    
    
    func login(withEmail email: String, password: String) {
//        Auth.auth().signIn(withEmail email: String, password: String){
//            result, error in
//            if let error = error{
//                print("DEBUG: Failed to login : \(error.localizeddescription)")
//                return
//            }
//        self.userSession = result?.user
//            print("DEBUG: Successfully loged in !")
//        }
        
    }
    
    func register(email:String, password:String,username:String,fullname:String, profileImage:UIImage) {
        
//
//        guard let imageData = profileImage.jpegData(compressionQuality: 0.3) else { return }
//        let filename = NSUUID().uuidString
//        let storageRef = Storage.storage().reference().child(filename)
//
//        storageRef.putData(imageData, metadata: nil){ _,error in
//            if let error = error {
//                print("DEBUG: Failed to upload image : \(error.localizeddescription)")
//                return
//            }
        
//                print("DEBUG: successfully uploaded user photo ! \(error.localizeddescription)")

//
//            storageRef.downloadURL {url, _ in
//                guard let profileImageUrl = url?.absoluteString else { return }
//
//                Auth.auth().createUser(withEmail: email, password: password) {
//                    result, error in if let error = error {
//                        print("DEBUG: Error \(error.localizeddescription)")
//                        return
//                    }
        
//        guard let user = result?.user else { return }
//        let data = ["email":email,
//                    "username":username.lowercased(),
//                    "fullname":fullname,
//                    "profileImageUrl":profileImageUrl,
//                    "uid":user.uid]
//
//        Firestore.firestore().collection("users").document(user.uid).setData(data) {
//            _ in self.userSession = user
//        print("DEBUG: Successfully uploaded user data !")
//        }
//
//
//                    print("DEBUG: Successfully signed up user !")
//
//                }
//            }
//
//        }
        
        
        
//        print("DEBUG: Email is \(email)")
//        print("DEBUG: Password is \(password)")
        


    }
    
    
//    func signout(){
//        userSession = nil
//        try? Auth.auth.signOut()
//    }
    
//    func fetchUser(){
//        guard let uid = userSession?.uid else { return }
//
//        Firestore.firestore().collection("users").document(uid).getDocument { snapshot, _ in let user = User(dictionary: data)}
//        print("DEBUG: User is \(user.username)")
//    }
    
    
    
}


