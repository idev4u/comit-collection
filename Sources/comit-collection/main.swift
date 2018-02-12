import Foundation

let api = GitHubApiController(rootPath: "https://api.github.com/")
let data = api.get(path: "repos/idev4u/concourse-ci-kube/contributors")

do { let jsonDict = try JSONSerialization.jsonObject(with: data, options: [])
    print("\(jsonDict)")
} catch {
    print(error.localizedDescription)
}

print("done")
