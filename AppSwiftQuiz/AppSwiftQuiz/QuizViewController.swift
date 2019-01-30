//
//  QuizViewController.swift
//  AppSwiftQuiz
//
//  Created by Lorena Rodrigues on 30/01/19.
//  Copyright © 2019 Lorena Rodrigues. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController {

    @IBOutlet weak var viTimer: UIView!
    @IBOutlet weak var lbQuestion: UILabel!
    @IBOutlet var btAnswer: [UIButton]!

    let quizManager = QuizManager()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        viTimer.frame.size.width = view.frame.size.width
        UIView.animate(withDuration: 60.0, delay: 0, options: .curveLinear, animations: {
            self.viTimer.frame.size.width = 0
        }) { (success) in
            self.showResults()
        }

        getNewQuiz()

    }

    func showResults() {
        performSegue(withIdentifier: "resultSegue", sender: nil)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let resultViewController = segue.destination as! ResultViewController
        resultViewController.totalAnswers = quizManager.totalAnswers
        resultViewController.totalCorrectAnswers = quizManager.totalCorrectAnswers
    }

    func getNewQuiz() {
        quizManager.refreshQuiz()
        lbQuestion.text = quizManager.question
        for i in 0..<quizManager.options.count {
            let option = quizManager.options[i]
            let button = btAnswer[i]
            button.setTitle(option, for: .normal)
        }
    }

    @IBAction func selectAnswer(_ sender: UIButton) {
        let index = btAnswer.index(of: sender)!
        quizManager.validateAnswer(index: index)
        getNewQuiz()

    }
    


}
