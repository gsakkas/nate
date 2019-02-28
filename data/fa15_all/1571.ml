
let rec listReverse l =
  match l with | [] -> l | hd::tail -> (listReverse tail) :: hd;;


(* fix

let rec listReverse l =
  match l with | [] -> l | hd::tail -> (listReverse tail) @ [hd];;

*)

(* changed spans
(3,39)-(3,63)
listReverse tail @ [hd]
AppG (fromList [AppG (fromList [EmptyG]),ListG EmptyG])

*)

(* changed exprs
App (Just (3,39)-(3,64)) (Var (Just (3,58)-(3,59)) "@") [App (Just (3,39)-(3,57)) (Var (Just (3,40)-(3,51)) "listReverse") [Var (Just (3,52)-(3,56)) "tail"],List (Just (3,60)-(3,64)) [Var (Just (3,61)-(3,63)) "hd"] Nothing]
*)

(* typed spans
(3,39)-(3,64)
*)

(* correct types
'a list
*)

(* bad types
'a list
*)
