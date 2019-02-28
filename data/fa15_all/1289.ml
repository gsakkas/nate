
let rec sumList xs = match xs with | [] -> 0 | h::t -> h :: (sumList t);;


(* fix

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

*)

(* changed spans
(2,55)-(2,71)
h + sumList t
BopG VarG (AppG (fromList [EmptyG]))

*)

(* changed exprs
Bop (Just (2,55)-(2,70)) Plus (Var (Just (2,55)-(2,56)) "h") (App (Just (2,59)-(2,70)) (Var (Just (2,60)-(2,67)) "sumList") [Var (Just (2,68)-(2,69)) "t"])
*)

(* typed spans
(2,55)-(2,70)
*)

(* correct types
int
*)

(* bad types
'a list
*)
