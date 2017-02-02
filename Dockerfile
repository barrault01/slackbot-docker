FROM swiftdocker/swift
 
RUN chmod -R o+r /usr/lib/swift/CoreFoundation

COPY . /

RUN swift build 

CMD .build/debug/kitt --token="${SLACK_TOKEN}"
