//
//  ViewController.swift
//  DTLoadingButton
//

import UIKit
import DTLoadingButton

class ViewController: UIViewController {
    @IBOutlet fileprivate weak var button: DTLoadingButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction fileprivate func startButtonDidTouch(_ sender: UIButton) {
        self.button.startAnimating()
    }
    
    @IBAction fileprivate func stopButtonDidTouch(_ sender: UIButton) {
        self.button.stopAnimating()
    }
}

