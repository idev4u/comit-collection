import Foundation

let githubUser = "idev4u"
let api = GitHubApiController(rootPath: "https://api.github.com/")
let data = api.get(path: "repos/" + githubUser + "/concourse-ci-kube/contributors")

print("--------------------------------------------")

do { let json = try? JSONSerialization.jsonObject(with: data, options: [])
//    print(json as Any)
    let array = json as? [Any]
    var dict = [String:Any]()
    
    print("We have \(array!.count) contributors for idev4u/concourse-ci-kube/contributors Repo.")
//    print("array: \(String(describing: array))")
    for (index, item ) in array!.enumerated() {
        dict = (item as? [String: Any])!
        print("--------------------------------------------")
        let username = dict["html_url"] as? String
        if (username?.contains(githubUser))! {
            print("The user: \(username!)")
            print("The \(index+1) Contributor of \(array!.count) has made \(dict["contributions"]!) contributions.")
        }
        
    }
}
print("done")
