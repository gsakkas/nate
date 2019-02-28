
let rec digitsOfInt n =
  match n <= 0 with
  | true  -> []
  | false  -> (n mod 10) :: ((digitsOfInt n) / 10);;


(* fix

let rec digitsOfInt n =
  match n <= 0 with | true  -> [] | false  -> (n mod 10) :: (digitsOfInt n);;

*)

(* changed spans
(5,28)-(5,50)
digitsOfInt n
AppG (fromList [VarG])

*)

(* changed exprs
App (Just (3,60)-(3,75)) (Var (Just (3,61)-(3,72)) "digitsOfInt") [Var (Just (3,73)-(3,74)) "n"]
*)

(* typed spans
(3,60)-(3,75)
*)

(* correct types
int list
*)

(* bad types
int
*)
