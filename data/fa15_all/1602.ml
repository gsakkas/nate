
let rec listReverse l =
  match l with | [] -> [] | h::t -> (listReverse l) :: h;;


(* fix

let rec listReverse l =
  match l with | [] -> [] | h::t -> (listReverse l) @ [h];;

*)

(* changed spans
(3,36)-(3,56)
listReverse l @ [h]
AppG (fromList [AppG (fromList [EmptyG]),ListG EmptyG])

*)

(* changed exprs
App (Just (3,36)-(3,57)) (Var (Just (3,52)-(3,53)) "@") [App (Just (3,36)-(3,51)) (Var (Just (3,37)-(3,48)) "listReverse") [Var (Just (3,49)-(3,50)) "l"],List (Just (3,54)-(3,57)) [Var (Just (3,55)-(3,56)) "h"] Nothing]
*)

(* typed spans
(3,36)-(3,57)
*)

(* correct types
'a list
*)

(* bad types
'a list
*)
