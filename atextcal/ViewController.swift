//
//  ViewController.swift
//  atextcal
//
//  Created by s20171106184 on 2018/11/21.
//  Copyright © 2018 s20171106184. All rights reserved.
//

import UIKit
class number
{
    var top:Int = -1
    var num1 = [Double](repeating: 0, count: 100)
    func push1(sub4:Double){
        top = top+1
        num1[top]=sub4
       
    }
    func pop1()->(Bool,nums:Double){
        var nums:Double = 0
        if top > -1{
            nums = num1[top]
            top = top-1
            return (true,nums)
        }
        else{
            return (false,nums)
        }
    }
}
class signal
{
    var top:Int = -1
    var sig = [Int](repeating: 0, count: 100)
    func push1(sigs:Int){
        top = top+1
        sig[top]=sigs
        
    }
    func pop1()->(Bool,sigs:Int){
        var sigs:Int = 0
        var b:Bool = true
        if top > -1{
            sigs = sig[top]
            top = top-1
            return (b,sigs)
        }
        else{
            b = false
            return (b,sigs)
            
        }
    }
}

class ViewController: UIViewController {
    var i = 0
    @IBOutlet weak var resul: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    var num = number()
    var sign = signal()
    @IBAction func show(_ sender: Any) {
        resul.text = "6+(3/5+4)*3-1="
        var tmp: String = resul.text!
        var count = tmp.characters.count
        var frnum:Int = 0
        var afnum:Int = 0
        var index3 = tmp.index(tmp.startIndex, offsetBy: frnum)
        var index4 = tmp.index(tmp.startIndex, offsetBy: afnum)
        var sub4 = tmp[index3..<index4]
        var cnum1: Double = 0
        var op1:Double = 0
        var op2:Double = 0
        var op3:Double = 0
        var sig1:Int = 0
        var sig:Int = 0
        var flag:Int = 1
        /*print(count)
        if count != 0 {
            print("判断string长度不为0，不是空")
        }*/
        for c in tmp.characters {
            if c == "+"{
                if flag == 1{
                index3 = tmp.index(tmp.startIndex, offsetBy: frnum)
                index4 = tmp.index(tmp.startIndex, offsetBy: afnum)
                sub4 = tmp[index3..<index4]
                cnum1 = Double(sub4)!
                    num.push1(sub4:cnum1)}
                else
                {
                    flag = 1
                }
                 frnum = afnum + 1
                sig = 1
                if sign.top == -1{
                    sign.push1(sigs: sig)
                }
               else if sign.sig[sign.top] > sig{
                    op2 = num.pop1().nums
                    op1 = num.pop1().nums
                    sig1 = sign.pop1().sigs
                    if sig1 == 2{
                        op3 = op1 - op2
                    }
                    if sig1 == 3{
                        op3 = op1 * op2
                    }
                    if sig1 == 4{
                        op3 = op1 / op2
                    }
                    num.push1(sub4: op3)
                    sign.push1(sigs: sig)
                }
                else{
                    sign.push1(sigs: sig)
                }
            }
            if c == "-"{
                if flag == 1{
                    index3 = tmp.index(tmp.startIndex, offsetBy: frnum)
                    index4 = tmp.index(tmp.startIndex, offsetBy: afnum)
                    sub4 = tmp[index3..<index4]
                    cnum1 = Double(sub4)!
                    num.push1(sub4:cnum1)}
                else
                {
                    flag = 1
                }
                frnum = afnum + 1
                sig = 2
                if sign.top == -1{
                    sign.push1(sigs: sig)
                }
                else if sign.sig[sign.top] > sig{
                    op2 = num.pop1().nums
                    op1 = num.pop1().nums
                    sig1 = sign.pop1().sigs
                    if sig1 == 3{
                        op3 = op1 * op2
                    }
                    if sig1 == 4{
                        op3 = op1 / op2
                    }
                    num.push1(sub4: op3)
                    sign.push1(sigs: sig)
                }
                else{
                    sign.push1(sigs: sig)
                }
            }
            if c == "*"{
                if flag == 1{
                    index3 = tmp.index(tmp.startIndex, offsetBy: frnum)
                    index4 = tmp.index(tmp.startIndex, offsetBy: afnum)
                    sub4 = tmp[index3..<index4]
                    cnum1 = Double(sub4)!
                    num.push1(sub4:cnum1)}
                else
                {
                    flag = 1
                }
                frnum = afnum + 1
                sig = 3
                if sign.top == -1{
                    sign.push1(sigs: sig)
                }
                else if sign.sig[sign.top] > sig{
                    op2 = num.pop1().nums
                    op1 = num.pop1().nums
                    sig1 = sign.pop1().sigs
                    if sig1 == 4{
                        op3 = op1 / op2
                    }
                    num.push1(sub4: op3)
                    sign.push1(sigs: sig)
                }
                else{
                    sign.push1(sigs: sig)
                }
            }
            if c == "/"{
                if flag == 1{
                    index3 = tmp.index(tmp.startIndex, offsetBy: frnum)
                    index4 = tmp.index(tmp.startIndex, offsetBy: afnum)
                    sub4 = tmp[index3..<index4]
                    cnum1 = Double(sub4)!
                    num.push1(sub4:cnum1)}
                else
                {
                    flag = 1
                }
                frnum = afnum + 1
                sig = 4
                sign.push1(sigs: sig)
            }
            if c == "("{
                frnum = afnum + 1
                sig = -2
                sign.push1(sigs: sig)
            }
            if c == ")"{
                index3 = tmp.index(tmp.startIndex, offsetBy: frnum)
                index4 = tmp.index(tmp.startIndex, offsetBy: afnum)
                sub4 = tmp[index3..<index4]
                frnum = afnum + 1
                cnum1 = Double(sub4)!
                num.push1(sub4:cnum1)
                //sig = -4
                while sign.sig[sign.top] != -2{
                    op2 = num.pop1().nums
                    print(op2)
                    op1 = num.pop1().nums
                    print(op1)
                    sig1 = sign.pop1().sigs
                    if sig1 == 1{
                        op3 = op1 + op2
                    }
                    if sig1 == 2{
                        op3 = op1 - op2
                    }
                    if sig1 == 3{
                        op3 = op1 * op2
                    }
                    if sig1 == 4{
                        op3 = op1 / op2
                    }
                    num.push1(sub4: op3)
                }
                sign.pop1()
                flag = 0
            }
            if c == "="{
                if flag == 1{
                    index3 = tmp.index(tmp.startIndex, offsetBy: frnum)
                    index4 = tmp.index(tmp.startIndex, offsetBy: afnum)
                    sub4 = tmp[index3..<index4]
                    cnum1 = Double(sub4)!
                    num.push1(sub4:cnum1)}
                else
                {
                    flag = 1
                }
                frnum = afnum + 1
                while num.top > -1 && sign.top > -1{
                    op2 = num.pop1().nums
                   // print(op2)
                    op1 = num.pop1().nums
                    //print(op1)
                    sig1 = sign.pop1().sigs
                    if sig1 == 1{
                        op3 = op1 + op2
                    }
                    if sig1 == 2{
                        op3 = op1 - op2
                    }
                    if sig1 == 3{
                        op3 = op1 * op2
                    }
                    if sig1 == 4{
                        op3 = op1 / op2
                    }
                    num.push1(sub4: op3)
                }
            }
            count = count - 1
            afnum = afnum + 1
        }
        print(num.pop1().nums)
       /*for op in tmp.characters {
            var mk = num.pop1()
            var qr = sign.pop1()
        if mk.0{
            print(mk.nums)
        }
        if qr.0{
            print(qr.sigs)
        }
    }*/
    }
    
}
