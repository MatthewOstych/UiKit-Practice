//
//  ViewController.swift
//  UIButton
//
//  Created by Mathew Lantsov on 23.02.2024.
//
//
import UIKit

class ViewController: UIViewController {

    var count = 0
    
    var timer = Timer()
    var timerLabel = UILabel()
    var timerStartButton = UIButton()
    var pauseButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addTimerLabel()
        addTimerStartButton()
        
    }
    //MARK: - Add View Funcs
    
    func pauseButtonAdd() {
        pauseButton.setTitle("Pause", for: .normal)
        pauseButton.backgroundColor = .systemGray
        pauseButton.layer.cornerRadius = 16
        pauseButton.frame = CGRect(
            x: 0,
            y: 0,
            width: 100, height: 30)
        pauseButton.center.x = self.view.center.x
        pauseButton.center.y = self.view.center.y + 150
        pauseButton.addTarget(self, action: #selector(pauseTimer), for: .touchUpInside)
        self.view.addSubview(pauseButton)
        
    }
    
    func addTimerLabel() {
        timerLabel.text = "00"
        timerLabel.font = UIFont.boldSystemFont(ofSize: 32)
        timerLabel.frame = CGRect(
            x: 0,
            y: 0,
            width: 300, height: 30)
        timerLabel.center = self.view.center
        
        self.view.addSubview(timerLabel)
        timerLabel.textAlignment = .center
    }
    
    func addTimerStartButton() {
        timerStartButton.setTitle("Start", for: .normal)
        timerStartButton.backgroundColor = .black
        timerStartButton.frame = CGRect(
            x: 0,
            y: 0,
            width: 100, height: 30)
        timerStartButton.center.y = self.view.center.y + 100
        timerStartButton.center.x = self.view.center.x
        timerStartButton.layer.cornerRadius = 16
        timerStartButton.addTarget(self, action: #selector(startTimer), for: .touchUpInside)
        self.view.addSubview(timerStartButton)
        
    }
    
    
    //MARK: - Other Fucs
    @objc func startTimer() {
        timer.invalidate()
        count = 0
        timerLabel.text = "00"
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        timerStartButton.setTitle("Stop", for: .normal)
        timerStartButton.addTarget(self, action: #selector(stopTimer), for: .touchUpInside)
        pauseButtonAdd()
        pauseButton.isHidden = false
    }
    
    @objc func updateTimer() {
        
        count += 1
        timerLabel.text = "\(count)"
    }

    
    @objc func stopTimer() {
        timer.invalidate()
        timer.invalidate()
        pauseButton.isHidden = true
        timerStartButton.setTitle("Start", for: .normal)
        timerStartButton.addTarget(self, action: #selector(startTimer), for: .touchUpInside)
    }
    
    @objc func pauseTimer() {
        
        timer.invalidate()
        pauseButton.backgroundColor = .systemBlue
        pauseButton.setTitle("Resume", for: .normal)
        pauseButton.removeTarget(self, action: #selector(pauseTimer), for: .touchUpInside)
        pauseButton.addTarget(self, action: #selector(resumeTimer), for: .touchUpInside)
    }
    
    @objc func resumeTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        pauseButton.setTitle("Pause", for: .normal)
        pauseButton.removeTarget(self, action: #selector(resumeTimer), for: .touchUpInside)
        pauseButton.addTarget(self, action: #selector(pauseTimer), for: .touchUpInside)

    }
}

