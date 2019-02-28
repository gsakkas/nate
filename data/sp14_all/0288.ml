
let rec listReverse l =
  match l with | [] -> [] | h::t -> (listReverse t) :: l;;


(* fix

let rec listReverse l =
  match l with | [] -> [] | h::t -> (listReverse t) @ [];;

*)

(* changed spans
(3,36)-(3,56)
listReverse t @ []
AppG (fromList [AppG (fromList [EmptyG]),ListG EmptyG])

*)

(* changed exprs
App (Just (3,36)-(3,56)) (Var (Just (3,52)-(3,53)) "@") [App (Just (3,36)-(3,51)) (Var (Just (3,37)-(3,48)) "listReverse") [Var (Just (3,49)-(3,50)) "t"],List (Just (3,54)-(3,56)) [] Nothing]
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
