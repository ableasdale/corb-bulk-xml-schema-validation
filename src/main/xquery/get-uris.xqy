xquery version "1.0-ml";

declare variable $forest external;

let $uris := cts:uris( (), (), (), (), xdmp:forest($forest))
return (fn:count($uris),$uris)