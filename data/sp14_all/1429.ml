
let append x l =
  let rec helper x acc =
    match x with | [] -> acc | h::t -> helper t (h :: acc) in
  helper x l;;

let rec listReverse l =
  match l with | [] -> [] | h::t -> append listReverse t [h];;


(* fix

let append x l =
  let rec helper x acc =
    match x with | [] -> acc | h::t -> helper t (h :: acc) in
  helper x l;;

let rec listReverse l =
  match l with | [] -> [] | h::t -> append (listReverse t) [h];;

*)

(* changed spans
(8,36)-(8,60)
append (listReverse t) [h]
AppG (fromList [AppG (fromList [EmptyG]),ListG EmptyG])

*)

(* changed exprs
App (Just (8,36)-(8,62)) (Var (Just (8,36)-(8,42)) "append") [App (Just (8,43)-(8,58)) (Var (Just (8,44)-(8,55)) "listReverse") [Var (Just (8,56)-(8,57)) "t"],List (Just (8,59)-(8,62)) [Var (Just (8,60)-(8,61)) "h"] Nothing]
*)

(* typed spans
(8,36)-(8,62)
*)

(* correct types
'a list
*)

(* bad types
'a list
*)
