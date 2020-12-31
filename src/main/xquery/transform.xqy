xquery version "1.0-ml"; 
declare variable $URI as xs:string external; 
if (fn:count(fn:doc($URI)) gt 1) 
then xdmp:document-add-collections($URI, "to-process-for-mismatch")
else()