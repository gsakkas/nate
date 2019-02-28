
let rec listReverse l =
  match l with | [] -> [] | h::t -> (listReverse t) :: h;;


(* fix

let rec listReverse l = match l with | [] -> [] | h::t -> listReverse t;;

*)

(* changed spans
(3,36)-(3,56)
listReverse t
AppG (fromList [VarG])

*)

(* changed exprs
App (Just (2,58)-(2,71)) (Var (Just (2,58)-(2,69)) "listReverse") [Var (Just (2,70)-(2,71)) "t"]
*)

(* typed spans
(2,58)-(2,71)
*)

(* correct types
'a list
*)

(* bad types
'a list
*)
