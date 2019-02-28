
let rec digitsOfInt n = match n with | _ -> if n < 0 then [];;


(* fix

let rec digitsOfInt n = match n with | _ when n < 0 -> [];;

*)

(* changed spans
(2,44)-(2,60)
n < 0
BopG VarG LitG

(2,44)-(2,60)
EMPTY
EmptyG

*)

(* changed exprs
Bop (Just (2,46)-(2,51)) Lt (Var (Just (2,46)-(2,47)) "n") (Lit (Just (2,50)-(2,51)) (LI 0))
Var (Just (2,44)-(2,60)) "EMPTY"
*)

(* typed spans
(2,46)-(2,51)
*)

(* correct types
bool
*)

(* bad types
unit
*)
