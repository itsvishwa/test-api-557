import ballerina/http;
import ballerina/log;

listener http:Listener httpDefaultListener = http:getDefaultListener();

service / on httpDefaultListener {
    resource function get greet() returns json|error {
        do {
            log:printInfo("Called greet API");
            return {
                "msg": "Greeting"
            };
        } on fail error err {
            // handle error
            return error("unhandled error", err);
        }
    }

}

listener http:Listener httpDefaultListener1 = http:getDefaultListener();

service /health on httpDefaultListener1 {
    resource function get .() returns json|error {
        do {
            log:printInfo("Called Health API");
            return {
                "ok": true
            };
        } on fail error err {
            // handle error
            return error("unhandled error", err);
        }
    }

}

