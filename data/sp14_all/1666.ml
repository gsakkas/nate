
let rec sumList xs =
  match xs with | [] -> 0 | f::b -> f + (sumList List.tl xs);;


(* fix

let rec sumList xs =
  match xs with | [] -> 0 | f::b -> f + (sumList (List.tl xs));;

*)

(* changed spans
(3,40)-(3,60)
sumList (List.tl xs)
AppG (fromList [AppG (fromList [EmptyG])])

*)

(* changed exprs
App (Just (3,40)-(3,62)) (Var (Just (3,41)-(3,48)) "sumList") [App (Just (3,49)-(3,61)) (Var (Just (3,50)-(3,57)) "List.tl") [Var (Just (3,58)-(3,60)) "xs"]]
*)

(* typed spans
(3,40)-(3,62)
*)

(* correct types
int
*)

(* bad types
int
*)
