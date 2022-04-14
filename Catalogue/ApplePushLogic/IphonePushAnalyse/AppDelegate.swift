//
//  AppDelegate.swift
//  IphonePushAnalyse
//
//  Created by companyY on 2021/6/1.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = ViewController()
        self.window?.makeKeyAndVisible()
        
        self.configNotificationCenter()
        
        self.requestAuthorizationStatus { [weak self] isAuthorized in
            self?.registerForRemoteNotification()
        }
        print(#function)
        v.text = v.text + "\n\(#function)"
        return true
    }
}

/// 处理local推送
extension AppDelegate {
    @available(iOS, introduced: 4.0, deprecated: 10.0)
    func application(_ application: UIApplication,
                     didReceive notification: UILocalNotification) {
        /// 当app在前台，收到推送的时候调用该方法，不会有弹窗提示，需要自定义
        /// 当app在后台，收到推送并点击的时候调用该方法
        /// 当app未启动时，收到推送不会走该函数，点击推送之后，直接调用启动方法
        print(#function)
        v.text = v.text + "\n\(#function)"
    }
    
    @available(iOS, introduced: 8.0, deprecated: 10.0)
    func application(_ application: UIApplication,
                     handleActionWithIdentifier identifier: String?,
                     for notification: UILocalNotification, completionHandler: @escaping () -> Void) {
        /// 针对自定义推送界面的按钮事件的交互处理
        print(#function)
        v.text = v.text + "\n\(#function)"
    }
    
    @available(iOS, introduced: 9.0, deprecated: 10.0)
    func application(_ application: UIApplication,
                     handleActionWithIdentifier identifier: String?,
                     for notification: UILocalNotification,
                     withResponseInfo responseInfo: [AnyHashable : Any], completionHandler: @escaping () -> Void) {
        /// 同远程相似推送一样的作用
        print(#function)
        v.text = v.text + "\n\(#function)"
    }
}

/// 处理Remote推送
extension AppDelegate: UNUserNotificationCenterDelegate {
    
    func configNotificationCenter() {
        if #available(iOS 10.0, *) {
            let notificationCenter = UNUserNotificationCenter.current()
            notificationCenter.delegate = self
        }
    }
    
    @available(iOS, introduced: 3.0, deprecated: 10.0)
    func application(_ application: UIApplication,
                     didReceiveRemoteNotification userInfo: [AnyHashable : Any]) {
        /// 在不实现①`application(_ application: UIApplication,didReceiveRemoteNotification userInfo: [AnyHashable : Any],
        ///                     fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void)`下
        /// 当APP在前台，收到推送调用该方法，可以通过在此处实现自定义UI，完成前台推送效果
        /// 当APP在后台，点击推送调用该方法
        /// 当APP未启动，没有实现函数①，不会调用该方法，直接调用启动方法
        print(#function)
        v.text = v.text + "\n\(#function)"
    }
    
    @available(iOS, introduced: 7.0)
    func application(_ application: UIApplication,
                     didReceiveRemoteNotification userInfo: [AnyHashable : Any],
                     fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        /// 当使用`UNUserNotificationCenter`,远程推送就不会再使用老的代理函数回调
        /// 当APP在前台，收到推送调用该方法，可以通过在此处实现自定义UI，完成前台推送效果
        /// 当APP在后台，点击推送调用该方法
        /// 当APP未启动，点击推送先调用启动方法，再调用该方法
        completionHandler(.newData)
        print(#function)
        v.text = v.text + "\n\(#function)"
    }
    
    @available(iOS, introduced: 8.0, deprecated: 10.0)
    func application(_ application: UIApplication,
                     handleActionWithIdentifier identifier: String?,
                     forRemoteNotification userInfo: [AnyHashable : Any],
                     completionHandler: @escaping () -> Void) {
        /// 针对自定义推送界面的按钮事件的交互处理
        print(#function)
        v.text = v.text + "\n\(#function)"
    }
    
    @available(iOS, introduced: 9.0, deprecated: 10.0)
    func application(_ application: UIApplication,
                     handleActionWithIdentifier identifier: String?,
                     forRemoteNotification userInfo: [AnyHashable : Any],
                     withResponseInfo responseInfo: [AnyHashable : Any],
                     completionHandler: @escaping () -> Void) {
        /// 针对自定义推送界面的按钮事件的交互处理
        /// `UIUserNotificationActionBehaviorTextInput`
        /// 当Action为UIUserNotificationActionBehaviorTextInput时,需要通过responseInfo的UIUserNotificationActionResponseTypedTextKey来获取输入的文字内容,UIUserNotificationTextInputActionButtonTitleKey获取点击的按钮类型.
        /// 当Action为UIUserNotificationActionBehaviorDefault时,responseInfo为nil,通过identifier来区分点击按钮分别是什么来做处理.
        print(#function)
        v.text = v.text + "\n\(#function)"
    }
    
    /// ios10 发布的UNUserNotification已经将远程推送和本地推送合并成推送业务一起处理了
    
    @available(iOS 10.0, *)
    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                didReceive response: UNNotificationResponse,
                                withCompletionHandler completionHandler: @escaping () -> Void) {
        //  点击推送执行该函数(前台|后台|未启动)
        //  可以处理处理自定义事件响应
        //  如果未启动会先执行启动函数再执行该函数
        print(#function)
        v.text = v.text + "\n\(#function)"
    }
    
    @available(iOS 10.0, *)
    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                willPresent notification: UNNotification,
                                withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        //  APP在前台，收到推送调用该方法，completionHandler决定可以可以出现的系统推送样式
        completionHandler(.allElement)
        print(#function)
        v.text = v.text + "\n\(#function)"
    }
    
    @available(iOS 12.0, *)
    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                openSettingsFor notification: UNNotification?) {
        //  从设置点击 `XXX`通知设置 会调用该函数
        //  如果未启动会先执行启动函数再执行该函数
        print(#function)
        v.text = v.text + "\n\(#function)"
    }
}

/// 获取token
extension AppDelegate {
    /// 获取`DeviceToken`
    func application(_ application: UIApplication,
                     didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        /// ios13之后更新成这种方式处理后续可能会改变
        let token = deviceToken.map { String(format: "%02.2hhx", $0) }.joined()
        print("DeviceToken:\n\(token)")
    }

    /// 获取`DeviceToken`失败
    func application(_ application: UIApplication,
                     didFailToRegisterForRemoteNotificationsWithError error: Error) {
        
    }
}

/// 注册推送
extension AppDelegate {
    /// 获取推送权限状态
    func requestAuthorizationStatus(_ resultHandler: @escaping (_ isAuthorized: Bool) -> Void) {
        if #available(iOS 10, *) {
            UNUserNotificationCenter.current().getNotificationSettings { settings in
                DispatchQueue.main.async {
                    switch settings.authorizationStatus {
                    case .notDetermined:
                        resultHandler(false)
                    case .denied:
                        resultHandler(false)
                    case .authorized:
                        resultHandler(true)
                    case .provisional:
                        resultHandler(true)
                    case .ephemeral:
                        resultHandler(true)
                    @unknown default:
                        resultHandler(false)
                    }
                }
            }
        } else if #available(iOS 8 , *) {
            guard let settings = UIApplication.shared.currentUserNotificationSettings else {
                resultHandler(false)
                return
            }
            if (settings.types.rawValue == 0) {
                resultHandler(false)
            } else {
                resultHandler(true)
            }
        } else {
            let types = UIApplication.shared.enabledRemoteNotificationTypes()
            if (types.rawValue == 0) {
                resultHandler(false)
            } else {
                resultHandler(true)
            }
        }
    }
    
    /// 注册APNs推送
    func registerForRemoteNotification() {
        if #available(iOS 10, *) {
            UNUserNotificationCenter.current().requestAuthorization(options: .allElement) { isGranted, error in
                if (isGranted) {
                    DispatchQueue.main.async {
                        UIApplication.shared.registerForRemoteNotifications()
                    }
                }
            }
        } else if #available(iOS 8, *) {
            let settings = UIUserNotificationSettings(types: .allElement, categories: nil)
            UIApplication.shared.registerUserNotificationSettings(settings)
            UIApplication.shared.registerForRemoteNotifications()
        } else {
            UIApplication.shared.registerForRemoteNotifications(matching: .allElement)
        }
    }
}

@available(iOS 10.0, *)
extension UNNotificationPresentationOptions {
    static var allElement:  UNNotificationPresentationOptions {
        var sets: UNNotificationPresentationOptions = [
            UNNotificationPresentationOptions.badge,
            UNNotificationPresentationOptions.sound,
        ]
        if #available(iOS 14, *) {
            sets.insert(UNNotificationPresentationOptions.list)
            sets.insert(UNNotificationPresentationOptions.banner)
        } else if #available(iOS 12, *) {
            sets.insert(UNNotificationPresentationOptions.alert)
        }
        return sets
    }
}

@available(iOS 10, *)
extension UNAuthorizationOptions {
    static var allElement:  UNAuthorizationOptions {
        var sets: UNAuthorizationOptions = [
            UNAuthorizationOptions.badge,
            UNAuthorizationOptions.sound,
            UNAuthorizationOptions.alert,
            UNAuthorizationOptions.carPlay,
        ]
        if #available(iOS 12, *) {
            sets.insert(UNAuthorizationOptions.criticalAlert)
            sets.insert(UNAuthorizationOptions.providesAppNotificationSettings)
        }
        if #available(iOS 13, *) {
            sets.insert(UNAuthorizationOptions.announcement)
        }
        return sets
    }
}

@available(iOS, introduced: 8.0, deprecated: 10.0)
extension UIUserNotificationType {
    static var allElement: UIUserNotificationType {
        return [
            .badge,
            .alert,
            .sound,
        ]
    }
}

@available(iOS, introduced: 3.0, deprecated: 8.0)
extension UIRemoteNotificationType {
    static var allElement: UIRemoteNotificationType {
        return [
            .badge,
            .alert,
            .sound,
            .newsstandContentAvailability,
        ]
    }
}
