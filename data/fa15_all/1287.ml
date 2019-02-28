
let rec listReverse l =
  match l with | [] -> [] | h::t -> [listReverse t] @ [h];;


(* fix

let rec listReverse l =
  match l with | [] -> [] | h::t -> (listReverse t) @ [h];;

*)

(* changed spans
(3,36)-(3,51)
listReverse t
AppG (fromList [VarG])

*)

(* changed exprs
App (Just (3,36)-(3,51)) (Var (Just (3,37)-(3,48)) "listReverse") [Var (Just (3,49)-(3,50)) "t"]
*)

(* typed spans
(3,36)-(3,51)
*)

(* correct types
'a list
*)

(* bad types
'a list
*)
