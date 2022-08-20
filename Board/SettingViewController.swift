//
//  SettingViewController.swift
//  Board
//
//  Created by WonDongHyun on 2022/08/20.
//

import UIKit

protocol LEDBoardSettingDelegate: AnyObject{
    func changedSetting(text: String?, textColor:UIColor, backgroundColor: UIColor)
}

class SettingViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var yellowButton: UIButton!
    @IBOutlet weak var greenButton: UIButton!
    @IBOutlet weak var purpleButton: UIButton!
    @IBOutlet weak var blackButton: UIButton!
    @IBOutlet weak var blueButton: UIButton!
    @IBOutlet weak var oragneButton: UIButton!
    
    
    weak var delegate: LEDBoardSettingDelegate?
    var ledText: String?
    
    var textColor: UIColor = .yellow
    var backGroundColor: UIColor = .black
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureView()

    }
    private func configureView(){
        if let ledText = self.ledText{
            self.textField.text = ledText
        }
        self.changeTextColor(color: self.textColor)
        self.changeBackGroundColorButton(color: self.backGroundColor)
    }
    @IBAction func tabTextColorButton(_ sender: UIButton) {
        if sender == self.yellowButton {
            self.changeTextColor(color: .yellow)
            self.textColor = .yellow
        }else if sender == self.purpleButton{
            self.changeTextColor(color: .purple)
            self.textColor = .purple
        }else{
            self.changeTextColor(color: .green)
            self.textColor = .green
        }
    }
    
    
    
    @IBAction func tabBackGroundColorButton(_ sender: UIButton) {
        if sender == self.blackButton {
            self.changeBackGroundColorButton(color: .black)
            self.backGroundColor = .black
        }else if sender == self.blueButton{
            self.changeBackGroundColorButton(color: .blue)
            self.backGroundColor = .blue
        }else{
            self.changeBackGroundColorButton(color: .orange)
            self.backGroundColor = .orange
        }
    }
    
    
    
    @IBAction func tabSaveButton(_ sender: UIButton) {
        self.delegate?.changedSetting(
            text: self.textField.text,
            textColor: self.textColor,
            backgroundColor: self.backGroundColor)
        self.navigationController?.popViewController(animated: true)
    }
    
    private func changeTextColor(color: UIColor){
        
        self.yellowButton.alpha = color == UIColor.yellow  ? 1: 0.2
        self.purpleButton.alpha = color == UIColor.purple  ? 1: 0.2
        self.greenButton.alpha = color == UIColor.green  ? 1: 0.2


        
    }
    
    private func changeBackGroundColorButton(color: UIColor){
        self.blackButton.alpha = color == UIColor.black ? 1 : 0.2
        self.blueButton.alpha = color == UIColor.blue ? 1 : 0.2
        self.oragneButton.alpha = color == UIColor.orange ? 1 : 0.2

        
    }
}
