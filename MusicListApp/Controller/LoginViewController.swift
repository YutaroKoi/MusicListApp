//
//  LoginViewController.swift
//  MusicListApp
//
//  Created by 小井優太郎 on 2020/05/14.
//  Copyright © 2020 Yutaro Koi. All rights reserved.
//

import UIKit
// 新規登録でデータベースにユーザー情報登録するので必要
import Firebase
import FirebaseAuth
import DTGradientButton

class LoginViewController:
    UIViewController, UITextFieldDelegate {

    
    
    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textField.delegate = self

        // ボタンの背景色をきれいにする
        let buttonColors = [UIColor(hex: "#E21F70"), UIColor(hex: "FF4D2C")]
        loginButton.setGradientBackgroundColors(buttonColors, direction: .toBottom, for: .normal)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    @IBAction func login(_ sender: Any) {
        // ユーザー名が入力されていれば保存処理を走らせる / 空なら振動させる
        if textField.text?.isEmpty == false {
            UserDefaults.standard.set(textField.text, forKey: "userName")
        } else {
            let generator = UINotificationFeedbackGenerator()
            generator.notificationOccurred(.error)
            print("振動")
        }
        
        // FireBaseAuthの中にIDと名前を入れる(Anonymouslyは匿名なので、匿名認証の関数を呼び出している)
        Auth.auth().signInAnonymously { (result, error) in
            if error == nil {
                // 早期リターンっぽい感じでresult?.userがnilならreturnして処理を終了する
                // 後続処理は走らない
                guard let user = result?.user else { return }
                let userId = user.uid
                UserDefaults.standard.set(userId, forKey: "userId")
                
                let saveProfile = SaveProfile(snapShot: <#T##DataSnapshot#>)
            } else {
                print(error?.localizedDescription as Any)
            }
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
