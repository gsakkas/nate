
let rec listReverse l =
  match l with | [] -> l | h::t -> listReverse (h :: l) t;;


(* fix

let rec listReverse l = match l with | [] -> l | h::t -> listReverse (h :: l);;

*)

(* changed spans
(3,35)-(3,57)
listReverse (h :: l)
AppG (fromList [ConAppG (Just (TupleG (fromList [VarG])))])

*)

(* changed exprs
App (Just (2,57)-(2,77)) (Var (Just (2,57)-(2,68)) "listReverse") [ConApp (Just (2,69)-(2,77)) "::" (Just (Tuple (Just (2,70)-(2,76)) [Var (Just (2,70)-(2,71)) "h",Var (Just (2,75)-(2,76)) "l"])) Nothing]
*)

(* typed spans
(2,57)-(2,77)
*)

(* correct types
'a list
*)

(* bad types
'a list
*)
