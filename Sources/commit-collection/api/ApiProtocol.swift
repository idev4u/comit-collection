//
//  ApiProtocol.swift
//  comit-collection
//
//  Created by Norman Sutorius on 12.02.18.
//

import Foundation

protocol ApiProtocol {
    
    init(rootPath: String)
    
    func get(path: String) -> Data
}
