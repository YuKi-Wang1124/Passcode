//
//  ViewController.swift
//  Passcode
//
//  Created by 王昱淇 on 2021/10/10.
//

import UIKit
import LocalAuthentication


var correctPasscode = "1234"

class ViewController: UIViewController {
 
    var enterPasscode = ""
    
    @IBOutlet weak var wrongImageView: UIImageView!
    @IBOutlet weak var enterPasscodeLabel: UILabel!
    @IBOutlet var passcodeBackgroundImageView: [UIImageView]!
    @IBOutlet var passcodeImageView: [UIImageView]!
    @IBOutlet var numberButtons: [UIButton]!
    @IBOutlet weak var changePasscodeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        reset()
    }
    
    @IBAction func enterPasscode(_ sender: UIButton) {
        if enterPasscode.count != 4 {
            if let inputNumber = sender.currentTitle {
                enterPasscode.append(contentsOf: inputNumber)
            }
        }
        imageChange()
    }
    
    @IBAction func dropLast(_ sender: Any) {
        if enterPasscode.count != 0 {
            enterPasscode = String(enterPasscode.dropLast(1))
            imageChange()
        }
    }
    
    @IBAction func reset(_ sender: Any) {
        reset()
    }
    
    func reset() {
        wrongImageView.image = UIImage(named: "？")
        enterPasscodeLabel.text = "輸入密碼"
        enterPasscode = ""
        for i in 0...3 {
            passcodeImageView[i].isHidden = true
            passcodeBackgroundImageView[i].isHidden = false
        }
        changePasscodeButton.isEnabled = false
    }
    
    func checkPasscode() {
        if enterPasscode == correctPasscode {
            enterPasscodeLabel.text = "密碼正確 咖波開心～"
            let boka1AnimatedImage = UIImage.animatedImageNamed("gif-", duration: 3)
            wrongImageView.image = boka1AnimatedImage
            
            let alertController = UIAlertController(title: "密碼正確", message: "咖波開心～", preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "OK!", style: .default)
            alertController.addAction(alertAction)
            present(alertController, animated: true, completion: nil)
            changePasscodeButton.isEnabled = true
        } else {
            enterPasscodeLabel.text = "密碼錯誤 咖波哭哭～"
            wrongImageView.image = UIImage(named: "cry")
            let alertController = UIAlertController(title: "密碼錯誤", message: "咖波哭哭～", preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "再試一次!", style: .default) {
                (_) in self.reset()
            }
            alertController.addAction(alertAction)
            present(alertController, animated: true, completion: nil)
        }
    }

    func imageChange() {
        switch enterPasscode.count {
        case 1:
            for i in 0...3 {
                passcodeImageView[i].isHidden = true
                 if i < 1 {
                    passcodeImageView[i].isHidden = false
                }
            }
        case 2:
            for i in 0...3 {
                passcodeImageView[i].isHidden = true
                if i < 2 {
                    passcodeImageView[i].isHidden = false
                }
            }
          
        case 3:
            for i in 0...3 {
                passcodeImageView[i].isHidden = true
                if i < 3 {
                    passcodeImageView[i].isHidden = false
                }
            }
        case 4:
            for i in passcodeImageView {
                i.isHidden = false
            }
            checkPasscode()
        default:
            reset()
        }
   
        
    }
}
