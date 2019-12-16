//
//  MainWeather.swift
//  WeatherTest
//
//  Created by Abdulazim Muhammadrafiqov on 11/15/19.
//  Copyright © 2019 self. All rights reserved.
//

import UIKit

public struct MainWeather: Codable {
     var cnt : Int?
     var list : [List]?

}

struct List: Codable {
    public var clouds : Cloud?
    public var coord : Coord?
    public var dt : Int?
    public var id : Int?
    public var main : Main?
    public var name : String?
    public var sys : Sys?
    public var visibility : Int?
    public var weather : [Weather]?
    public var wind : Wind?
    }


struct Coord: Codable {
    var lon:Double?
    var lat:Double?
}
struct Main: Codable {
    var temp: Double?
    var humidity: Int?
    var pressure: Int?
    var temp_min: Double?
    var temp_max: Double?
}
struct Wind:Codable{
     var deg : Int?
     var speed : Float?
}
struct Sys:Codable {
    var type: Int?
    var id: Int?
    var message: Double?
    var country: String?
    var sunrise: Int
    var sunset: Int?
}
struct Weather:Codable {
    var id: Int?
    var main: String?
    var description: String?
    var icon: String?
}

struct Cloud: Codable {
    var all: Int?
}
