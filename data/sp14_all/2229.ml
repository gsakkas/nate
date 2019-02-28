
let rec assoc (d,k,l) =
  match k with | [] -> d | (lk,lv)::ls -> if k = lk then lv else assoc d k ls;;


(* fix

let rec assoc (d,k,l) =
  match l with
  | [] -> d
  | (lk,lv)::ls -> if k = lk then lv else assoc (d, k, ls);;

*)

(* changed spans
(3,8)-(3,9)
l
VarG

(3,65)-(3,77)
assoc (d , k , ls)
AppG (fromList [TupleG (fromList [EmptyG])])

*)

(* changed exprs
Var (Just (3,8)-(3,9)) "l"
App (Just (5,42)-(5,58)) (Var (Just (5,42)-(5,47)) "assoc") [Tuple (Just (5,48)-(5,58)) [Var (Just (5,49)-(5,50)) "d",Var (Just (5,52)-(5,53)) "k",Var (Just (5,55)-(5,57)) "ls"]]
*)

(* typed spans
(3,8)-(3,9)
(5,42)-(5,58)
*)

(* correct types
('a * 'b) list
'a
*)

(* bad types
'a list
'a
*)
