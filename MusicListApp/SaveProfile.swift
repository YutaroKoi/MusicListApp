//
//  SaveProfile.swift
//  MusicListApp
//
//  Created by 小井優太郎 on 2020/05/26.
//  Copyright © 2020 Yutaro Koi. All rights reserved.
//

import Foundation
import Firebase
// Swift製のインディケーターライブラリ
// HUDライブラリとしては、SVProgressHUDがポピュラーだが、スター数はPKHUDのほうが多い
import PKHUD

class SaveProfile {
    // サーバーに飛ばす値のプロパティ
    var userId:String! = ""
    var userName:String! = ""
    // 空を許さない
    var ref:DatabaseReference!
    
    init(userId:String, userName:String) {
        self.userId = userId
        self.userName = userName
        
        // ログインのときに拾えるuidを先頭につけて送信する。受信するときもuidから引っ張ってくる
        ref = Database.database().reference().child("profile").childByAutoId()
    }
    
    init(snapShot:DataSnapshot) {
        ref = snapShot.ref
        if let value = snapShot.value as? [String:Any] {
            userId = value["userId"] as? String
            userName = value["userName"] as? String
        }
    }
    
    func toContents()->[String:Any] {
        return ["userId":userId!,"userName":userName as Any]
    }
    
    func saveProfile() {
        ref.setValue(toContents())
        UserDefaults.standard.set(ref.key, forKey: "autoId")
    }
}
