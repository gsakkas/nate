
let rec sumList xs =
  if (List.length xs) > 0 then (List.hd xs) + (sumList List.tl xs) else 0;;


(* fix

let rec sumList xs =
  if (List.length xs) > 0 then (List.hd xs) + (sumList (List.tl xs)) else 0;;

*)

(* changed spans
(3,46)-(3,66)
sumList (List.tl xs)
AppG (fromList [AppG (fromList [EmptyG])])

*)

(* changed exprs
App (Just (3,46)-(3,68)) (Var (Just (3,47)-(3,54)) "sumList") [App (Just (3,55)-(3,67)) (Var (Just (3,56)-(3,63)) "List.tl") [Var (Just (3,64)-(3,66)) "xs"]]
*)

(* typed spans
(3,46)-(3,68)
*)

(* correct types
int
*)

(* bad types
int
*)
