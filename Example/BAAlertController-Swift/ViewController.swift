//
//  ViewController.swift
//  BAAlertController-Swift
//
//  Created by boai on 2018/1/6.
//  Copyright © 2018年 BAHome. All rights reserved.
//

import UIKit

import BAAlertController_Swift

class ViewController: UIViewController {
    
    let title0 = "博爱温馨提示"
    let msg0 = "欢迎使用 iPhone SE，迄今最高性能的 4 英寸 iPhone。在打造这款手机时，我们在深得人心的 4 英寸设计基础上，从里到外重新构想。它所采用的 A9 芯片，正是在 iPhone 6s 上使用的先进芯片。1200 万像素的摄像头能拍出令人叹为观止的精彩照片和 4K 视频，而 Live Photos 则会让你的照片栩栩如生。这一切，成就了一款外形小巧却异常强大的 iPhone。"
    let buttonTitleArray = ["取消", "确定"]
    //    let buttonTitleColorArray = [UIColor.green]
    let buttonTitleColorArray = [UIColor.green, UIColor.red]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.title = "BAAlertController-Swift"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        /// 切换demo 入口在这里！！！！！
        //        self.ba_alert3()
        self.ba_alert2()
    }
    
    func ba_alert()  {
        UIAlertController().ba_alertController(self, title: title0, attributedTitle:nil, message: msg0, attributedMessage:nil, buttonTitleArray: buttonTitleArray, buttonTitleColorArray: []) { (index, alertController) in
            
            print("点我干嘛？index：", index)
        }
    }
    
    func ba_alert2() -> Void {
        
        let attributedTitle = NSMutableAttributedString.init(string: title0)
        attributedTitle.addAttributes([NSAttributedString.Key.font:UIFont.boldSystemFont(ofSize: 30),
                                       NSAttributedString.Key.foregroundColor:UIColor.purple],
                                      range:NSMakeRange(0, (title0.count)))
        
        //消息内容样式（灰色斜体）
        let messageFontDescriptor = UIFontDescriptor.init(fontAttributes: [
            UIFontDescriptor.AttributeName.family:"Arial",
            UIFontDescriptor.AttributeName.name:"Arial-ItalicMT",
            ])
        let messageFont = UIFont.init(descriptor: messageFontDescriptor, size: 13.0)
        let attributedMessage = NSMutableAttributedString.init(string: msg0)
        attributedMessage.addAttributes([NSAttributedString.Key.font:messageFont,
                                         NSAttributedString.Key.foregroundColor:UIColor.red],
                                        range:NSMakeRange(0, (msg0.count)))
        
        UIAlertController().ba_actionSheet(self, title: nil, attributedTitle: attributedTitle, message: nil, attributedMessage: attributedMessage, buttonTitleArray: buttonTitleArray, buttonTitleColorArray: buttonTitleColorArray) { (index, alertController) in
            print("点我干嘛？index：", index)
        }
    }
    
    func ba_alert3() -> Void {
        UIAlertController().ba_alertController(self, title: title0, attributedTitle:nil, message: msg0, attributedMessage:nil, buttonTitleArray: buttonTitleArray, buttonTitleColorArray: [], buttonDisabledWithTitleArray: ["确定"], textFieldPlaceholderArray: ["请输入账号", "请输入密码"], textFieldConfigurationActionBlock: { (textField, index) in
            
            if index == 0
            {
                textField.keyboardType = .numberPad
            }
            if index == 1
            {
                textField.isSecureTextEntry = true
            }
           
            // swift 4.2
            NotificationCenter.default.addObserver(self, selector: #selector(self.handleAlertTextFieldDidChangeAction(_ :)), name: NSNotification.Name.UITextFieldTextDidChange, object: textField)
            
            // swift 5.0
//            NotificationCenter.default.addObserver(self, selector: #selector(self.handleAlertTextFieldDidChangeAction(_ :)), name: UITextField.textDidChangeNotification, object: textField)
            
        }) { (index, alertController) in
            
        }
    }
    
    @objc func handleAlertTextFieldDidChangeAction(_ notification: Notification) -> Void {
        // 通知处理，判断文字输入的长度 大于 3 的时候，确定按钮可点击，否则，不可点击
        let alertController:UIAlertController = self.presentedViewController as! UIAlertController;
        
        let login:UITextField = alertController.textFields![0];
        let sureAction:UIAlertAction = alertController.actions[1];
        
        let loginString:String = login.text!
        sureAction.isEnabled = loginString.count > 3;
    }
}



