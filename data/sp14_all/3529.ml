
let rec listReverse l =
  match l with | [] -> [] | _::tl -> (listReverse tl) + tl;;


(* fix

let rec listReverse l = match l with | [] -> [] | _::tl -> listReverse tl;;

*)

(* changed spans
(3,37)-(3,58)
listReverse tl
AppG (fromList [VarG])

*)

(* changed exprs
App (Just (2,59)-(2,73)) (Var (Just (2,59)-(2,70)) "listReverse") [Var (Just (2,71)-(2,73)) "tl"]
*)

(* typed spans
(2,59)-(2,73)
*)

(* correct types
'a list
*)

(* bad types
int
*)
