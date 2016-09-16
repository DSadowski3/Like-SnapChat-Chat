//
//  User.swift
//  MuttyChat
//
//  Created by Dominik Sadowski on 9/15/16.
//  Copyright © 2016 Dominik Sadowski. All rights reserved.
//

import Foundation

struct User {
    
    private var _firstName: String
    private var _uid: String
    
    var uid: String {
        return _uid
    }
    
    var firstName: String {
        return _firstName
    }
    
    init(uid: String, firstName: String) {
        _uid = uid
        _firstName = firstName
    }
}
