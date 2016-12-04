var AWS = require('aws-sdk');
AWS.config.update(
  {
    accessKeyId: "AKIAJKU4E4UHGYLTNLOQ",
    secretAccessKey: "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",
  }
);

var s3 = AWS.S3();
s3.getObject(
  { bucket: "oatsdata", key: "originaldata/number.csv" },
  function (error, data) {
    if (error != null) {
      alert("Failed to retrieve an object: " + error);
    } else {
      console.log(data.body);
    }
  }
);