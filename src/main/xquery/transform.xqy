xquery version "1.0-ml";

declare variable $URI as xs:string external;

let $v := try {
    xdmp:validate(fn:doc($URI))
} catch($err) {
    $err
}

return
    if (fn:local-name($v) eq "validation-errors" and (fn:count($v/error:error) gt 0))
    then (xdmp:log("Unable to validate: "||$URI)) (: we can't add the doc to a collection because an exception will be thrown :)
    else (xdmp:document-add-collections($URI, "passed-xml-schema-validation"))