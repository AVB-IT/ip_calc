//
//  ipaddr.swift
//  IP Calculator
//
//  Created by Алексей Бубнов on 27.08.17.
//  Copyright © 2017 AVB-IT. All rights reserved.
//
// usage: var x = IpAddr(ipAddress ipaddr: String, subnetMask mask: Int)
//          x.subnet
//          x.max
//          x.min
//          x.addr

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
        var addrOct = Array(repeating: 0, count: 4)
        var maskOct = Array(repeating: 0, count: 4)
        var subnetOct = Array(repeating: 0, count: 4)
        var minOct = Array(repeating: 0, count: 4)
        var maxOct = Array(repeating: 0, count: 4)
        
        var bitCount = mask
        for i in 0...3 {
            addrOct[i] = Int(ipaddr.components(separatedBy: ".")[i])!
            //print(addrOct[i])
            if bitCount >= 8 {
                maskOct[i] = 255
                //print(maskOct[i])
                subnetOct[i] = addrOct[i]
                minOct[i] = addrOct[i]
                maxOct[i] = addrOct[i]
                //print(subnetOct[i])
            }
            else {
                if bitCount <= 0 {maskOct[i] = 0}
                else {maskOct[i] = 256 - Int(pow(Double(2), Double(8 - bitCount)))}
                subnetOct[i] = (addrOct[i] / (256 - maskOct[i])) * (256 - maskOct[i])
                //print(subnetOct[i])
                if i != 3 {minOct[i] = subnetOct[i]}
                else {minOct[i] = subnetOct[i] + 1}
                if maskOct[i] == 0 {maxOct[i] = 254}
                else {maxOct[i] = subnetOct[i] + 256 - maskOct[i]}
                
            }
            bitCount -= 8
            //print(bitCount)
            if i == 3 {subnet += String(subnetOct[i]); max += String(maxOct[i]); min += String(minOct[i])}
            else {subnet += String(subnetOct[i]) + "."; max += String(maxOct[i]) + "."; min += String(minOct[i]) + "."}
        }
        
    }
}
