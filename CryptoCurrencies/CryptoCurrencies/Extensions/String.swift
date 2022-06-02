//
//  String.swift
//  CryptoCurrencies
//
//  Created by Zoltán Hidegkuti on 2022. 05. 18..
//

import Foundation

extension String {
    
    var removingHTMLOccurances: String {
        return self.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
    }
    
}

