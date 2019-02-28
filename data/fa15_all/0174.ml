
let rec listReverse l =
  match l with | [] -> [] | h::tl -> (listReverse l) :: h;;


(* fix

let rec listReverse l =
  match l with | [] -> [] | h::tl -> (listReverse tl) @ [h];;

*)

(* changed spans
(3,37)-(3,57)
listReverse tl @ [h]
AppG (fromList [AppG (fromList [EmptyG]),ListG EmptyG])

*)

(* changed exprs
App (Just (3,37)-(3,59)) (Var (Just (3,54)-(3,55)) "@") [App (Just (3,37)-(3,53)) (Var (Just (3,38)-(3,49)) "listReverse") [Var (Just (3,50)-(3,52)) "tl"],List (Just (3,56)-(3,59)) [Var (Just (3,57)-(3,58)) "h"] Nothing]
*)

(* typed spans
(3,37)-(3,59)
*)

(* correct types
'a list
*)

(* bad types
'a list
*)
