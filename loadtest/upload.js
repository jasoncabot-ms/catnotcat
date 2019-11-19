import { check } from "k6";
import http from "k6/http";

const cat = open("/var/loadtest/uploads/test.jpg", "b");

export default function() {
    var data = { image: http.file(cat, "test.jpg") };
    let res = http.post(`${__ENV.UPLOAD_URL}`, data);
    check(res, {
        "is status 200": (r) => r.status === 200
    });
};
