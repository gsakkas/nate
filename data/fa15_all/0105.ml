
let rec digitsOfInt n =
  let return = [] in
  if n < 0 then return else (digitsOfInt (-1) (n mod 10)) :: return;;


(* fix

let rec digitsOfInt n =
  let return = [] in if n < 0 then return else (n mod 10) :: return;;

*)

(* changed spans
(4,28)-(4,57)
n mod 10
BopG VarG LitG

*)

(* changed exprs
Bop (Just (3,47)-(3,57)) Mod (Var (Just (3,48)-(3,49)) "n") (Lit (Just (3,54)-(3,56)) (LI 10))
*)

(* typed spans
(3,47)-(3,57)
*)

(* correct types
int
*)

(* bad types
'a
*)
