//
//  ViewController.swift
//  IphonePushAnalyse
//
//  Created by companyY on 2021/6/1.
//

import UIKit

let v = UITextView(frame: .zero)

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        self.view.addSubview(v)
        v.backgroundColor = .lightGray
        v.frame = CGRect(x: self.view.bounds.origin.x, y: self.view.bounds.origin.y, width: self.view.bounds.size.width, height: 300)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let noti = UILocalNotification()
        noti.fireDate = Date(timeIntervalSinceNow: 10)
        noti.alertBody = "我出现了"
        noti.userInfo = ["id":1]
        noti.applicationIconBadgeNumber = 1
        noti.soundName = UILocalNotificationDefaultSoundName
        noti.repeatInterval = NSCalendar.Unit.weekOfYear
        UIApplication.shared.scheduleLocalNotification(noti)
    }
}

