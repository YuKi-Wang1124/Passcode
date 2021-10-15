//
//  changePasscodeViewController.swift
//  Passcode
//
//  Created by 王昱淇 on 2021/10/14.
//

import UIKit

class changePasscodeViewController: UIViewController {

    @IBOutlet weak var newPasscodeTextField: UITextField!
    @IBOutlet weak var confirmNewPasscodeTextField: UITextField!
    @IBOutlet weak var wrongPasscodeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
       
    }
    
    @IBAction func closeKeyboard(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction func confirmNewPasscode(_ sender: UITextField) {
        if newPasscodeTextField.text! == sender.text! {
            wrongPasscodeLabel.text = "兩次輸入密碼相同"
            wrongPasscodeLabel.textColor = .systemTeal
        } else {
            wrongPasscodeLabel.text = "兩次輸入不同"
            wrongPasscodeLabel.textColor = .red
        }
    }
    

    
    func reset() {
        newPasscodeTextField.text = ""
        confirmNewPasscodeTextField.text = ""
        view.endEditing(true)
    }
    
    @IBAction func changePasscode(_ sender: Any) {
        if newPasscodeTextField.text! == confirmNewPasscodeTextField.text! {
            correctPasscode = newPasscodeTextField.text!
            let alertController = UIAlertController(title: "密碼更改成功", message: "已更新密碼", preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "確認", style: .default) {
                (_) in self.reset()
            }
            alertController.addAction(alertAction)
            present(alertController, animated: true, completion: nil)
        } else {
            let alertController = UIAlertController(title: "兩次輸入不同", message: "請再次確認", preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "再試一次", style: .default) {
                (_) in self.reset()
            }
            alertController.addAction(alertAction)
            present(alertController, animated: true, completion: nil)
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
