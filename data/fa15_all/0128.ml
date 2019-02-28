
let rec listReverse l = match l with | [] -> [] | h::t -> [listReverse t; h];;


(* fix

let rec listReverse l =
  match l with | [] -> [] | h::t -> h :: (listReverse t);;

*)

(* changed spans
(2,58)-(2,76)
h :: (listReverse t)
ConAppG (Just (TupleG (fromList [VarG,AppG (fromList [VarG])])))

*)

(* changed exprs
ConApp (Just (3,36)-(3,56)) "::" (Just (Tuple (Just (3,36)-(3,56)) [Var (Just (3,36)-(3,37)) "h",App (Just (3,41)-(3,56)) (Var (Just (3,42)-(3,53)) "listReverse") [Var (Just (3,54)-(3,55)) "t"]])) Nothing
*)

(* typed spans
(3,36)-(3,56)
*)

(* correct types
'a list
*)

(* bad types
'a list
*)
