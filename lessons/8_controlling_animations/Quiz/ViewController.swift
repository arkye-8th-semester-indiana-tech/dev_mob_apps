//
//  ViewController.swift
//  Quiz
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var answerLabel: UILabel!
    
    let questions: [String] = [ "From what is cognac made?",
                                "What is 7+7?",
                                "What is the capital of Vermont?" ]
    
    let answers: [String] = [ "Grapes",
                              "14",
                              "Montpelier" ]
    
    var currentQuestionIndex: Int = 0

    @IBAction func showNextQuestion(sender: AnyObject) {
        ++currentQuestionIndex
        if currentQuestionIndex == questions.count {
            currentQuestionIndex = 0
        }
        
        let question: String = questions[currentQuestionIndex]
        questionLabel.text = question
        answerLabel.text = "???"
        
        animateLabelTransitions()
    }
    
    @IBAction func showAnswer(sender: AnyObject) {
        let answer: String = answers[currentQuestionIndex]
        answerLabel.text = answer
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        questionLabel.text = questions[currentQuestionIndex]
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        // Set the label's initial alpha
        questionLabel.alpha = 0
    }
    
    func animateLabelTransitions() {
        
        // Animate the alpha
        UIView.animateWithDuration(0.5, animations: {
            self.questionLabel.alpha = 1
        })
    }
}