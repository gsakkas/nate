
let rec wwhile (f,b) =
  let (b',c') = f b in match c' with | false  -> b' | true  -> wwhile (f b');;


(* fix

let rec wwhile (f,b) = let (b',c') = f b in match c' with | false  -> b';;

*)

(* changed spans
(3,23)-(3,76)
match c' with
| false -> b'
CaseG VarG (fromList [(Nothing,VarG)])

(3,63)-(3,76)
EMPTY
EmptyG

*)

(* typed spans
(2,44)-(2,72)
*)

(* typed spans
'a
*)

(* typed spans
'a
*)
