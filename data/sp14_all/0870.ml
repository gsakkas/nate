
let rec sumList xs =
  match xs with | [] -> [] | xs -> (List.hd xs) + (sumList List.tl xs);;


(* fix

let rec sumList xs =
  match xs with | [] -> 0 | xs -> (List.hd xs) + (sumList (List.tl xs));;

*)

(* changed spans
(3,24)-(3,26)
0
LitG

(3,50)-(3,70)
sumList (List.tl xs)
AppG (fromList [AppG (fromList [EmptyG])])

*)

(* changed exprs
Lit (Just (3,24)-(3,25)) (LI 0)
App (Just (3,49)-(3,71)) (Var (Just (3,50)-(3,57)) "sumList") [App (Just (3,58)-(3,70)) (Var (Just (3,59)-(3,66)) "List.tl") [Var (Just (3,67)-(3,69)) "xs"]]
*)

(* typed spans
(3,24)-(3,25)
(3,49)-(3,71)
*)

(* correct types
int
int
*)

(* bad types
'a list
int
*)
