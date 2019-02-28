
let rec cat x y = match x with | [] -> [y] | h::t -> h :: (cat t y);;

let rec listReverse l = match l with | [] -> [] | h::t -> (cat l h) :: t;;


(* fix

let rec cat x y = match x with | [] -> [y] | h::t -> h :: (cat t y);;

let rec listReverse l =
  match l with | [] -> [] | h::t -> listReverse (cat l h);;

*)

(* changed spans
(4,58)-(4,72)
listReverse (cat l h)
AppG (fromList [AppG (fromList [EmptyG])])

*)

(* changed exprs
App (Just (5,36)-(5,57)) (Var (Just (5,36)-(5,47)) "listReverse") [App (Just (5,48)-(5,57)) (Var (Just (5,49)-(5,52)) "cat") [Var (Just (5,53)-(5,54)) "l",Var (Just (5,55)-(5,56)) "h"]]
*)

(* typed spans
(5,36)-(5,57)
*)

(* correct types
'a list
*)

(* bad types
'a list list
*)
