import { check } from "k6";
import http from "k6/http";

export let options = {
    vus: 10,
    duration: "1m",
    thresholds: {
        http_req_duration: ["p(95)<120000"]
    },
    noConnectionReuse: true
};

const cat = open("/var/loadtest/uploads/test.jpg", "b");

export default function () {
    var data = { image: http.file(cat, "test.jpg") };
    let res = http.post(`${__ENV.UPLOAD_URL}`, data);
    check(res, {
        "is status 200": (r) => r.status === 200
    });
};
