<cfparam name="drop" type="numeric" default="0">

<cfif drop eq 1>
    <cfquery datasource="luceedb">
        DROP TABLE mytable
    </cfquery>
</cfif>

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

<cftry>
    <cfquery datasource="luceedb">
        CREATE TABLE mytable (
            id MEDIUMINT NOT NULL AUTO_INCREMENT,
            stuff CHAR(30) NOT NULL,
            PRIMARY KEY (id)
        )
    </cfquery>
    <p>Created mytable.</p>
    <cfcatch>
        <p>mytable is already there.</p>
    </cfcatch>
</cftry>


<cfif lCase(cgi.request_method) NEQ "post">
    <form name="myform" action="#cgi.script_name#" method="post">
        Type your stuff:
        <input type="text" name="stuff" value="">
        <p>
            <button type="submit">Submit</button>
        </p>
    </form>
<cfelse>
    <cfquery datasource="luceedb">
        INSERT INTO mytable (stuff) VALUES (<cfqueryparam cfsqltype="cf_sql_varchar" value="#FORM.stuff#">)
    </cfquery>
    <cfquery datasource="luceedb" name="q">
        SELECT * FROM mytable
    </cfquery>
    <cfdump var="#q#">
</cfif>

</body>
</html>
