//
//  ViewController.swift
//  Flo
//
//  Created by itrump on 2018/10/12.
//  Copyright © 2018 fengxiaoyang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // counter outlets
    @IBOutlet weak var counterView: CounterView!
    @IBOutlet weak var counterLable: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        counterLable.text = String(counterView.counter)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func pushButtonPressed(_ button: PushButton) {
        if button.isAddButton {
            if counterView.counter < CounterView.Constants.numberOfGlasses {
                counterView.counter += 1
            }
        } else {
            if counterView.counter > 0 {
                counterView.counter -= 1
            }
        }
        counterLable.text = String(counterView.counter)
    }

}

