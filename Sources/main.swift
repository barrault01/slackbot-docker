import Foundation

fileprivate extension Sequence where Iterator.Element == String {
    func value(for string: String) -> String? {
        for item in self {
            let search = "--\(string)="
            if item.hasPrefix(search) {
                return item.components(separatedBy: search).joined(separator: "")
            }
        }

        return nil
    }
}

guard let token = CommandLine.arguments.value(for: "token") else {
    print("Please pass slack token --token=SLACK_TOKEN")
    exit(1)
}

let slackBot = SlackBot(apiToken: token)

RunLoop.main.run()
