//
//  ViewController.swift
//  Task Time Record
//
//  Created by Keiji Suzuki on 2023-02-28.
//

import UIKit
import AVFoundation

class RecordViewController: UIViewController {

	
	@IBOutlet var playButton: UIButton!
	@IBOutlet var startDateTimeLabel: UILabel!
	@IBOutlet var timerLabel: UILabel!
	@IBOutlet var elapsedTimeLabel: UILabel!
	@IBOutlet var taskComboButton: UIButton!	
	private var taskTimer:Timer?
	private var elappsedTime: Int = 0
	private var soundPlayer: AVAudioPlayer? 
	private var startDateTime: Date?

	enum TimerState {
		case start, running, pause
	}
	
	var timerState:TimerState = .start
	
	override func viewDidLoad() {
		startDateTimeLabel.text = "Year/Month/Day 00:00:00"
		super.viewDidLoad()
	}

	override func viewWillAppear(_ animated: Bool) {	
	}
	
	@IBAction func tappedTimerButton() {
		buttonSoundPlay()
		switch(self.timerState) {
		case .start :
			setStartDateTime()
			runTimer()
			break
		case .running :
			pauseTimer()
			break
		case .pause: 
			runTimer()			
			break
		}
		
	}
	
	private func setStartDateTime() {
		startDateTime = Date()
		let dateFormatter = DateFormatter()
		dateFormatter.dateFormat = "YYYY/MM/dd(E) HH:mm:ss"
		startDateTimeLabel.text = dateFormatter.string(from: startDateTime!)
		startDateTimeLabel.isHidden = false		
	}
	
	private func runTimer() {
		self.timerState = .running
//		timerLabel.text = "PAUSE"
		let image = UIImage(named: "playButton")			
		let state = UIControl.State.normal
		playButton.setImage(image, for: state)
		
		self.taskTimer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true)  { _ in			
			self.elappsedTime += 1
			let hh = self.elappsedTime / 3600
			let mm = (self.elappsedTime % 3600) / 60
			let ss = self.elappsedTime % 60
			self.elapsedTimeLabel.text = String(format: "%02d:%02d:%02d", hh, mm, ss)			
		}		
	}
	
	private func pauseTimer() {
		self.timerState = .pause
//		timerLabel.text = "START"
		let image = UIImage(named: "stopButton")			
		let state = UIControl.State.normal
		playButton.setImage(image, for: state)

		self.taskTimer!.invalidate()
	}
	
	private func buttonSoundPlay() {
		soundPlayer = try! AVAudioPlayer (data: NSDataAsset(name: "buttonSound")!.data)
		soundPlayer!.play()
	}

}
