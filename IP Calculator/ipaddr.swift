//
//  ipaddr.swift
//  IP Calculator
//
//  Created by Алексей Бубнов on 27.08.17.
//  Copyright © 2017 AVB-IT. All rights reserved.
//

import Foundation

struct IpAddr {
    var addr: String // ip address in string sormat
    var subnet: String //Subnet address
    var min: String //min avalible ip address
    var max: String //max avalible ip address
    init (ipAddress ipaddr: String, subnetMask mask: Int) {
        addr = ipaddr
        subnet = ""
        min = ""
        max = ""
        var addrOct = [UInt8]()
        var maskOct = [UInt8]()
        var subnetOct = [UInt8]()
        var minOct = [UInt8]()
        var maxOct = [UInt8]()
        
        var bitCount = mask
        for i in 0...3 {
            addrOct[i] = UInt8(ipaddr.components(separatedBy: ".")[i])!
            if bitCount >= 8 {
                maskOct[i] = 255
                subnetOct[i] = addrOct[i]
                minOct[i] = addrOct[i]
                maxOct[i] = addrOct[i]
            }
            else {
                maskOct[i] = UInt8(pow(Double(2), Double(bitCount)))
                if maskOct[i] == 1 {maskOct[i] = 0}
                subnetOct[i] = (addrOct[i] / maskOct[i]) * maskOct[i]
                if subnetOct[i] == 0 {
                    minOct[i] = 0
                }
                else {
                    minOct[i] = subnetOct[i] + 1
                }
                maxOct[i] = 255
            }
            bitCount -= 8
            if i == 3 {subnet = String(subnetOct[i]); max = String(maxOct[i]); min = String(minOct[i])}
            else {subnet = String(subnetOct[i]) + "."; max = String(maxOct[i]) + "."; min = String(minOct[i])}
        }
        
    }
}
