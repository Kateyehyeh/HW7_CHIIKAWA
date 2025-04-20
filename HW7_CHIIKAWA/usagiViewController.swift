//
//  usagiViewController.swift
//  HW7_CHIIKAWA
//
//  Created by Kate Yeh on 2025/3/5.
//

import UIKit

class usagiViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        //烏薩奇gif
        let usagiView = UIImageView(frame: CGRect(x: 450, y: 100, width: 282, height: 282))
        view.addSubview(usagiView)
        let animatedImage = UIImage.animatedImageNamed("usagi2-", duration: 1)
        usagiView.image = animatedImage
    }
    

    

}
