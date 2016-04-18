<!---
  Created with IntelliJ IDEA.
  User: larshueper
  Date: 18.04.16
  Time: 22:19
--->
<cfhttp url="http://169.254.169.254/latest/meta-data/iam/security-credentials/" method="get"></cfttp>
<cfoutput>#cfhttp.filecontent#</cfoutput>

