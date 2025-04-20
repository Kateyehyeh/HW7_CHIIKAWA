//
//  hachiViewController.swift
//  HW7_CHIIKAWA
//
//  Created by Kate Yeh on 2025/3/5.
//

import UIKit

class hachiViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        //小八gif
        let hachiView = UIImageView(frame: CGRect(x: 160, y: 145, width: 260, height: 260))
        view.addSubview(hachiView)
        let animatedImage = UIImage.animatedImageNamed("hachi2-", duration: 1)
        hachiView.image = animatedImage
    }
    

    

}
