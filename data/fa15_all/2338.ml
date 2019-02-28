
let rec assoc (d,k,l) =
  match l with
  | [] -> d
  | h::t -> let (f,s) = h in if k = f then s h else assoc d k t;;


(* fix

let rec assoc (d,k,l) =
  match l with
  | [] -> d
  | h::t -> let (f,s) = h in if k = f then s else assoc (d, k, t);;

*)

(* changed spans
(5,43)-(5,46)
s
VarG

(5,52)-(5,63)
assoc (d , k , t)
AppG (fromList [TupleG (fromList [EmptyG])])

*)

(* changed exprs
Var (Just (5,43)-(5,44)) "s"
App (Just (5,50)-(5,65)) (Var (Just (5,50)-(5,55)) "assoc") [Tuple (Just (5,56)-(5,65)) [Var (Just (5,57)-(5,58)) "d",Var (Just (5,60)-(5,61)) "k",Var (Just (5,63)-(5,64)) "t"]]
*)

(* typed spans
(5,43)-(5,44)
(5,50)-(5,65)
*)

(* correct types
'a
'a
*)

(* bad types
'a
'a
*)
