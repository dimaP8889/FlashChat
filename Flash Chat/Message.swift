//
//  Message.swift
//  Flash Chat
//
//  This is the model class that represents the blueprint for a message
import UIKit

class Message {
    
    //TODO: Messages need a messageBody and a sender variable
    var sender : String = ""
    var messageBody : String = ""
    var backGroundColor : UIColor = UIColor.green
    
    init(text message : String, sender name: String) {
        self.sender = name
        self.messageBody = message
    }
}
