//
//  GitHubApiController.swift
//  comit-collection
//
//  Created by Norman Sutorius on 12.02.18.
//

import Foundation

class GitHubApiController: ApiProtocol {
    
    var rootPath: String = String()
    var responseData: Data = Data()
    
    required init(rootPath: String) {
        if !rootPath.isEmpty {
            self.rootPath = rootPath
        }
    }
    
    func get(path: String) -> Data {
//        let url = URL(string: "https://api.github.com/repos/idev4u/concourse-ci-kube/contributors")!
//        let concatTarget = rootPath + path
        let url = URL(string: rootPath + path)
        var request = URLRequest.init(url: url!)
        request.addValue("application/vnd.github.v3+json", forHTTPHeaderField: "Accept")
        
        let sema = DispatchSemaphore( value: 0 )
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            // error handling
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            guard let httpResponse = response as! HTTPURLResponse?, (200...299).contains(httpResponse.statusCode)
                else {
                    print(response.debugDescription)
                    return
            }
//            print(data?.debugDescription as Any)
            self.responseData = data!
            sema.signal()
        }
        task.resume()
        sema.wait()
        return self.responseData
    }
}
