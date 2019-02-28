
let rec listReverse l = match l with | [] -> [] | a::l' -> listReverse @ [a];;


(* fix

let rec listReverse l =
  match l with | [] -> [] | a::l' -> (listReverse l') @ [a];;

*)

(* changed spans
(2,59)-(2,70)
listReverse l'
AppG (fromList [VarG])

*)

(* changed exprs
App (Just (3,37)-(3,53)) (Var (Just (3,38)-(3,49)) "listReverse") [Var (Just (3,50)-(3,52)) "l'"]
*)

(* typed spans
(3,37)-(3,53)
*)

(* correct types
'a list
*)

(* bad types
'a list
*)
