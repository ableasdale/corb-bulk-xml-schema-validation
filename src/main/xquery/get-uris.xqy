xquery version "1.0-ml";

declare variable $forest external;

(: Note - initially added a safety limit "limit=100" - so we can ensure the query works first :)

let $uris := cts:uris( (), ("limit=100"), cts:not-query(cts:collection-query("passed-xml-schema-validation")), (), xdmp:forest($forest))
return (fn:count($uris),$uris)