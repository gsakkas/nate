
let rec app x y = match x with | [] -> y | h::t -> h :: (app t y);;

let rec digitsOfInt n =
  if n >= 10 then (app digitsOfInt (n / 10)) @ [n mod 10] else [n];;


(* fix

let rec digitsOfInt n =
  if n >= 10 then (digitsOfInt (n / 10)) @ [n mod 10] else [n];;

*)

(* changed spans
(5,18)-(5,44)
digitsOfInt (n / 10)
AppG (fromList [BopG EmptyG EmptyG])

*)

(* changed exprs
App (Just (3,18)-(3,40)) (Var (Just (3,19)-(3,30)) "digitsOfInt") [Bop (Just (3,31)-(3,39)) Div (Var (Just (3,32)-(3,33)) "n") (Lit (Just (3,36)-(3,38)) (LI 10))]
*)

(* typed spans
(3,18)-(3,40)
*)

(* correct types
int list
*)

(* bad types
int list
*)
