
let rec listReverse l =
  match l with | [] -> [] | a::b -> (listReverse b) :: a;;


(* fix

let rec listReverse l =
  match l with | [] -> [] | a::b -> (listReverse b) @ [a];;

*)

(* changed spans
(3,36)-(3,56)
listReverse b @ [a]
AppG (fromList [AppG (fromList [EmptyG]),ListG EmptyG])

*)

(* changed exprs
App (Just (3,36)-(3,57)) (Var (Just (3,52)-(3,53)) "@") [App (Just (3,36)-(3,51)) (Var (Just (3,37)-(3,48)) "listReverse") [Var (Just (3,49)-(3,50)) "b"],List (Just (3,54)-(3,57)) [Var (Just (3,55)-(3,56)) "a"] Nothing]
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
