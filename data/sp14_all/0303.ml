
let rec append l1 l2 = match l1 with | [] -> l2 | h::t -> h :: (append t l2);;

let rec listReverse l =
  match l with | [] -> [] | h::t -> append (listReverse t [h]);;


(* fix

let rec listReverse l =
  match l with | [] -> [] | h::t -> (listReverse t) @ [h];;

*)

(* changed spans
(5,36)-(5,62)
listReverse t @ [h]
AppG (fromList [AppG (fromList [EmptyG]),ListG EmptyG])

*)

(* changed exprs
App (Just (3,36)-(3,57)) (Var (Just (3,52)-(3,53)) "@") [App (Just (3,36)-(3,51)) (Var (Just (3,37)-(3,48)) "listReverse") [Var (Just (3,49)-(3,50)) "t"],List (Just (3,54)-(3,57)) [Var (Just (3,55)-(3,56)) "h"] Nothing]
*)

(* typed spans
(3,36)-(3,57)
*)

(* correct types
'a list
*)

(* bad types
'a list -> 'a list
*)
