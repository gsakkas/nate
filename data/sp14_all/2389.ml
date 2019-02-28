
let rec digOfIntHelper h = match h > 0 with | true  -> 1 | false  -> 0;;

let rec digitsOfInt n =
  match n > 0 with | true  -> [digOfIntHelper; n mod 10] | false  -> [];;


(* fix

let rec digOfIntHelper h = match h > 0 with | true  -> 1 | false  -> 0;;

let rec digitsOfInt n =
  match n > 0 with | true  -> [digOfIntHelper n; n mod 10] | false  -> [];;

*)

(* changed spans
(5,31)-(5,45)
digOfIntHelper n
AppG (fromList [VarG])

*)

(* changed exprs
App (Just (5,31)-(5,47)) (Var (Just (5,31)-(5,45)) "digOfIntHelper") [Var (Just (5,46)-(5,47)) "n"]
*)

(* typed spans
(5,31)-(5,47)
*)

(* correct types
int
*)

(* bad types
int -> int
*)
