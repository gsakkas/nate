
let rec digitsOfInt n = let l = [] in if n < 0 then l;;


(* fix

let rec digitsOfInt n = let l = [] in if n < 0 then l else l;;

*)

(* changed spans
(2,38)-(2,53)
l
VarG

*)

(* changed exprs
Var (Just (2,59)-(2,60)) "l"
*)

(* typed spans
(2,59)-(2,60)
*)

(* correct types
'a list
*)

(* bad types
unit
*)
