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
    var broadcast: String // broadcast
    init (ipAddress ipaddr: String, subnetMask mask: Int) {
        addr = ipaddr
        subnet = ""
        min = ""
        max = ""
        broadcast = ""
        var addrOct = Array(repeating: 0, count: 4)
        var maskOct = Array(repeating: 0, count: 4)
        var subnetOct = Array(repeating: 0, count: 4)
        var minOct = Array(repeating: 0, count: 4)
        var maxOct = Array(repeating: 0, count: 4)
        var broadOct = Array(repeating: 0, count: 4)
        
        var bitCount = mask
        for i in 0...3 {
            addrOct[i] = Int(ipaddr.components(separatedBy: ".")[i])!
            if addrOct[i] >= 256 {addrOct[i] = 255}
            if bitCount >= 8 {
                maskOct[i] = 255
                subnetOct[i] = addrOct[i]
                minOct[i] = addrOct[i]
                maxOct[i] = addrOct[i]
                broadOct[i] = addrOct[i]
            }
            else {
                if bitCount <= 0 {maskOct[i] = 0}
                else {maskOct[i] = 256 - Int(pow(Double(2), Double(8 - bitCount)))}
                subnetOct[i] = (addrOct[i] / (256 - maskOct[i])) * (256 - maskOct[i])
                if i<3 {minOct[i] = subnetOct[i]; maxOct[i] = subnetOct[i] + 256 - maskOct[i]; broadOct[i] = maxOct[i]}
                else {minOct[i] = subnetOct[i] + 1; maxOct[i] = subnetOct[i] + 254 - maskOct[i]; broadOct[i] = maxOct[i] + 1}
                if maxOct[i] == 256 {maxOct[i] = 255; broadOct[i] = maxOct[i]}
            }
            bitCount -= 8
            if i == 3 {subnet += String(subnetOct[i]); max += String(maxOct[i]); min += String(minOct[i]); broadcast += String(broadOct[i])}
            else {subnet += String(subnetOct[i]) + "."; max += String(maxOct[i]) + "."; min += String(minOct[i]) + "."; broadcast += String(broadOct[i]) + "."}
        }
        
    }
}
