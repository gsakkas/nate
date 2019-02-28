
let rec listReverse l = match l with | [] -> l | h::t -> [listReverse t; h];;


(* fix

let rec listReverse l =
  match l with | [] -> l | h::t -> (listReverse t) @ [h];;

*)

(* changed spans
(2,57)-(2,75)
listReverse t @ [h]
AppG (fromList [AppG (fromList [EmptyG]),ListG EmptyG])

*)

(* changed exprs
App (Just (3,35)-(3,56)) (Var (Just (3,51)-(3,52)) "@") [App (Just (3,35)-(3,50)) (Var (Just (3,36)-(3,47)) "listReverse") [Var (Just (3,48)-(3,49)) "t"],List (Just (3,53)-(3,56)) [Var (Just (3,54)-(3,55)) "h"] Nothing]
*)

(* typed spans
(3,35)-(3,56)
*)

(* correct types
'a list
*)

(* bad types
'a list
*)
