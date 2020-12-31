xquery version "1.0-ml";

declare variable $forest external;

(: not query: "passed-xml-schema-validation"
cts:uris((), (), cts:not-query(cts:collection-query("passed-xml-schema-validation")))
:)

let $uris := cts:uris( (), (), cts:not-query(cts:collection-query("passed-xml-schema-validation")), (), xdmp:forest($forest))
return (fn:count($uris),$uris)