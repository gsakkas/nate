
let rec sumList xs = match xs with | [] -> 0 | x::y -> x + sumList;;


(* fix

let rec sumList xs = match xs with | [] -> 0 | x::y -> x + (sumList y);;

*)

(* changed spans
(2,59)-(2,66)
sumList y
AppG (fromList [VarG])

*)

(* changed exprs
App (Just (2,59)-(2,70)) (Var (Just (2,60)-(2,67)) "sumList") [Var (Just (2,68)-(2,69)) "y"]
*)

(* typed spans
(2,59)-(2,70)
*)

(* correct types
int
*)

(* bad types
int
*)
