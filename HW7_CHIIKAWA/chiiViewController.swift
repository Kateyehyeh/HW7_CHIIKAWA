//
//  chiiViewController.swift
//  HW7_CHIIKAWA
//
//  Created by Kate Yeh on 2025/3/5.
//

import UIKit

class chiiViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        //吉依gif
        let chiiView = UIImageView(frame: CGRect(x: 160, y: 100, width: 500, height: 504))
        view.addSubview(chiiView)
        let animatedImage = UIImage.animatedImageNamed("chii3-", duration: 1)
        chiiView.image = animatedImage
        
        
    }
    

    

}
