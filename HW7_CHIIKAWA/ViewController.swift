//
//  ViewController.swift
//  HW7_CHIIKAWA
//
//  Created by Kate Yeh on 2025/3/4.
//

import UIKit
import AVKit
import AVFoundation


class ViewController: UIViewController {
        
    
    //生成一個影片循環播放器，用來重複播放
    var videoLooper: AVPlayerLooper?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //加入影片播放器(含遮罩效果)
        setupVideoPlayer()
        //加入漸層背景
        setupGradientBackground()
        //加入Usagi按鈕
        addUsagiButton()
        //加入Chii按鈕
        addChiiButton()
        //加入Hachi按鈕
        addHachiButton()
    }
    
    
    //影片播放器(含遮罩效果)
    func setupVideoPlayer(){
        //找出專案裡的影片素材
        let videoUrl = Bundle.main.url(forResource: "Chiikawa", withExtension: "mp4")!
        //建立一個AVQueuePlayer來播放影片
        let videoPlayer = AVQueuePlayer()
        //將影片檔案轉成AVPlayerItem用來播放影片
        let videoItem = AVPlayerItem(url: videoUrl)
        //建立AVPlayerLooper來重複播放影片
        videoLooper = AVPlayerLooper(player: videoPlayer, templateItem: videoItem)
        
        
        //載入mask圖作為影片遮罩(圖片要去背啦Ｑ)
        let maskImage = UIImage(named: "CHIIKAWA.png")
        //建立UIImageView來show出mask圖
        let maskImageView = UIImageView(image: maskImage)
        //設定圖的尺寸大小
        let maskSize = CGSize(width: 874, height: 402)
        maskImageView.frame = CGRect(x: 0, y: 0, width: maskSize.width, height: maskSize.height)
        
        
        //建立一個UIView作為影片的容器，尺寸和mask圖一樣
        let videoView = UIView(frame: maskImageView.frame)
        //加到主畫面上
        view.addSubview(videoView)
       
        //建立一個AVPlayerLayer，讓影片能顯示在畫面上
        let videoPlayerLayer = AVPlayerLayer(player: videoPlayer)
        //設定影片圖層的大小跟影片容器一樣
        videoPlayerLayer.frame = videoView.bounds
        //設定影片顯示模式為resizeAspectFill(填滿裁切)
        videoPlayerLayer.videoGravity = .resizeAspectFill
        //把影片圖層加到videoView的圖層裡
        videoView.layer.addSublayer(videoPlayerLayer)
        //將videoView的mask設為剛剛存的maskImageView
        videoView.mask = maskImageView
        
        //播放影片
        videoPlayer.play()
    }
    
    
    //加入漸層背景
    func setupGradientBackground() {
        //建立漸層圖層Layer
        let gradientLayer = CAGradientLayer()
        //設定漸層圖層的範圍為整個畫面
        gradientLayer.frame = view.bounds
        //設定漸層顏色(由上到下)
        gradientLayer.colors = [
            CGColor(srgbRed: 205/255, green: 229/255, blue: 287/255, alpha: 1),
            CGColor(srgbRed: 156/255, green: 203/255, blue: 144/255, alpha: 1)
         ]
        //把漸層加到底層圖層中(背景層)
        view.layer.insertSublayer(gradientLayer, at: 0)
    }


    //加入Usagi按鈕
    func addUsagiButton(){
        //建立一個Usagi UIButton，設定位置跟大小
        let usagiButton = UIButton(frame: CGRect(x: 148, y: 239, width: 100, height: 144))
        //設定按鈕圖片(是瘋瘋烏薩奇)
        usagiButton.setImage(UIImage(named: "usagi.png"), for: .normal)
        //加到畫面上
        view.addSubview(usagiButton)
        
        //加入點擊事件，觸發function tapUsagi
        usagiButton.addTarget(self, action: #selector(tapUsagi), for: .touchUpInside)
    }
    //點擊跳轉烏薩奇ViewController
    @objc func tapUsagi() {
        //跳轉到storyboard中ID為UsagiVC的畫面
        goToViewController(withID: "UsagiVC")
    }

    
    //加入Chii按鈕
    func addChiiButton(){
        //建立一個Chii UIButton，設定位置跟大小
        let chiiButton = UIButton(frame: CGRect(x: 376, y: 253, width: 122, height: 130))
        //設定按鈕圖片(是寶寶吉依)
        chiiButton.setImage(UIImage(named: "chii.png"), for: .normal)
        //加到畫面上
        view.addSubview(chiiButton)
        
        //加入點擊事件，觸發function tapChii
        chiiButton.addTarget(self, action: #selector(tapChii), for: .touchUpInside)
    }
    //點擊跳轉吉依ViewController
    @objc func tapChii() {
        //跳轉到storyboard中ID為ChiiVC的畫面
        goToViewController(withID: "ChiiVC")
    }
    
    
    //加入Hachi按鈕
    func addHachiButton(){
        //建立一個Hachi UIButton，設定位置跟大小
        let hachiButton = UIButton(frame: CGRect(x: 605, y: 253, width: 120, height: 132))
        //設定按鈕圖片(是暖心小八)
        hachiButton.setImage(UIImage(named: "hachi.png"), for: .normal)
        //加到畫面上
        view.addSubview(hachiButton)
        
        //加入點擊事件，觸發function tapHachi
        hachiButton.addTarget(self, action: #selector(tapHachi), for: .touchUpInside)
    }
    //點擊跳轉小八ViewController
    @objc func tapHachi() {
        //跳轉到storyboard中ID為HachiVC的畫面
        goToViewController(withID: "HachiVC")
    }

    
    //將畫面切換到指定的ViewController的function(用storyboard ID)
    func goToViewController(withID id: String) {
        //從Main.storyboard取得storyboard
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        //根據指定的ID建立ViewController
        let vc = storyboard.instantiateViewController(withIdentifier: id)
        //使用NavigationController進入下一個畫面
        self.navigationController?.pushViewController(vc, animated: true)
    }
}


