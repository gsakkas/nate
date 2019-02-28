
let rec listReverse l = match l with | [] -> [] | h::t -> [listReverse t] @ h;;


(* fix

let rec listReverse l =
  match l with | [] -> [] | h::t -> (listReverse t) @ [h];;

*)

(* changed spans
(2,58)-(2,73)
listReverse t
AppG (fromList [VarG])

(2,58)-(2,73)
[h]
ListG VarG

*)

(* changed exprs
App (Just (3,36)-(3,51)) (Var (Just (3,37)-(3,48)) "listReverse") [Var (Just (3,49)-(3,50)) "t"]
List (Just (3,54)-(3,57)) [Var (Just (3,55)-(3,56)) "h"] Nothing
*)

(* typed spans
(3,36)-(3,51)
(3,54)-(3,57)
*)

(* correct types
'a list
'a list
*)

(* bad types
'a list
'a list
*)
