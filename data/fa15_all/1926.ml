
let rec digitsOfInt n =
  if n < 0 then print_int 0 else (print_int n) / 10; digitsOfInt (n / 10);;


(* fix

let rec digitsOfInt n =
  if n < 0 then print_int 0 else print_int (n / 10); digitsOfInt (n / 10);;

*)

(* changed spans
(3,33)-(3,51)
print_int (n / 10)
AppG (fromList [BopG EmptyG EmptyG])

*)

(* changed exprs
App (Just (3,33)-(3,51)) (Var (Just (3,33)-(3,42)) "print_int") [Bop (Just (3,43)-(3,51)) Div (Var (Just (3,44)-(3,45)) "n") (Lit (Just (3,48)-(3,50)) (LI 10))]
*)

(* typed spans
(3,33)-(3,51)
*)

(* correct types
unit
*)

(* bad types
int
*)
