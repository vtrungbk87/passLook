//
//  PasscodeVC+Views.swift
//  codelock
//
//  Created by Van Trung on 8/15/17.
//  Copyright © 2017 Van Trung. All rights reserved.
//

import UIKit

extension PassCodeVC{

    func setupViews(){
        view.addSubview(titleLabel)
        view.addSubview(codeResultView)
        view.addSubview(numberPadView)

        view.addContrainsWithFormat(format: "H:|-20-[v0]-20-|", views: titleLabel)

        view.addContrainsWithFormat(format: "H:[v0(80)]", views: codeResultView)
        view.addConstraint(NSLayoutConstraint(item: codeResultView, attribute: .centerX, relatedBy: .equal, toItem: self.view, attribute: .centerX, multiplier: 1, constant: 0))

        view.addContrainsWithFormat(format: "H:|-20-[v0]-20-|", views: numberPadView)

        view.addContrainsWithFormat(format: "V:|-60-[v0(21)]-15-[v1(20)]-20-[v2]-50-|", views: titleLabel, codeResultView, numberPadView)

        setupCodeResultView()
        setupNumberPadView()
    }

    func setupCodeResultView(){
        codeResultView.addSubview(dot1Button)
        codeResultView.addSubview(dot2Button)
        codeResultView.addSubview(dot3Button)
        codeResultView.addSubview(dot4Button)

        codeResultView.addContrainsWithFormat(format: "H:|-5-[v0(10)]-10-[v1(10)]-10-[v2(10)]-10-[v3(10)]-5-|", views: dot1Button, dot2Button, dot3Button, dot4Button)
        codeResultView.addContrainsWithFormat(format: "V:|-5-[v0(10)]-5-|", views: dot1Button)
        codeResultView.addContrainsWithFormat(format: "V:|-5-[v0(10)]-5-|", views: dot2Button)
        codeResultView.addContrainsWithFormat(format: "V:|-5-[v0(10)]-5-|", views: dot3Button)
        codeResultView.addContrainsWithFormat(format: "V:|-5-[v0(10)]-5-|", views: dot4Button)
    }

    func setupNumberPadView(){
        numberPadView.addSubview(numberPad1View)
        numberPadView.addSubview(numberPad2View)
        numberPadView.addSubview(numberPad3View)
        numberPadView.addSubview(numberPad4View)

        numberPadView.addContrainsWithFormat(format: "H:|[v0]|", views: numberPad1View)
        numberPadView.addContrainsWithFormat(format: "H:|[v0]|", views: numberPad2View)
        numberPadView.addContrainsWithFormat(format: "H:|[v0]|", views: numberPad3View)
        numberPadView.addContrainsWithFormat(format: "H:|[v0]|", views: numberPad4View)

        numberPadView.addContrainsWithFormat(format: "V:|[v0(v3)][v1(v3)][v2(v3)][v3]|", views: numberPad1View, numberPad2View, numberPad3View, numberPad4View)


        setupNumberPadGeneralView(view: numberPad1View, number1: number1Button, number2: number2Button, number3: number3Button)
        setupNumberPadGeneralView(view: numberPad2View, number1: number4Button, number2: number5Button, number3: number6Button)
        setupNumberPadGeneralView(view: numberPad3View, number1: number7Button, number2: number8Button, number3: number9Button)

        // Add Zero number
        numberPad4View.addSubview(number0Button)
        numberPad4View.addSubview(deleteButton)

        numberPad4View.addContrainsWithFormat(format: "H:[v0(70)]-20-[v1(70)]", views: number0Button, deleteButton)
        numberPad4View.addContrainsWithFormat(format: "V:[v0(70)]", views: number0Button)
        numberPad4View.addContrainsWithFormat(format: "V:[v0(70)]", views: deleteButton)

        numberPad4View.addConstraint(NSLayoutConstraint(item: number0Button, attribute: .centerX, relatedBy: .equal, toItem: numberPad4View, attribute: .centerX, multiplier: 1, constant: 0))
        numberPad4View.addConstraint(NSLayoutConstraint(item: number0Button, attribute: .centerY, relatedBy: .equal, toItem: numberPad4View, attribute: .centerY, multiplier: 1, constant: 0))
        numberPad4View.addConstraint(NSLayoutConstraint(item: deleteButton, attribute: .centerY, relatedBy: .equal, toItem: numberPad4View, attribute: .centerY, multiplier: 1, constant: 0))
    }

    func setupNumberPadGeneralView(view: UIView, number1: UIButton, number2: UIButton, number3: UIButton){
        view.addSubview(number1)
        view.addSubview(number2)
        view.addSubview(number3)


        view.addContrainsWithFormat(format: "H:[v0(70)]-20-[v1(70)]-20-[v2(70)]", views: number1, number2, number3)
        view.addConstraint(NSLayoutConstraint(item: number2, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 0))

        view.addContrainsWithFormat(format: "V:[v0(70)]", views: number1)
        view.addConstraint(NSLayoutConstraint(item: number1, attribute: .centerY, relatedBy: .equal, toItem: view, attribute: .centerY, multiplier: 1, constant: 0))

        view.addContrainsWithFormat(format: "V:[v0(70)]", views: number2)
        view.addConstraint(NSLayoutConstraint(item: number2, attribute: .centerY, relatedBy: .equal, toItem: view, attribute: .centerY, multiplier: 1, constant: 0))

        view.addContrainsWithFormat(format: "V:[v0(70)]", views: number3)
        view.addConstraint(NSLayoutConstraint(item: number3, attribute: .centerY, relatedBy: .equal, toItem: view, attribute: .centerY, multiplier: 1, constant: 0))
    }
}
