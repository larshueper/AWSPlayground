/**
 * Created with IntelliJ IDEA.
 * User: larshueper
 * Date: 19.02.16
 * Time: 15:57
*/
component {
    property any s3Client;
    property any awsCredentials;

    public s3 function init(string awsAccessKey='', string awsSecretKey='') {
        if (arguments.awsAccessKey!='') {
            variables.awsCredentials = createObject("java", "com.amazonaws.auth.BasicAWSCredentials").init(arguments.awsAccessKey,arguments.awsSecretKey);
            variables.s3Client = CreateObject("java","com.amazonaws.services.s3.AmazonS3Client").init(variables.awsCredentials);
        } else {
            variables.s3Client = CreateObject("java","com.amazonaws.services.s3.AmazonS3Client").init();
        }
        return this;
    }

    public array function listBuckets() {
        var returnValue = arrayNew(1);
        var buckets = variables.s3Client.listBuckets();
        var buckets_iterator = buckets.listIterator();
        while (buckets_iterator.hasNext() ) {
            var bucket = buckets_iterator.next();
            arrayAppend(returnValue,bucket.getName());
        }
        return returnValue;
    }

    public any function listBucketContents(required string bucketName) {
        var returnValue = arrayNew(1);
        var contents = variables.s3Client.listObjects(arguments.bucketName);
        var objects = contents.getObjectSummaries();
        var iterator = objects.listIterator();
        while (iterator.hasNext()) {
            var item = iterator.next();
            arrayAppend(returnValue,item);
        }
        return returnValue;
    }

    public string function getObjectContent(required string bucketName, required string objectKey) {
        var objectRequest = createObject("java", "com.amazonaws.services.s3.model.GetObjectRequest").init(arguments.bucketName,arguments.objectKey);
        var s3Object = variables.s3Client.getObject(objectRequest);
        var objectData = s3Object.getObjectContent();
        return objectData;
    }

}
