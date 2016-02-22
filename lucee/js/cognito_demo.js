/**
 * Created by larshueper on 20.02.16.
 */
(function (d, s, id) {
    var js, fjs = d.getElementsByTagName(s)[0];
    if (d.getElementById(id)) return;
    js = d.createElement(s);
    js.id = id;
    js.src = "//connect.facebook.net/en_US/sdk.js";
    fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));

var cognitoDemo = {
    POOL_ID: 'eu-west-1:e13fda06-6636-4c14-af23-c16b346ed4a6',
    FB_APP_ID: '929213660508819',
    userName: '',

    localMode: function () {
        this.POOL_ID = 'eu-west-1:0bdb7eae-88f5-4142-8e3f-e404bd1cb6c4';
        this.FB_APP_ID = '930144163749102';
    },

    init: function () {
        /*AWS.config.region = 'eu-west-1';
         AWS.config.credentials = new AWS.CognitoIdentityCredentials({
         IdentityPoolId: this.POOL_ID
         });*/
        window.fbAsyncInit = function () {
            FB.init({
                appId: cognitoDemo.FB_APP_ID,
                cookie: true,
                xfbml: true,
                version: 'v2.5'
            });
            FB.getLoginStatus(function (response) {
                cognitoDemo.statusChangeCallback(response);
            });
        };
    },

    checkLoginState: function () {
        FB.getLoginStatus(function (response) {
            cognitoDemo.statusChangeCallback(response);
        });
    },

    statusChangeCallback: function (response) {
        console.log('statusChangeCallback');
        console.log(response);
        if (response.status === 'connected') {
            this.getFacebookName();
            AWS.config.region = 'eu-west-1';
            AWS.config.credentials = new AWS.CognitoIdentityCredentials({
                IdentityPoolId: this.POOL_ID,
                regions: 'eu-west-1',
                Logins: {
                    'graph.facebook.com': response.authResponse.accessToken
                }
            });
        } else if (response.status === 'not_authorized') {
            // The person is logged into Facebook, but not your app.
            document.getElementById('status').innerHTML = 'Please log ' +
                'into this app.';
        } else {
            // The person is not logged into Facebook, so we're not sure if
            // they are logged into this app or not.
            document.getElementById('status').innerHTML = 'Please log ' +
                'into Facebook.';
        }
    },

    pushDataOnCognito: function (key, value) {
        AWS.config.credentials.get(function () {
            var syncClient = new AWS.CognitoSyncManager();
            syncClient.openOrCreateDataset('myDataset', function (err, dataset) {
                dataset.put(key, value, function (err, record) {
                    dataset.synchronize({
                        onSuccess: function (data, newRecords) {
                            console.log('sent to Cognito');
                        },
                        onFailure: function (dse) {
                            console.log(dse);
                        },
                        onConflict: function (dataset, conflicts) {
                            console.log(conflicts);
                        }
                    });

                });

            });
        });
    },

    getFacebookName: function () {
        FB.api('/me', function (response) {
            console.log('retrieved from Facebook: ' + response.name + ' (' + response.id + ')');
            document.getElementById('status').innerHTML =
                'Thanks for logging in, ' + response.name + '!';
            this.userName = response.name;
        });
    },

    getS3Content: function () {
        var s3 = new AWS.S3();
        var params = {Bucket: 'lhplayground-bucket', Key: 'untitled8.txt', Expires: 10}; // only valid for 10 seconds
        var url = s3.getSignedUrl('getObject', params, function (err, url) {
            if (url) {
                console.log("The URL is", url);
                var a = document.getElementById('s3url');
                a.href = url;
                a.innerHTML = 'Click to open';
            }
        });
    },

    putRolePolicyForS3: function () {
        var iam = new AWS.IAM();
        var params = {
            PolicyDocument: {
                "Version": "2012-10-17",
                "Statement": [
                    {
                        "Effect": "Allow",
                        "Action": [
                            "s3:GetObject"
                        ],
                        "Resource": "arn:aws:s3:::lhplayground-bucket/untitled8.txt",
                        "Condition": {}
                    }
                ]
            },
            PolicyName: "CognitoAccessOnS3",
            RoleName: "Cognito_LHPlaygroundLocalAuth_Role"
        };
        iam.putRolePolicy(params, function(err, data) {
            if (err) console.log(err, err.stack); // an error occurred
            else     console.log(data);           // successful response
        });

    }

};

