//
//  TweetsDatasourceWebservices.swift
//  twitter_clone
//
//  Created by SI MOHAMMED Sonia-taous (Canal Plus ) on 25/07/2022.
//

import SwiftUI

class TweeetsDatasourceWebservices : ObservableObject, TweetsDatasourceService {
    func fetchDatasource(completion: @escaping ([TweetsDatasource]) -> Void) {
        
        guard let url = URL(string: "https://api.twitter.com/2/tweets?ids=1228393702244134912,1227640996038684673") else{  //impossible de créer l'url
            completion([])
            return

        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.setValue("Bearer \("AAAAAAAAAAAAAAAAAAAAAJvofAEAAAAAdJDhnPNM8pBREWSX1%2B%2BLMmUyLfI%3DrT8AXDesXtuMlwiuZ7Xmd842RhBAxLqt6qZXE9teoB99l2FX5g")", forHTTPHeaderField: "Authorization")
        
//        print("DEBUG urlReq \(urlRequest)")

        let dataTask = URLSession.shared.dataTask(with: urlRequest) {

            data, res, err in
            print("DEBUG data \(data)")

            guard let fetchData = data,

            let json = try? JSONSerialization.jsonObject(with: fetchData) as? [String: Any] ,

            let data = json["data"] as? [ [String: Any] ]
            

            else{

                DispatchQueue.main.async {
                    completion([])

                
                }

                return

            }

            print(json)

            // try? ---> si la fonction leve une exception retourne nill dans la variable json

            // any? ---> permer de tenter de caster s'il n'y arrive pas retourne nil dans la varibale json

            


            let dataObjects: [TweetsDatasource] = data.compactMap {
                obj in return TweetsDatasource(dict: obj)
           }
            
//            var dataObj = [TweetsDatasource]()
//
//            ForEach(data){ d in dataObj.append(TweetsDatasource(dict: d))
//
//            }

            
//            let dataObj : [TweetsDatasource]
           
            
//            print("DEBUG dataObject \(dataObjects)")
            print(dataObjects)
            print(data)
            // Obligatoire permet d'éxecuter le callback sur le thread principal

            DispatchQueue.main.async {

                completion(dataObjects)

            }
            

        }
        
        dataTask.resume()
        
    }
    
    
    
    
//    func fetchDatasource() -> [Any] {
//        guard let url = URL(string: "https://api.twitter.com/2/tweets?ids=1228393702244134912,1227640996038684673,1199786642791452673") else{  //impossible de créer l'url
//
//            return
//
//        }
//
//        var urlRequest = URLRequest(url: url)
//        urlRequest.setValue("Bearer \("AAAAAAAAAAAAAAAAAAAAAJvofAEAAAAAdJDhnPNM8pBREWSX1%2B%2BLMmUyLfI%3DrT8AXDesXtuMlwiuZ7Xmd842RhBAxLqt6qZXE9teoB99l2FX5g")", forHTTPHeaderField: "Authorization")
//
////        print("DEBUG urlReq \(urlRequest)")
//
//        let dataTask = URLSession.shared.dataTask(with: urlRequest) {
//
//            data, res, err in
//            print("DEBUG data \(data)")
//
//            guard let fetchData = data,
//
//            let json = try? JSONSerialization.jsonObject(with: fetchData) as? [String: Any] ,
//
//            let data = json["data"] as? [ [String: Any] ]
//
//
//            else{
//
//                DispatchQueue.main.async {
//
//
//
//                }
//
//                return
//
//            }
//
//
//
//            // try? ---> si la fonction leve une exception retourne nill dans la variable json
//
//            // any? ---> permer de tenter de caster s'il n'y arrive pas retourne nil dans la varibale json
//
//
//
//
//
//
//
//
//
//             let dataObjects: [TweetsDatasource] = data.compactMap {
//
//                obj in return TweetsDatasource(dict: obj)
//
//            }
//            print("DEBUG dataObject \(dataObjects)")
////            print(data)
//
//            // Obligatoire permet d'éxecuter le callback sur le thread principal
//
//            DispatchQueue.main.async {
//
//
//
//            }
//
//
//        }
//
//        dataTask.resume()
//        //Obligatoire ! permet de lancer de requete !
//    }
//
    
    
   
    
}


