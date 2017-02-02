//
//  Kitt.swift
//  kitt
//
//  Created by Antoine Barrault on 20/10/2016.
//
//

import Foundation
import SlackKit

class Kitt: MessageEventsDelegate {
    //
    let client :SlackClient

    init (apiToken: String) {
        self.client = SlackClient(apiToken: apiToken)
        self.client.messageEventsDelegate = self
        self.client.connectionEventsDelegate = self
        self.client.connect()
    }

    // MARK: MessageEventsDelegate
    func sent(_ message: Message, client: SlackClient) {}
    func changed(_ message: Message, client: SlackClient) {}
    func deleted(_ message: Message?, client: SlackClient) {}
    func received(_ message: Message, client: SlackClient) {
        listen(message: message)
    }

    // MARK: Kitt Internal Logic
    private func listen(message: Message) {

        if (message.subtype == "bot_message") {
            return
        }
        if let id = client.authenticatedUser?.id, let text = message.text {
            if (text.contains("<@\(id)") == true) {
                client.webAPI.sendMessage(channel: message.channel!, text: "http://giphy.com/gifs/robert-deniro-sURCRshAEZzO", success: nil, failure: { (error) in
                    print(error)
                })
            }
        }
    }
    
}

extension Kitt: ConnectionEventsDelegate {

    func connected(_ client: SlackClient) {
        print("connected :) ")
    }

    func disconnected(_ client: SlackClient) {
        print("Disconnected :( ")
        client.connect()
    }

    func connectionFailed(_ client: SlackClient, error: SlackError) {
        print("connectionFailed : \(error)")
    }


}
