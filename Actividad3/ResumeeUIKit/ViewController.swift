//
//  ViewController.swift
//  ResumeeUIKit
//
//  Created by José Alberto Rocha Munguía on 04/02/26.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var experienciaLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        contactoView.isHidden = true
    }

    @IBAction func sliderChanged(_ sender: UISlider) {
        let valor = Int(sender.value)
        experienciaLabel.text = "\(valor)"
    }
    
    @IBAction func contactoButtonTapped(_ sender: UIButton) {
        contactoView.isHidden.toggle()
    }

    
    @IBOutlet weak var contactoView: UIView!

}
