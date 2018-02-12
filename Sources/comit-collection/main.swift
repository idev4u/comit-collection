import Foundation
print("Hello, world!")

let url = URL(string: "https://api.github.com/repos/idev4u/concourse-ci-kube/contributors")!
var request = URLRequest.init(url: url)
request.addValue("application/vnd.github.v3+json", forHTTPHeaderField: "Accept")

var sema = DispatchSemaphore( value: 0 )

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
    
    let data = data
//    let string = String(data: data!, encoding: .utf8)
//    print(string as Any)
    do { let jsonDict = try JSONSerialization.jsonObject(with: data!, options: [])
        print("\(jsonDict)")
        sema.signal()
    } catch {
       print(error.localizedDescription)
    }
}
task.resume()

sema.wait()

print("done")
