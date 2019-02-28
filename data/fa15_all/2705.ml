
let rec assoc (d,k,l) =
  match l with
  | [] -> d
  | h::t -> let (a,b) = h in if a = k then b else assoc t;;


(* fix

let rec assoc (d,k,l) =
  match l with
  | [] -> d
  | h::t -> let (a,b) = h in if a = k then b else assoc (d, k, t);;

*)

(* changed spans
(5,56)-(5,57)
(d , k , t)
TupleG (fromList [VarG])

*)

(* changed exprs
Tuple (Just (5,56)-(5,65)) [Var (Just (5,57)-(5,58)) "d",Var (Just (5,60)-(5,61)) "k",Var (Just (5,63)-(5,64)) "t"]
*)

(* typed spans
(5,56)-(5,65)
*)

(* correct types
('a * 'b * ('b * 'a) list)
*)

(* bad types
('a * 'b) list
*)
