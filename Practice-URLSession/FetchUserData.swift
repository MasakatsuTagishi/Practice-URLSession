//
//  FetchUserData.swift
//  Practice-URLSession
//
//  Created by 田岸将勝 on 2022/05/13.
//

import Foundation

class FetchUserData {

    func getUserDataFromGithubAPI(completion: @escaping (User) -> Void) {
        var user: User = User(id: 0, name: "")
        let requestUrl = URL(string: "http://api.github.com/users/MasakatsuTagishi")!
        let task = URLSession.shared.dataTask(with: requestUrl) { data, response, error in
            if let error = error {
                print("error", error)
            } else if let data = data {
                let decoder = JSONDecoder()
                do {
                    let decoded = try decoder.decode(User.self, from: data)
                    user = decoded
                    completion(user)
                } catch {
                    print("error")
                }
            }
        }
        task.resume()
    }

}
