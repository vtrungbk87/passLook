//
//  PassCodeVC.swift
//  codelock
//
//  Created by Van Trung on 8/15/17.
//  Copyright © 2017 Van Trung. All rights reserved.
//

import Foundation
import UIKit

class PassCodeVC: UIViewController {

    let titleLabel: UILabel = {
        let lb = UILabel()
        lb.text = "Enter your passcode"
        lb.textColor = .white
        lb.font = UIFont.systemFont(ofSize: 15)
        lb.textAlignment = .center
        return lb
    }()

    let codeResultView: UIView = {
        let view = UIView()
        return view
    }()

    let dot1Button: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .yellow
        return button
    }()
    let dot2Button: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .yellow
        return button
    }()
    let dot3Button: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .yellow
        return button
    }()
    let dot4Button: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .yellow
        return button
    }()

    let numberPadView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.clear
        return view
    }()

    let numberPad1View: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.clear
        return view
    }()

    let numberPad2View: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.clear
        return view
    }()


    let numberPad3View: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.clear
        return view
    }()

    let numberPad4View: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.clear
        return view
    }()


    let deleteButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("D", for: .normal)
        button.tintColor = .white
        button.backgroundColor = UIColor.purple
        button.addTarget(self, action: #selector(handleDeleteCode), for: .touchUpInside)
        return button
    }()

    static var passCode = ""

    static var instance: PassCodeVC?

    lazy var number0Button = PassCodeVC.createNumberButton(buttonTitle: "0")
    let number1Button = PassCodeVC.createNumberButton(buttonTitle: "1")
    let number2Button = PassCodeVC.createNumberButton(buttonTitle: "2")
    let number3Button = PassCodeVC.createNumberButton(buttonTitle: "3")
    let number4Button = PassCodeVC.createNumberButton(buttonTitle: "4")
    let number5Button = PassCodeVC.createNumberButton(buttonTitle: "5")
    let number6Button = PassCodeVC.createNumberButton(buttonTitle: "6")
    let number7Button = PassCodeVC.createNumberButton(buttonTitle: "7")
    let number8Button = PassCodeVC.createNumberButton(buttonTitle: "8")
    let number9Button = PassCodeVC.createNumberButton(buttonTitle: "9")

    static func createNumberButton(buttonTitle: String) -> UIButton{
        let button = UIButton(type: .system)
        button.setTitle("\(buttonTitle)", for: .normal)
        button.tintColor = .white
        button.backgroundColor = UIColor.orange
        button.addTarget(PassCodeVC.self, action: #selector(PassCodeVC.handleNumberButtonTouched(_:)), for: .touchUpInside)
        return button
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        PassCodeVC.instance = self
        view.backgroundColor = UIColor(white: 1, alpha: 0.5)
        initResultDot()
    }

    static func test(){
        print("Test")
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    func handleDeleteCode(){
        print("delete")
        print(PassCodeVC.passCode)
        if PassCodeVC.passCode != ""{
            PassCodeVC.passCode.remove(at: PassCodeVC.passCode.index(before: PassCodeVC.passCode.endIndex))
            setStatusForResultDot()
        }
    }

    static func handleNumberButtonTouched(_ sender: UIButton){
        if PassCodeVC.passCode.characters.count <= 4{
            if let buttonTitle = sender.title(for: .normal) {
                PassCodeVC.passCode = PassCodeVC.passCode + buttonTitle
            }
        }

        if PassCodeVC.passCode.characters.count == 4{
            instance?.validatePassCode(passCode: PassCodeVC.passCode)
        }
        instance?.setStatusForResultDot()
    }

    func validatePassCode(passCode: String){
        let currentPassCode = "1234"
        if PassCodeVC.passCode == currentPassCode{
            print("OK")
            PassCodeVC.passCode = ""
            self.dismiss(animated: true, completion: {
                //do something
                self.initResultDot()
            })
        }else{
            print("Not OK")
            PassCodeVC.passCode = ""
            initResultDot()
        }
    }

    func initResultDot(){
        dot1Button.backgroundColor = .yellow
        dot2Button.backgroundColor = .yellow
        dot3Button.backgroundColor = .yellow
        dot4Button.backgroundColor = .yellow
    }

    func setStatusForResultDot(){
        let count = PassCodeVC.passCode.characters.count
        switch count {
        case 1:
            dot1Button.backgroundColor = .green
            dot2Button.backgroundColor = .yellow
            dot3Button.backgroundColor = .yellow
            dot4Button.backgroundColor = .yellow
        case 2:
            dot1Button.backgroundColor = .green
            dot2Button.backgroundColor = .green
            dot3Button.backgroundColor = .yellow
            dot4Button.backgroundColor = .yellow
        case 3:
            dot1Button.backgroundColor = .green
            dot2Button.backgroundColor = .green
            dot3Button.backgroundColor = .green
            dot4Button.backgroundColor = .yellow
        case 4:
            dot1Button.backgroundColor = .green
            dot2Button.backgroundColor = .green
            dot3Button.backgroundColor = .green
            dot4Button.backgroundColor = .green
        default:
            dot1Button.backgroundColor = .yellow
            dot2Button.backgroundColor = .yellow
            dot3Button.backgroundColor = .yellow
            dot4Button.backgroundColor = .yellow
        }
    }

}
