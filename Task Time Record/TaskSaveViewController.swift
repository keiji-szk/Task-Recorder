//
//  TaskSaveViewController.swift
//  Task Time Record
//
//  Created by Keiji Suzuki on 2023-03-05.
//

import UIKit

class TaskSaveViewController: UIViewController {

	@IBOutlet var hoursDatePicker: UIDatePicker!
	@IBOutlet var hoursLabel: UILabel!
	
	override func viewDidLoad() {
        super.viewDidLoad()
//		hoursDatePicker.isHidden = true
//		let hoursLabelTappedAction = UITapGestureRecognizer(target: self, action: #selector(TaskSaveViewController.tappedHours))
//		hoursLabel.addGestureRecognizer(hoursLabelTappedAction)
	}
	
	@IBAction func editEndHours(_ sender: Any) {
		print("Editing end")
	}
	
//	@objc func tappedHours(sender:UITapGestureRecognizer) {
//		UIView.animate(withDuration: 0.3, animations: {
//			self.hoursLabel.isHidden.toggle()
//			self.hoursDatePicker.isHidden.toggle()			
//		})
//	}
	

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
