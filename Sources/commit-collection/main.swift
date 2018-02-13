import Foundation

let githubUser = "idev4u"
let githubRepo = "concourse-ci-kube"
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

//---------


let commitData = api.get(path: "repos/"+githubUser+"/"+githubRepo+"/commits")

do { let json = try? JSONSerialization.jsonObject(with: commitData, options: [])
    //    print(json as Any)
    let array = json as? [Any]
    var dict = [String:Any]()
    //    print("array: \(String(describing: array))")
    for (index, item ) in array!.enumerated() {
        dict = (item as? [String: Any])!
        print("--------------------------------------------")
//        print("\(dict.debugDescription)")
//        print("commit-key: \(String(describing: dict["commit"]))")
        let authorDict = (dict["commit"] as? [String: Any])!
//        print("commit-author: \(String(describing: authorDict["author"]))")
        let authorNameDict = (authorDict["author"] as? [String: Any])!
        print("commit-author: \(String(describing: authorNameDict["name"]!))")
        print("commit-email: \(String(describing: authorNameDict["email"]!))")
        print("commit-message: \(String(describing: authorDict["message"]!))")
        print("commit url: \(String(describing: authorDict["url"]!))")
        print("commit-sha: \(String(describing: dict["sha"]!))")
    }
}

print("done")
