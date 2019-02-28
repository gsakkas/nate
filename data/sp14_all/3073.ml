
let rec cat x y = match x with | [] -> [y] | h::t -> h :: (cat t y);;

let rec listReverse l =
  match l with | [] -> [] | h::t -> listReverse ((cat l h) :: t);;


(* fix

let rec cat x y = match x with | [] -> [y] | h::t -> h :: (cat t y);;

let rec listReverse l =
  match l with | [] -> [] | h::t -> listReverse (cat l h);;

*)

(* changed spans
(5,48)-(5,64)
cat l h
AppG (fromList [VarG])

*)

(* changed exprs
App (Just (5,48)-(5,57)) (Var (Just (5,49)-(5,52)) "cat") [Var (Just (5,53)-(5,54)) "l",Var (Just (5,55)-(5,56)) "h"]
*)

(* typed spans
(5,48)-(5,57)
*)

(* correct types
'a list
*)

(* bad types
'a list list
*)
