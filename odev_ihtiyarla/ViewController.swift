//
//  ViewController.swift
//  odev_ihtiyarla
//
//  Created by MacBook on 22/02/16.
//  Copyright © 2016 MacBook. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var outlet_Btn: UIButton!
    @IBAction func bas(sender: AnyObject) {
        
        if outlet_Btn.titleLabel?.text == "DUR" {
            timer.invalidate()
            outlet_Btn.setTitle("Baslat", forState: .Normal)
        } else {
            timer = NSTimer.scheduledTimerWithTimeInterval(0.05, target:self, selector: Selector("arttir"), userInfo: nil, repeats: true)
            outlet_Btn.setTitle("DUR", forState: .Normal)
        
        }
    }
    @IBOutlet weak var yil: UILabel!
    @IBOutlet weak var gun: UILabel!
    
    var timer = NSTimer()
    var counter:Int = 0
    
    
    
    func arttir (){

        let dateFormatter2 = NSDateFormatter()
        dateFormatter2.dateFormat = "yyyy-MM-dd HH:mm"
        let dateAsString2 = "1978-11-24 05:55"
        let nzm_birthday    = dateFormatter2.dateFromString(dateAsString2)!
        
        let bugun = NSDate()
        
        let diffDateComponents = NSCalendar.currentCalendar().components([NSCalendarUnit.Year, NSCalendarUnit.Month, NSCalendarUnit.Day, NSCalendarUnit.Hour, NSCalendarUnit.Minute, NSCalendarUnit.Second, NSCalendarUnit.Nanosecond], fromDate: nzm_birthday, toDate: bugun, options: NSCalendarOptions.init(rawValue: 0))
        
        yil.text=String(diffDateComponents.year)
        gun.text="."+String(diffDateComponents.month)+String(diffDateComponents.day)+String(diffDateComponents.hour)+String(diffDateComponents.minute)+String(diffDateComponents.second)
        
        let str = String(diffDateComponents.nanosecond)
        let yazi:String = "\(str[str.startIndex.advancedBy(0)])\(str[str.startIndex.advancedBy(1)])\(str[str.startIndex.advancedBy(2)])"
        
        gun.text="."+String(diffDateComponents.month)+String(diffDateComponents.day)+String(diffDateComponents.hour)+String(diffDateComponents.minute)+String(diffDateComponents.second)+yazi
        
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        timer = NSTimer.scheduledTimerWithTimeInterval(0.05, target:self, selector: Selector("arttir"), userInfo: nil, repeats: true)
       
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

