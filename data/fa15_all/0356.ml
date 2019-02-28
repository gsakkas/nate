
let rec assoc (d,k,l) = match l with | h::t -> assoc d k t;;


(* fix

let rec assoc (d,k,l) = match l with | h::t -> assoc (d, k, t);;

*)

(* changed spans
(2,47)-(2,58)
assoc (d , k , t)
AppG (fromList [TupleG (fromList [EmptyG])])

*)

(* changed exprs
App (Just (2,47)-(2,62)) (Var (Just (2,47)-(2,52)) "assoc") [Tuple (Just (2,53)-(2,62)) [Var (Just (2,54)-(2,55)) "d",Var (Just (2,57)-(2,58)) "k",Var (Just (2,60)-(2,61)) "t"]]
*)

(* typed spans
(2,47)-(2,62)
*)

(* correct types
'a
*)

(* bad types
'a
*)
