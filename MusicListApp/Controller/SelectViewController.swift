//
//  SelectViewController.swift
//  MusicListApp
//
//  Created by 小井優太郎 on 2020/07/12.
//  Copyright © 2020 Yutaro Koi. All rights reserved.
//

import UIKit
import VerticalCardSwiper
import SDWebImage
import PKHUD
import Firebase
import ChameleonFramework

class SelectViewController: UIViewController, VerticalCardSwiperDelegate, VerticalCardSwiperDatasource {
    // 受取用の配列
    var artistNameArray = [String]()
    var musicNameArray = [String]()
    var previewUrlArray = [String]()
    var imageStringArray = [String]()
    
    var indexNumber = Int()
    var userId = String()
    var userName = String()
    
    // 右にスワイプ : 好きなものを入れる配列
    var likeArtistNameArray = [String]()
    var likeMusicNameArray = [String]()
    var likePreviewUrlArray = [String]()
    var likeImageStringArray = [String]()
    var likeArtistViewUrlArray = [String]()
    
    
    @IBOutlet weak var cardSwiper: VerticalCardSwiper!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cardSwiper.delegate = self
        cardSwiper.datasource = self
        
        cardSwiper.reloadData()

        // Do any additional setup after loading the view.
    }
    
    func numberOfCards(verticalCardSwiperView: VerticalCardSwiperView) -> Int {
        <#code#>
    }
    
    func cardForItemAt(verticalCardSwiperView: VerticalCardSwiperView, cardForItemAt index: Int) -> CardCell {
        <#code#>
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
