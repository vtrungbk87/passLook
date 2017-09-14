//
//  BaseViewController.swift
//  codelock
//
//  Created by Van Trung on 8/15/17.
//  Copyright © 2017 Van Trung. All rights reserved.
//

import Foundation
import UIKit

class BaseViewController: UIViewController{
    let isSetPassCode = true
    override func viewDidLoad() {
        super.viewDidLoad()
        if isSetPassCode{
            let controller = PassCodeVC()
            DispatchQueue.main.async {
                self.parent?.present(controller, animated: true, completion: {
                    //
                })
            }


        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    func setUpNavigationBar(isShow: Bool){
        self.navigationController?.setNavigationBarHidden(!isShow, animated: true)
    }
}
