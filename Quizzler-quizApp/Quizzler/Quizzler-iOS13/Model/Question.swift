//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by Aditya kumar on 06/04/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import Foundation

struct Question {
    let question: String
    let answer: String
    
    init(q: String, a: String){
       question = q
       answer = a
    }
      /* in quiz[] = question will replaced by q
                   answer will get replaced by a */
}
