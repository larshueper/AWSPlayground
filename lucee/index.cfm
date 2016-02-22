<cfhttp url="http://169.254.169.254/latest/meta-data/public-ipv4" result="myIP">
<cfhttp url="http://169.254.169.254/latest/meta-data/local-hostname" result="myHostname">
<cfset publicIP = myIP.filecontent>
<cfset hostName = myHostname.filecontent>

<cfoutput>
    <h1>I am server #hostName# (IP: #publicIP#)</h1>
    <h2>I have been called from: #cgi.remote_addr#</h2>
</cfoutput>
