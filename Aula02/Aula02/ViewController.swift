//
//  ViewController.swift
//  Aula02
//
//  Created by Adalto Selau Sparremberger on 07/08/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var sliderRed: UISlider!
    @IBOutlet weak var sliderGreen: UISlider!
    @IBOutlet weak var sliderBlue: UISlider!
    
    @IBOutlet weak var lblAceitaEmail: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func aceitaEmail(_ sender: UISwitch) {
    //    let meuSwitch:UISwitch = sender as! UISwitch
        if( sender.isOn ) {
            lblAceitaEmail.textColor = .green
        }else{
            lblAceitaEmail.textColor = .red
        }
        
    }
    
    @IBAction func redAlterar(_ sender: Any) {
        alterarCor()
    }
    
    @IBAction func greenAlterar(_ sender: Any) {
        alterarCor()
    }
    @IBAction func blueAlterar(_ sender: Any) {
        alterarCor()
    }
    
    func alterarCor() {
        let red = Float( sliderRed.value )
        let green = Float( sliderGreen.value )
        let blue = Float( sliderBlue.value )
        self.view.backgroundColor = UIColor(red: CGFloat(red), green: CGFloat(green), blue: CGFloat(blue), alpha: CGFloat(1.0))
        
        
    }
    

}

