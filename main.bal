import ballerina/http;
import ballerina/log;

listener http:Listener httpDefaultListener = http:getDefaultListener();

service /scoob on httpDefaultListener {
    resource function get .() returns json|error {
        do {
            log:printInfo("Called the scoob");
            return {
                "msg": "Hey, I'm Scoob"
            };
        } on fail error err {
            // handle error
            return error("unhandled error", err);
        }
    }

}

listener http:Listener httpDefaultListener1 = http:getDefaultListener();

service /batman on httpDefaultListener1 {
    resource function get .() returns json|error {
        do {
            log:printInfo("BatMan called");
            return {
                "msg": "hey, I'm Batman"
            };
        } on fail error err {
            // handle error
            return error("unhandled error", err);
        }
    }

}

