<!---
  Created with IntelliJ IDEA.
  User: larshueper
  Date: 19.02.16
  Time: 16:02
--->

<cfset s3 = createObject("component", "s3").init()>
<cfoutput><pre>s3.listBucketContents('lhplayground-bucket')</pre></cfoutput>
<cftry>
    <cfset bucketContents = s3.listBucketContents('lhplayground-bucket')>
    <cfloop array="#bucketContents#" item="s3ObjectSummary">
        <cfoutput>#s3ObjectSummary.getKey()#<br></cfoutput>
    </cfloop>
    <cfdump var="#bucketContents#" expand="false">
    <cfcatch><cfoutput>#util.errorMessageAsHTML(cfcatch)#</cfoutput></cfcatch>
</cftry>

<cfoutput><pre>Content of untitled text 8.txt</pre></cfoutput>
<cftry>
    <cfset objectData = s3.getObjectContent('lhplayground-bucket','untitled text 8.txt')>
    <cfoutput>#objectData#</cfoutput>
    <cfcatch><cfoutput>#util.errorMessageAsHTML(cfcatch)#</cfoutput></cfcatch>
</cftry>

<cfoutput><pre>s3.listBucketContents('courses.awsplayground.net')</pre></cfoutput>
<cftry>
    <cfdump var="#s3.listBucketContents('courses.awsplayground.net')#" expand="false">
    <cfcatch><cfoutput>#util.errorMessageAsHTML(cfcatch)#</cfoutput></cfcatch>
</cftry>
<cfoutput><pre>s3.listBuckets()</pre></cfoutput>
<cftry>
    <cfdump var="#s3.listBuckets()#" expand="false">
    <cfcatch><cfoutput>#util.errorMessageAsHTML(cfcatch)#</cfoutput></cfcatch>
</cftry>
