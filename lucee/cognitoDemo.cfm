<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Facebook and Cognito Demo</title>
    <script type="text/javascript" src="js/aws-sdk-2.2.37.js"></script>
    <script type="text/javascript" src="js/amazon-cognito.min.js"></script>
    <script type="text/javascript" src="js/cognito_demo.js"></script>
</head>
<body>
<h1>Facebook Login</h1>

<fb:login-button scope="public_profile,email" onlogin="cognitoDemo.checkLoginState();">
</fb:login-button>

<div id="status">
</div>

<p><button onclick="cognitoDemo.pushDataOnCognito('facebook-name',cognitoDemo.userName)">Send username to Cognito</button></p>

<p>
    Key: <input type="text" id="key"><br>
    Value: <input type="text" id="value"><br>
    <button onclick="cognitoDemo.pushDataOnCognito(document.getElementById('key').value,document.getElementById('value').value)">Send to Cognito</button>
</p>

<h1>Get S3 Content</h1>
<p>
    <button onclick="cognitoDemo.getS3Content()">Get contents from S3</button>
    <a id="s3url" target="_blank" href=""></a>
</p>

<!---
<h1>IAM Actions</h1>
<p><button onclick="cognitoDemo.putRolePolicyForS3()">Grant access on S3</button> </p>
--->
<script type="text/javascript">
    // cognitoDemo.localMode();
    cognitoDemo.init();
</script>
</body>
</html>

