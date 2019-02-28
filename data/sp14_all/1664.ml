
let rec digitsOfInt n =
  if n < 0 then [] else (n mod 10) :: ((digitsOfInt n) * 10);;


(* fix

let rec digitsOfInt n = if n < 0 then [] else (n mod 10) :: (digitsOfInt n);;

*)

(* changed spans
(3,38)-(3,60)
digitsOfInt n
AppG (fromList [VarG])

*)

(* changed exprs
App (Just (2,60)-(2,75)) (Var (Just (2,61)-(2,72)) "digitsOfInt") [Var (Just (2,73)-(2,74)) "n"]
*)

(* typed spans
(2,60)-(2,75)
*)

(* correct types
int list
*)

(* bad types
int
*)
