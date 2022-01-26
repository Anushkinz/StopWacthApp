//
//  ViewController.swift
//  StopWacthApp
//
//  Created by anushkinz on 25/1/22.
//

import UIKit

class ViewController: UIViewController {
    

    @IBOutlet weak var stop: UIButton!
    @IBOutlet weak var pause: UIButton!
    @IBOutlet weak var start: UIButton!
    @IBOutlet weak var labelTimer: UILabel!
    @IBOutlet weak var picker: UIDatePicker!
    @IBOutlet weak var imageViewClock: UIImageView!
    
    var timer: Timer = Timer()
    var count: Int = 0
    var timerCounting: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        picker.datePickerMode = .countDownTimer
        self.view.addSubview(picker)
        
        picker.countDownDuration = 2 * 60
//        picker.addTarget(self, action: #selector(), for: .valueChanged)
        
        imageViewClock.image = UIImage(named: "clock")
        datePickerChange(paramdatePicker: picker)
        
    }
    
    func datePickerChange(paramdatePicker: UIDatePicker){
        if(paramdatePicker.isEqual(self.picker)){
            print(paramdatePicker.date)
        }
    }

    @IBAction func startBtn(_ sender: UIButton) {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerCounter), userInfo: nil, repeats: true)
    }
    
    @IBAction func pauseBtn(_ sender: UIButton) {
    }
    
    @IBAction func stopBtn(_ sender: UIButton) {
        self.count = 0
        self.timer.invalidate()
        self.labelTimer.text = self.makeTimeString(hours: 0, minutes: 0, seconds: 0)
    }
    
    @objc func timerCounter() -> Void{
        count = count + 1
        let time = secondsToHoursMinutesSeconds(seconds: count)
        let timeString = makeTimeString(hours: time.0, minutes: time.1, seconds: time.2)
        labelTimer.text = timeString
    }
    
    func secondsToHoursMinutesSeconds(seconds: Int) ->(Int,Int,Int){
        return ((seconds / 3600), ((seconds % 3600)/60),((seconds%3600)%60))
    }
    
    func makeTimeString(hours: Int, minutes: Int, seconds: Int)-> String{
        var timeString = ""
        timeString += String(format: "%02d", hours)
        timeString += " : "
        timeString += String(format: "%02d", minutes)
        timeString += " : "
        timeString += String(format: "%02d", seconds)
        timeString += " : "
        
        return timeString
    }
    
}

