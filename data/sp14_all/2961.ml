
let rec help n = if n > 0 then (n mod 10) + (help (n / 10)) else 0;;

let rec additivePersistence n =
  if n > 0 then 1 + (additivePersistence help n) else 0;;


(* fix

let rec help n = if n > 0 then (n mod 10) + (help (n / 10)) else 0;;

let rec additivePersistence n =
  if n > 0 then 1 + (additivePersistence (help n)) else 0;;

*)

(* changed spans
(5,20)-(5,48)
additivePersistence (help n)
AppG (fromList [AppG (fromList [EmptyG])])

*)

(* changed exprs
App (Just (5,20)-(5,50)) (Var (Just (5,21)-(5,40)) "additivePersistence") [App (Just (5,41)-(5,49)) (Var (Just (5,42)-(5,46)) "help") [Var (Just (5,47)-(5,48)) "n"]]
*)

(* typed spans
(5,20)-(5,50)
*)

(* correct types
int
*)

(* bad types
int
*)
