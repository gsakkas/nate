
let rec listReverse l =
  match l with | [] -> [] | hd::tl -> [listReverse tl; hd];;


(* fix

let rec listReverse l =
  match l with | [] -> [] | hd::tl -> (listReverse tl) @ [hd];;

*)

(* changed spans
(3,38)-(3,58)
listReverse tl @ [hd]
AppG (fromList [AppG (fromList [EmptyG]),ListG EmptyG])

*)

(* changed exprs
App (Just (3,38)-(3,61)) (Var (Just (3,55)-(3,56)) "@") [App (Just (3,38)-(3,54)) (Var (Just (3,39)-(3,50)) "listReverse") [Var (Just (3,51)-(3,53)) "tl"],List (Just (3,57)-(3,61)) [Var (Just (3,58)-(3,60)) "hd"] Nothing]
*)

(* typed spans
(3,38)-(3,61)
*)

(* correct types
'a list
*)

(* bad types
'a list
*)
