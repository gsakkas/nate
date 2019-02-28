
let rec listReverse l = match l with | [] -> [] | h::t -> [listReverse t; h];;


(* fix

let rec listReverse l = match l with | [] -> l | h::t -> listReverse (h :: l);;

*)

(* changed spans
(2,58)-(2,76)
l
VarG

(2,74)-(2,75)
h :: l
ConAppG (Just (TupleG (fromList [VarG])))

*)

(* changed exprs
Var (Just (2,45)-(2,46)) "l"
ConApp (Just (2,69)-(2,77)) "::" (Just (Tuple (Just (2,70)-(2,76)) [Var (Just (2,70)-(2,71)) "h",Var (Just (2,75)-(2,76)) "l"])) Nothing
*)

(* typed spans
(2,45)-(2,46)
(2,69)-(2,77)
*)

(* correct types
'a list
'a list
*)

(* bad types
'a list
'a
*)
