//
//  ViewController.swift
//  SendSMSFromApp
//
//  Created by Ayokunle Fatokimi on 30/10/2021.
//

import UIKit
import MessageUI

class ViewController: UIViewController {
    
    //MARK: IBOutlets
    @IBOutlet weak var sendMsgBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupView()
    }
    
    func setupView() {
        sendMsgBtn.addTarget(self, action: #selector(sendMessage), for: .touchUpInside)
    }
}

extension ViewController: MFMessageComposeViewControllerDelegate {
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
        controller.dismiss(animated: true)
    }
    
    @objc func sendMessage() {
        if (MFMessageComposeViewController.canSendText()) {
            let composerVC = MFMessageComposeViewController()
            composerVC.messageComposeDelegate = self
            composerVC.body = ""
            let number = "234"
            composerVC.recipients = ["\(number)"]
            self.present(composerVC, animated: true)
        } else {
            
            /// if device can not send sms
            
            /// display alert
            
            /// or force display message app
            let sms: String = "sms:08992342342&body=Hello Abc How are You I am ios developer."
            let strURL: String = sms.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
            UIApplication.shared.open(URL.init(string: strURL)!, options: [:], completionHandler: nil)
        }
    }
}


