//
//  ViewController.swift
//  api1
//
//  Created by Roaa aljohani on 09/04/1443 AH.
//

import UIKit

class activityResponse : Codable{
 var activity : [Activity] = []
}
struct Activity : Codable{
 var activity : String
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        getCharacter()
        // Do any additional setup after loading the view.
    }
    func getCharacter(){
      var urlComponent = URLComponents()
        urlComponent.scheme = "https"
          urlComponent.host = "boredapi.com"
          urlComponent.path = "/api/activity"

      let urlSession = URLSession.shared
      let URLRequest = URLRequest(url: urlComponent.url!)
      let task = urlSession.dataTask(with: URLRequest) {(data: Data?,response: URLResponse?, errore :Error?) in
        do{
      print(String(data: data!, encoding: .utf8))
        let jsonDecoder = JSONDecoder()
        let character = try jsonDecoder.decode(activityResponse.self, from: data!)
//            print(character.activity)
      }
       catch{
        print("\(error)")
       }
      }
      task.resume()
     }
    }



