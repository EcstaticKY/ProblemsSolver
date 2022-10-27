//
//  CodelandUsernameValidation.swift
//  ProblemsSolver
//
//  Created by Kanyan Zheng on 2022/9/18.
//

import Foundation

/// https://coderbyte.com/editor/Codeland%20Username%20Validation:Swift
/// Codeland Username Validation
/**
 Have the function CodelandUsernameValidation(str) take the str parameter being passed and determine if the string is a valid username according to the following rules:

 1. The username is between 4 and 25 characters.
 2. It must start with a letter.
 3. It can only contain letters, numbers, and the underscore character.
 4. It cannot end with an underscore character.
 
 If the username is valid then your program should return the string true, otherwise return the string false.
 */

func CodelandUsernameValidation(_ str: String) -> String {

    guard str.count >= 4 && str.count <= 25 else { return "false" }
    guard str.first!.isLetter else { return "false" }
    guard str.last! != "_" else { return "false" }
    
    let invalidChars = str.filter { char in
        !char.isLetter && !char.isNumber && char != "_"
    }
    guard invalidChars.isEmpty else {
        return "false"
    }
    
    return "true"
}
