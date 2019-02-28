
let rec digitsOfInt n =
  let return = [] in if n < 0 then return else return :: 1;;


(* fix

let rec digitsOfInt n =
  let return = [] in if n < 0 then return else 1 :: return;;

*)

(* changed spans
(3,57)-(3,58)
return
VarG

*)

(* changed exprs
Var (Just (3,52)-(3,58)) "return"
*)

(* typed spans
(3,52)-(3,58)
*)

(* correct types
int list
*)

(* bad types
int
*)
