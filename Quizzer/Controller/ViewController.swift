//
//  ViewController.swift
//  Quizzer
//
//  Created by Arif Celebi on 19.04.2023.
//

import UIKit

class ViewController: UIViewController {

   
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var trueButton: UIButton!
    
    @IBOutlet weak var falseButton: UIButton!
    
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBOutlet weak var timeProgressBar: UIProgressView!
    
    
    
    
    var quizBrain =  QuizBrain()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUi()
        
        
    }
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle! // True , False
        
        let userGotItRight = quizBrain.checkAnswer(userAnswer) //quizbrain deki useranswer func çağırılıyor
        
        
        
        if userGotItRight {   // quizBrain.checkAnswer(sender.currentTitle!)
            
            sender.backgroundColor = UIColor.green
            
        }else{
            
            sender.backgroundColor = UIColor.red
            
            
        }
        
        quizBrain.nextQuestion()
        
        
        Timer.scheduledTimer(timeInterval: 0.3, target: self, selector: #selector(updateUi), userInfo: nil, repeats: false)
        
    }
    @objc func updateUi (){
        
        if questionLabel == nil {
            
            return
        }
        
        questionLabel.text = quizBrain.getQuestionText()
        timeProgressBar.progress = quizBrain.getProgress()
        scoreLabel.text = "Score \(quizBrain.getScore())"
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
        questionLabel.textColor = .black
        scoreLabel.textColor = .purple
        
        
        
    }
    
}

