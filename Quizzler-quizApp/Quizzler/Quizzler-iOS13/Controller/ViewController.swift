//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scoreLable: UILabel!
    @IBOutlet weak var questionLable: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    
   var quizBrain = QuizBrain()
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //questionLable.text = quiz[questionNumber]
        updateUI()
    }

    @IBAction func actionButtonPressed(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle! //true,false
        let userGotItRight = quizBrain.checkAnswer(userAnswer)
        
        if userGotItRight {
           // print("Right! fucker......")
            sender.backgroundColor = UIColor.green
        } else {
            //print("wrong! fucker .....")
            sender.backgroundColor = UIColor.red
        }
        /*
            questionNumber + 1 < quiz.count is used to make loop.
            so that the question never end and app will never crash.
            quiz.count=5 & questionNumber=0. in order to correct it
            questionNumber + 1 or quiz.count - 1    */
        
        quizBrain.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.3, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        
    }

    @objc func updateUI(){
        questionLable.text = quizBrain.getQuestionText()
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
        progressBar.progress = quizBrain.getProgress()
        scoreLable.text = "Score: \(quizBrain.getScore())"
    }
    
}

