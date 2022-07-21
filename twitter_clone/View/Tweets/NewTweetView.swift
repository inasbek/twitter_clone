//
//  NewTweetView.swift
//  twitter-clone
//
//  Created by Inas Bekkouche on 01/07/2022.
//

import SwiftUI
import Kingfisher

struct NewTweetView: View {
    @ObservedObject var viewModel : UploadTweetViewModel
    @Binding var isPresented : Bool
    @State var caption :String = ""
    
    init(isPresented: Binding<Bool>){
        self._isPresented = isPresented
        self.viewModel = UploadTweetViewModel(isPresented: isPresented)
    }
    
    var body: some View {
        NavigationView{
            VStack{
                HStack(alignment:.top){
                    if let user = AuthViewModel.shared.user {
                        KFImage(URL(string: user.profileImageUrl))
                            .resizable()
                            .scaledToFill()
                            .clipped()
                            .frame(width: 64, height: 64)
                            .cornerRadius(32)
                    
                    }

                    
                    TextArea("What's happening?", text: $caption)
                    
                    Spacer()
                }
                .padding()
                .navigationBarItems(leading: Button(action: {isPresented.toggle()}, label: {Text("Cancel")
                        .foregroundColor(.blue)
                }),
                trailing: Button(action: {
                    viewModel.uploadTweet(caption: caption)
//                    viewModel.uploadTweet(caption: caption){
//                        _ in isPresented.toggle()
//                    }
                }, label: {Text("Tweet")
                        .padding(.horizontal)
                        .padding(.vertical,8)
                        .background(.blue)
                        .foregroundColor(.white)
                        .clipShape(Capsule())
                }))
                Spacer()
                }
        }
    }
}

struct NewTweetView_Previews: PreviewProvider {
    static var previews: some View {
        NewTweetView(isPresented: .constant(true))
    }
}
