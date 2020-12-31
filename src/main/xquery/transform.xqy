xquery version "1.0-ml";

declare variable $URI as xs:string external;

(:
if (fn:count(xdmp:validate(fn:doc($URI), "strict")//error:error) gt 1)
then xdmp:document-add-collections($URI, "to-process-for-invalid-schema")
else() :)

let $v := try {
    xdmp:validate(fn:doc($URI))
    (: validate strict { fn:doc($URI) } :)
} catch($err) {
    $err
}

    (: fn:empty(xdmp:validate(doc("/test-does-not-match.xml"))/xdmp:validation-errors)
xdmp:validate(doc("/test-does-not-match.xml"))/error:error
:)
return
    if (fn:local-name($v) eq "validation-errors" and (fn:count($v/error:error) gt 0))
    then (xdmp:log("Unable to validate: "||$URI)) (: we can't add the doc to a collection because an exception will be thrown :)
    else (xdmp:document-add-collections($URI, "passed-xml-schema-validation"))