<!---
  Created with IntelliJ IDEA.
  User: larshueper
  Date: 05.04.16
  Time: 16:01
--->
<cffunction name="stressMe" access="private" returntype="string">
    <cfargument name="depth" type="numeric" required="false" default="1">

    <cfset var returnValue = "">
    <cfif arguments.depth LT 10000>
        <cfset returnValue = arguments.depth & "," & stressMe(arguments.depth+1)>
    </cfif>

    <cfreturn returnValue>
</cffunction>

<cfoutput>#stressMe()#</cfoutput>

