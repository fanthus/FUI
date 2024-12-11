//
//  ViewController.swift
//  FUIDemo
//
//  Created by fanthus on 12/11/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let label = FUI.makeLabel(txt: "Hello world", color: "000000", fontSize: 15, align: .center, superView: self.view, lineNum: 0)
        label.frame = .init(x: 50, y: 50, width: 50, height: 50)
        let label2 = FUI.makeLabel(txt: "Hello world", color: "000000", fontSize: 20, align: .center, superView: self.view, lineNum: 0)
        label2.frame = .init(x: 50, y: 150, width: 50, height: 50)
    }


}

