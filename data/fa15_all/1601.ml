
let rec digitsOfInt n =
  if n <= 0 then [] else ((digitsOfInt n) mod 10) @ [n mod 10];;


(* fix

let rec digitsOfInt n = if n <= 0 then [] else (digitsOfInt n) @ [n mod 10];;

*)

(* changed spans
(3,25)-(3,49)
digitsOfInt n
AppG (fromList [VarG])

*)

(* changed exprs
App (Just (2,47)-(2,62)) (Var (Just (2,48)-(2,59)) "digitsOfInt") [Var (Just (2,60)-(2,61)) "n"]
*)

(* typed spans
(2,47)-(2,62)
*)

(* correct types
int list
*)

(* bad types
int
*)
