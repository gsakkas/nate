
let rec sumList xs = match xs with | [] -> 0 | h::t -> h + sumList;;


(* fix

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

*)

(* changed spans
(2,59)-(2,66)
sumList t
AppG (fromList [VarG])

*)

(* changed exprs
App (Just (2,59)-(2,70)) (Var (Just (2,60)-(2,67)) "sumList") [Var (Just (2,68)-(2,69)) "t"]
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
