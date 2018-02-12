import Foundation

let api = GitHubApiController(rootPath: "https://api.github.com/")
let data = api.get(path: "repos/idev4u/concourse-ci-kube/contributors")

print("--------------------------------------------")

do { let json = try? JSONSerialization.jsonObject(with: data, options: [])
//    print(json as Any)
    let array = json as? [Any]
    var dict = [String:Any]()
    
    print("How many contributors? \(array!.count)")
//    print("array: \(String(describing: array))")
    for (index, item ) in array!.enumerated() {
        dict = (item as? [String: Any])!
        print("--------------------------------------------")
        print("The \(index+1) Contributor of \(array!.count) has made \(dict["contributions"]!) contributions.")
//        print(dict.debugDescription)
        
    }
}
print("done")
