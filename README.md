# BAAlertController-Swift
[![BAHome Team Name](https://img.shields.io/badge/Team-BAHome-brightgreen.svg?style=flat)](https://github.com/BAHome "BAHome Team")
![](https://img.shields.io/badge/platform-iOS-red.svg) ![](https://img.shields.io/badge/language-Objective--C-orange.svg) 
![](https://img.shields.io/badge/license-MIT%20License-brightgreen.svg) 
![](https://img.shields.io/cocoapods/v/BAAlertController-Swift.svg?style=flat) ![](https://img.shields.io/cocoapods/dt/BAAlertController-Swift.svg
)  [![](https://img.shields.io/badge/微博-博爱1616-red.svg)](http://weibo.com/538298123)

## 1、功能及简介
* 1、用分类封装系统的 UIAlertController，代码无侵入，简洁高效，一个block 搞定系统alert 和 actionSheet
* 2、可以自定义按钮数量、按钮颜色【多按钮样式，颜色数组和title数组个数不等情况下，默认蓝色】【待开发】
* 3、可以自定义 NSMutableAttributedString 的 alert 和 actionSheet，让你的 alert 更加炫酷【待开发】
* 4、完美适配 iPhone 和 iPad 版本
* 5、理论完全兼容现有 iOS 8 以上系统版本

## 2、图片示例
![BAAlertController1](https://github.com/boai/BAAlertController-Swift/blob/master/Images/BAAlertController1.png)
![BAAlertController2](https://github.com/BAHome/BAAlertController-Swift/blob/master/Images/BAAlertController2.png)
![BAAlertController3](https://github.com/BAHome/BAAlertController-Swift/blob/master/Images/BAAlertController3.png)
![BAAlertController4](https://github.com/BAHome/BAAlertController-Swift/blob/master/Images/BAAlertController4.png)
![BAAlertController-5](https://github.com/BAHome/BAAlertController-Swift/blob/master/Images/BAAlertController-Swift5.png)
![BAAlertController6](https://github.com/BAHome/BAAlertController-Swift/blob/master/Images/BAAlertController6.png)
![BAAlertController7](https://github.com/BAHome/BAAlertController-Swift/blob/master/Images/BAAlertController7.png)

## 3、安装、导入示例和源码地址
* 1、pod 导入【最新版本：![](https://img.shields.io/cocoapods/v/BAAlertController-Swift.svg?style=flat)】： <br>
 `OC:    pod 'BAAlertController'` <br>
 `Swift: pod 'BAAlertController-Swift'` <br>

如果发现 `pod search BAAlertController-Swift` 搜索出来的不是最新版本，需要在终端执行 cd 转换文件路径命令退回到 desktop，然后执行 `pod setup` 命令更新本地spec缓存（可能需要几分钟），然后再搜索就可以了。<br>
具体步骤：
  - pod setup : 初始化
  - pod repo update : 更新仓库
  - pod search BAAlertController-Swift
* 2、文件夹拖入：下载demo，把 BAAlertController-Swift 文件夹拖入项目即可，<br>
* 3、导入头文件：<br>
`  Swift import BAAlertController_Swift `<br>
* 4、项目源码地址：<br>
 OC 版 ：[https://github.com/BAHome/BAAlertController](https://github.com/BAHome/BAAlertController)<br>
 Swift 版 ：[https://github.com/BAHome/BAAlertController-Swift](https://github.com/BAHome/BAAlertController-Swift)<br>


## 4、BAAlertController-Swift 的类结构及 demo 示例
![BAAlertController-Swift](https://github.com/boai/BAAlertController-Swift/blob/master/Images/BAAlertController.jpg)


### UIAlertController+BAKit.swift
```
import Foundation
import UIKit

public typealias BAKit_UIAlertController_ButtonActionBlock = (_ index:Int, _ alertController:UIAlertController) -> ()
public typealias BAKit_UIAlertController_TextFieldConfigurationActionBlock = (_ textField:UITextField, _ index:Int) -> ()

extension UIAlertController {
    
    /// UIAlertController：快速创建一个 普通的 alert
    ///
    /// - Parameters:
    ///   - viewController: viewController
    ///   - title: 标题
    ///   - message: 内容
    ///   - buttonTitleArray: 按钮标题数组
    ///   - buttonTitleColorArray: 按钮标题颜色数组
    ///   - actionBlock: 按钮点击事件 block
    public func ba_alertController(_ viewController: UIViewController,
                                   title: String?,
                                   attributedTitle: NSMutableAttributedString?,
                                   message: String?,
                                   attributedMessage: NSMutableAttributedString?,
                                   buttonTitleArray:Array<String?>,
                                   buttonTitleColorArray:Array<UIColor?>,
                                   actionBlock : @escaping BAKit_UIAlertController_ButtonActionBlock) {
        
        self.ba_creatAlertController(UIAlertController.Style.alert, viewController: viewController, title: title, attributedTitle:attributedTitle, message: message, attributedMessage:attributedMessage, buttonTitleArray: buttonTitleArray, buttonTitleColorArray: buttonTitleColorArray, buttonDisabledWithTitleArray: [], textFieldPlaceholderArray: [], textFieldConfigurationActionBlock: nil , actionBlock: actionBlock)
    }
    
    /// UIAlertController：快速创建一个 普通的 actionSheet
    ///
    /// - Parameters:
    ///   - viewController: viewController
    ///   - title: 标题
    ///   - message: 内容
    ///   - buttonTitleArray: 按钮标题数组
    ///   - buttonTitleColorArray: 按钮标题颜色数组
    ///   - actionBlock: 按钮点击事件 block
    public func ba_actionSheet(_ viewController: UIViewController,
                               title: String?,
                               attributedTitle: NSMutableAttributedString?,
                               message: String?,
                               attributedMessage: NSMutableAttributedString?,
                               buttonTitleArray:Array<String?>,
                               buttonTitleColorArray:Array<UIColor?>,
                               actionBlock : @escaping BAKit_UIAlertController_ButtonActionBlock) {
        
        self.ba_creatAlertController(UIAlertController.Style.actionSheet, viewController: viewController, title: title, attributedTitle:attributedTitle, message: message, attributedMessage: attributedMessage, buttonTitleArray: buttonTitleArray, buttonTitleColorArray: buttonTitleColorArray, buttonDisabledWithTitleArray: [], textFieldPlaceholderArray: [], textFieldConfigurationActionBlock: nil , actionBlock: actionBlock)
    }
    
    /// UIAlertController： 快速创建一个系统 普通 带 textField 的 alert
    ///
    /// - Parameters:
    ///   - viewController: viewController
    ///   - title: 标题
    ///   - message: 内容
    ///   - buttonTitleArray: 按钮标题数组
    ///   - buttonTitleColorArray: 按钮标题颜色数组
    ///   - buttonDisabledWithTitleArray: 按钮标题颜色数组(默认不能点击)
    ///   - textFieldPlaceholderArray: textField 的 Placeholder 数组
    ///   - textFieldConfigurationActionBlock: textField 配置 block
    ///   - actionBlock: 按钮点击事件 block
    public func ba_alertController(_ viewController: UIViewController,
                                   title: String?,
                                   attributedTitle: NSMutableAttributedString?,
                                   message: String?,
                                   attributedMessage: NSMutableAttributedString?,
                                   buttonTitleArray:Array<String?>,
                                   buttonTitleColorArray:Array<UIColor?>,
                                   buttonDisabledWithTitleArray:Array<String?>,
                                   textFieldPlaceholderArray:Array<String?>,
                                   textFieldConfigurationActionBlock: BAKit_UIAlertController_TextFieldConfigurationActionBlock?, actionBlock : @escaping BAKit_UIAlertController_ButtonActionBlock) {
        
        self.ba_creatAlertController(UIAlertController.Style.alert, viewController: viewController, title: title, attributedTitle:attributedTitle, message: message, attributedMessage:attributedMessage, buttonTitleArray: buttonTitleArray, buttonTitleColorArray: buttonTitleColorArray, buttonDisabledWithTitleArray: buttonDisabledWithTitleArray, textFieldPlaceholderArray: textFieldPlaceholderArray, textFieldConfigurationActionBlock: textFieldConfigurationActionBlock, actionBlock: actionBlock)
    }
    
    private func ba_creatAlertController(_ preferredStyle:UIAlertController.Style,
                                         viewController: UIViewController,
                                         title: String?,
                                         attributedTitle: NSMutableAttributedString?,
                                         message: String?,
                                         attributedMessage: NSMutableAttributedString?,
                                         buttonTitleArray:Array<String?>,
                                         buttonTitleColorArray:Array<UIColor?>,
                                         buttonDisabledWithTitleArray:Array<String?>,
                                         textFieldPlaceholderArray:Array<String?>,
                                         textFieldConfigurationActionBlock: BAKit_UIAlertController_TextFieldConfigurationActionBlock?,
                                         actionBlock : BAKit_UIAlertController_ButtonActionBlock?) {
        
//        //消息内容样式（灰色斜体）
//        let messageFontDescriptor = UIFontDescriptor.init(fontAttributes: [
//            UIFontDescriptor.AttributeName.family:"Arial",
//            UIFontDescriptor.AttributeName.name:"Arial-ItalicMT",
//            ])
//        
//        let messageFont = UIFont.init(descriptor: messageFontDescriptor, size: 13.0)
//        let messageAttribute = NSMutableAttributedString.init(string: message)
//        messageAttribute.addAttributes([NSAttributedStringKey.font:messageFont,
//                                        NSAttributedStringKey.foregroundColor:UIColor.red],
//                                       range:NSMakeRange(0, (message.characters.count)))
        
        let alertController = UIAlertController.init(title: title, message: message, preferredStyle: preferredStyle)
        
        if ((attributedTitle?.length) != nil) {
            alertController.setValue(attributedTitle, forKey: "attributedTitle")
        }

        if ((attributedMessage?.length) != nil) {
            alertController.setValue(attributedMessage, forKey: "attributedMessage")
        }

        if buttonTitleArray.count > 0
        {
            for i:Int in 0..<buttonTitleArray.count
            {
                let buttonTitle = buttonTitleArray[i]
                
                let action = UIAlertAction.init(title: buttonTitle, style: UIAlertAction.Style.default, handler: { (action) in
                    actionBlock!(i, alertController)
                })
                alertController.addAction(action)
                
                for j:Int in 0..<buttonDisabledWithTitleArray.count
                {
                    if (buttonDisabledWithTitleArray[j]?.elementsEqual(buttonTitle!))!
                    {
                        action.isEnabled = false
                    }
                }
                
                // 处理按钮字体颜色，待后期版本更新
                var buttonTitleColorArray = buttonTitleColorArray
                
                if buttonTitleColorArray.count == 0 || buttonTitleColorArray.count < buttonTitleArray.count {
                    var mutArr = [Any]()
                    for _:Int in 0..<buttonTitleArray.count {
                        mutArr.append(UIColor.blue)
                    }
                    buttonTitleColorArray = mutArr as! [UIColor]
                }
                
                if buttonTitleColorArray.count > 0 {
                    action.setValue(buttonTitleColorArray[i], forKey: "titleTextColor")
                }
            }
        }
        
        if preferredStyle == UIAlertController.Style.alert && textFieldPlaceholderArray.count > 0
        {
            for i:Int in 0..<textFieldPlaceholderArray.count
            {
                alertController.addTextField(configurationHandler: { (textField) in
                    textField.placeholder = textFieldPlaceholderArray[i]
                    
                    textFieldConfigurationActionBlock!(textField, i)
                })
            }
        }
        
        if preferredStyle == UIAlertController.Style.actionSheet
        {
            let action = UIAlertAction.init(title: "取消", style: UIAlertAction.Style.cancel, handler: nil)
            alertController.addAction(action)
        }
        
        viewController.ba_currentViewController()?.present(alertController, animated: true, completion: nil)
        
    }
}

extension UIViewController {
    public func ba_currentViewController() -> UIViewController? {
        
        var presentedVC = UIApplication.shared.keyWindow?.rootViewController
        while let pVC = presentedVC?.presentedViewController
        {
            presentedVC = pVC
        }
        
        if presentedVC == nil {
            print("UIAlertController Error: You don't have any views set. You may be calling in viewDidload. Try viewDidappear.")
        }
        return presentedVC
    }
}
```

### demo 示例
```
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
            
            NotificationCenter.default.addObserver(self, selector: #selector(self.handleAlertTextFieldDidChangeAction(_ :)), name: NSNotification.Name.UITextFieldTextDidChange, object: textField)
            
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
    
其他示例可下载demo查看源码！
```

## 5、更新记录：【倒叙】
 欢迎使用 [【BAHome】](https://github.com/BAHome) 系列开源代码 ！ <br>
 如有更多需求，请前往：[【BAHome】](https://github.com/BAHome)

 项目源码地址：
 OC 版 ：https://github.com/BAHome/BAAlertController <br>
 Swift 版 ：https://github.com/BAHome/BAAlertController-Swift <br>

最新更新时间：2019-01-28 【倒叙】<br>
最新Version：【Version：1.0.2】<br>
更新内容：<br>
1.0.2.1、部分代码优化，全面适配 swift 5.0<br>

 最新更新时间：2018-11-06 【倒叙】 <br>
 最新Version：【Version：1.0.1】 <br>
 更新内容： <br>
 1.0.1.1、UIAlertController-alert/actionSheet，可以自由设置按钮颜色、attributedTitle、attributedMessage <br>
 1.0.1.2、全新 pod 改版，支持 pod 1.0.1 版本, pod 后，需导入头文件：BAAlertController_Swift <br>
 1.0.1.3、部分代码优化，全面适配 swift 4.2 <br>

 最新更新时间：2018-01-06 【倒叙】 <br>
 最新Version：【Version：1.0.0】 <br>
 更新内容： <br>
 1.0.0.1、普通的 UIAlertController-alert，可以自由设置按钮数量、按钮颜色 <br>
 1.0.0.2、普通的 UIAlertController-alert，可以自由设置按钮数量、按钮颜色【多按钮样式，颜色数组和title数组个数不等】 <br>
 1.0.0.3、普通的 带 textField 的 UIAlertController-alert，可添加一个或者多个 textField <br>
 1.0.0.4、普通的 UIAlertController-actionSheet，可以自由设置按钮数量、按钮颜色 <br>
 1.0.0.5、完美适配 iPhone 和 iPad 版本 <br>
 1.0.0.6、理论完全兼容现有 iOS 8 以上系统版本 <br>


## 6、bug 反馈
> 1、开发中遇到 bug，希望小伙伴儿们能够及时反馈与我们 BAHome 团队，我们必定会认真对待每一个问题！ <br>

> 2、以后提需求和 bug 的同学，记得把 git 或者博客链接给我们，我直接超链到你们那里！希望大家积极参与测试！<br> 

## 7、BAHome 团队成员
> 1、QQ 群 
479663605 <br> 
【注意：此群为 2 元 付费群，介意的小伙伴儿勿扰！】<br> 

> 孙博岩 <br> 
QQ：137361770 <br> 
git：[https://github.com/boai](https://github.com/boai) <br>
简书：[http://www.jianshu.com/u/95c9800fdf47](http://www.jianshu.com/u/95c9800fdf47) <br>
微博：[![](https://img.shields.io/badge/微博-博爱1616-red.svg)](http://weibo.com/538298123) <br>

> 马景丽 <br> 
QQ：1253540493 <br> 
git：[https://github.com/MaJingli](https://github.com/MaJingli) <br>

> 陆晓峰 <br> 
QQ：442171865 <br> 
git：[https://github.com/zeR0Lu](https://github.com/zeR0Lu) <br>

> 陈集 <br> 
QQ：3161182978 <br> 
git：[https://github.com/chenjipdc](https://github.com/chenjipdc) <br>
简书：[http://www.jianshu.com/u/90ae559fc21d](http://www.jianshu.com/u/90ae559fc21d)

> 任子丰 <br> 
QQ：459643690 <br> 
git：[https://github.com/renzifeng](https://github.com/renzifeng) <br>

> 吴丰收 <br> 
QQ：498121294 <br> 

> 石少庸 <br> 
QQ：363605775 <br> 
git：[https://github.com/CrazyCoderShi](https://github.com/CrazyCoderShi) <br>
简书：[http://www.jianshu.com/u/0726f4d689a3](http://www.jianshu.com/u/0726f4d689a3)

## 8、开发环境 和 支持版本
> 开发使用 最新版本 Xcode，理论上支持 iOS 9 及以上版本，如有版本适配问题，请及时反馈！多谢合作！

## 9、感谢
> 感谢 [【BAHome】](https://github.com/BAHome) 团队成员倾力合作，后期会推出一系列 常用 UI 控件的封装，大家有需求得也可以在 issue 提出，如果合理，我们会尽快推出新版本！<br>

> [【BAHome】](https://github.com/BAHome) 的发展离不开小伙伴儿的信任与推广，再次感谢各位小伙伴儿的支持！

