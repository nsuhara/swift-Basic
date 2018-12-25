//
//  ViewController.swift
//  swift-Basic
//
//  Created by nsuhara on 2018/11/16.
//  Copyright © 2018 nsuhara. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var textName: UITextField!
    @IBOutlet weak var buttonGetResult: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // Settings for keyboard operation.
        self.textName.delegate = self
    }

    // Initialization at screen transition.
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.textName.text = ""
    }

    // Check whether the screen transition condition is satisfied.
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == "segueGetResult" {
            guard self.textName.text != "" else {
                let objAlertController = UIAlertController(title: "エラー", message: "もっと想い浮かべてみてよ!", preferredStyle: .alert)
                let objAlertAction = UIAlertAction(title: "はい、分かりました。", style: .default, handler: nil)
                objAlertController.addAction(objAlertAction)
                self.present(objAlertController, animated: true, completion: nil)

                return false
            }
        }
        return true
    }

    // Prepare for screen transition.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Check value of segue.identifier.
        guard let identifier = segue.identifier else {
            return
        }
        // Execute only "segueGetResult" events.
        if identifier == "segueGetResult" {
            // Init ResultViewController.
            let objResultViewController = segue.destination as! ResultViewController
            objResultViewController.textName = self.textName.text!
        }
    }

    // Keyboard operation.
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.buttonGetResult.sendActions(for: .touchUpInside)
        return true
    }

    // Process to hide the keyboard.
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

}

