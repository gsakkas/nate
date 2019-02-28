
let rec digitsOfInt n =
  let return = [] in
  if n <> 0
  then ((n mod 10) :: return; (digitsOfInt (n / 10)) @ return; print_int n)
  else return;;


(* fix

let rec digitsOfInt n =
  let return = [] in
  if n <> 0
  then ((n mod 10) :: return; print_int n; (digitsOfInt (n / 10)) @ return)
  else return;;

*)

(* changed spans
(5,30)-(5,61)
print_int n
AppG (fromList [VarG])

*)

(* changed exprs
App (Just (5,30)-(5,41)) (Var (Just (5,30)-(5,39)) "print_int") [Var (Just (5,40)-(5,41)) "n"]
*)

(* typed spans
(5,30)-(5,41)
*)

(* correct types
unit
*)

(* bad types
int list
*)
