
let rec digitsOfInt n =
  if n < 0
  then []
  else (match n / 10 with | 0 -> [0] | _ -> digitsOfInt n []);;


(* fix

let rec digitsOfInt n =
  if n < 0 then [] else (match n / 10 with | 0 -> [0] | _ -> digitsOfInt n);;

*)

(* changed spans
(5,44)-(5,60)
digitsOfInt n
AppG (fromList [VarG])

*)

(* changed exprs
App (Just (3,61)-(3,74)) (Var (Just (3,61)-(3,72)) "digitsOfInt") [Var (Just (3,73)-(3,74)) "n"]
*)

(* typed spans
(3,61)-(3,74)
*)

(* correct types
int list
*)

(* bad types
int list
*)
