
let rec digitsOfInt n =
  let returnList = [] in
  if n < 0 then [] else returnList @ ((n mod 10) digitsOfInt (n /. 10));;


(* fix

let rec digitsOfInt n =
  let returnList = [] in if n < 0 then [] else digitsOfInt (n / 10);;

*)

(* changed spans
(4,24)-(4,71)
digitsOfInt (n / 10)
AppG (fromList [BopG EmptyG EmptyG])

(4,61)-(4,70)
n / 10
BopG VarG LitG

*)

(* typed spans
(3,47)-(3,67)
(3,59)-(3,67)
*)

(* typed spans
'a list
int
*)

(* typed spans
'a list
float
*)
