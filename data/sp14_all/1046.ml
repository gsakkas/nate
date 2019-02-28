
let rec assoc (d,k,l) =
  match l with
  | [] -> d
  | h::t -> if (fst h) = k then snd h else assoc (d k t);;


(* fix

let rec assoc (d,k,l) =
  match l with
  | [] -> d
  | h::t -> if (fst h) = k then snd h else assoc (d, k, t);;

*)

(* changed spans
(5,49)-(5,56)
(d , k , t)
TupleG (fromList [VarG])

*)

(* changed exprs
Tuple (Just (5,49)-(5,58)) [Var (Just (5,50)-(5,51)) "d",Var (Just (5,53)-(5,54)) "k",Var (Just (5,56)-(5,57)) "t"]
*)

(* typed spans
(5,49)-(5,58)
*)

(* correct types
('a * 'b * ('b * 'a) list)
*)

(* bad types
'a
*)
