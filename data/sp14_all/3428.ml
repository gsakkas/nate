
let rec listReverse l =
  match l with | [] -> [] | x::l -> x :: (listReverse l x);;


(* fix

let rec listReverse l =
  match l with | [] -> [] | x::l -> x :: (listReverse l);;

*)

(* changed spans
(3,41)-(3,58)
listReverse l
AppG (fromList [VarG])

*)

(* changed exprs
App (Just (3,41)-(3,56)) (Var (Just (3,42)-(3,53)) "listReverse") [Var (Just (3,54)-(3,55)) "l"]
*)

(* typed spans
(3,41)-(3,56)
*)

(* correct types
'a list
*)

(* bad types
'a list
*)
