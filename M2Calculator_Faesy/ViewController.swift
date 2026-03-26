//
//  ViewController.swift
//  M2Calculator_Faesy
//
//  Created by Faesy, Bradley C. on 1/27/26.
//

import UIKit

class ViewController: UIViewController {

	@IBOutlet weak var operand1TextField: UITextField!
	@IBOutlet weak var operand2TextField: UITextField!
	@IBOutlet weak var selectOperator: UIButton!
	
	var selectedOperrator: Operrator?
	
	@IBAction func operatorButton(_ sender: Any) {
		let actionSheet = UIAlertController(title: nil, message: nil, preferredStyle:.alert)
				
		let plusAction = UIAlertAction(title: "+(plus)", style: .default) { _ in
			self.selectOperator.setTitle("+", for: .normal)
			self.selectedOperrator = .plus
		}
		actionSheet.addAction(plusAction)
		
		let minusAction = UIAlertAction(title: "-(minus)", style: .default) { _ in
			self.selectOperator.setTitle("-", for: .normal)
			self.selectedOperrator = .minus
		}
		actionSheet.addAction(minusAction)
		
		let multiplyAction = UIAlertAction(title: "*(multiply)", style: .default) { _ in
			self.selectOperator.setTitle("*", for: .normal)
			self.selectedOperrator = .multiply
		}
		actionSheet.addAction(multiplyAction)
		
		let divideAction = UIAlertAction(title: "/(divide)", style: .default) { _ in
			self.selectOperator.setTitle("/", for: .normal)
			self.selectedOperrator = .divide
		}
		actionSheet.addAction(divideAction)
		
		present(actionSheet, animated: true)
		
	}
	@IBOutlet weak var resultLabel: UILabel!
	
	func showAlert(message: String, title: String? = "Alert"){
		let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
		let okAction = UIAlertAction(title: "OK", style: .default)
		alert.addAction(okAction)
		present(alert, animated: true)
	}
	
	@IBAction func resultButton(_ sender: Any) {
		guard let op1 = operand1TextField.text, let a = Int(op1) else{
			operand1TextField.becomeFirstResponder()
			showAlert(message: "Please enter a number.", title: "op1 Error")
			return
		}
		guard let op2 = operand2TextField.text, let b = Int(op2) else{
			operand2TextField.becomeFirstResponder()
			showAlert(message: "Please enter a number.")
			return
		}
		guard let op = selectedOperrator else{
			showAlert(message: "Please select an operator.")
			return
		}
		
		var result: Int? = nil
		switch op {
		case .plus:
			result = a + b
		case .minus:
			result = a - b
		case .multiply:
			result = a * b
		case .divide:
			result = a / b
		}
		guard let result = result else{
			return
		}
		resultLabel.text = "\(result)"
		
		if operand1TextField.isFirstResponder{
			operand1TextField.resignFirstResponder()
		}else{
			operand2TextField.resignFirstResponder()
		}
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
	}
	
	override func viewDidAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		operand1TextField.becomeFirstResponder( )
	}
}
