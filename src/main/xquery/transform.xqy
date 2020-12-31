xquery version "1.0-ml";

declare variable $URI as xs:string external;

if (fn:count(xdmp:validate(fn:doc($URI), "strict")//error:error) gt 1)
then xdmp:document-add-collections($URI, "to-process-for-invalid-schema")
else()