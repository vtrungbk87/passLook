//
//  HomeVC.swift
//  codelock
//
//  Created by Van Trung on 8/15/17.
//  Copyright © 2017 Van Trung. All rights reserved.
//

import Foundation
import UIKit

class HomeVC: BaseViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .blue
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setUpNavigationBar(isShow: false)
    }
}
