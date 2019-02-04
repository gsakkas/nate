
let rec digitsOfInt n =
  if n < 0
  then []
  else (match n with | 0 -> [0] | h::t -> [] @ (h @ (digitsOfInt t)));;


(* fix

let rec digitsOfInt n =
  if n < 0
  then []
  else (match n with | 0 -> [0] | _ -> (digitsOfInt (n / 10)) @ [n mod 10]);;

*)

(* changed spans
(5,7)-(5,69)
match n with
| 0 -> [0]
| _ -> digitsOfInt (n / 10) @ [n mod 10]
CaseG VarG (fromList [(Nothing,AppG (fromList [EmptyG])),(Nothing,ListG EmptyG Nothing)])

(5,42)-(5,44)
EMPTY
EmptyG

(5,47)-(5,68)
EMPTY
EmptyG

(5,48)-(5,49)
EMPTY
EmptyG

(5,50)-(5,51)
EMPTY
EmptyG

(5,65)-(5,66)
n / 10
BopG VarG LitG

*)
