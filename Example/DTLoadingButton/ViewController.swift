//
//  ViewController.swift
//  DTLoadingButton
//

import UIKit
import DTLoadingButton

class ViewController: UIViewController {
    @IBOutlet private weak var button: DTLoadingButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction private func startButtonDidTouch(sender: UIButton) {
        self.button.startAnimating()
    }
    
    @IBAction private func stopButtonDidTouch(sender: UIButton) {
        self.button.stopAnimating()
    }
}

