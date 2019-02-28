
let rec cat x y = match x with | [] -> [y] | h::t -> h :: (cat t y);;

let rec listReverse l = match l with | [] -> [] | h::t -> cat listReverse t h;;


(* fix

let rec cat x y = match x with | [] -> [y] | h::t -> h :: (cat t y);;

let rec listReverse l =
  match l with | [] -> [] | h::t -> cat (listReverse t) h;;

*)

(* changed spans
(4,58)-(4,77)
cat (listReverse t) h
AppG (fromList [VarG,AppG (fromList [EmptyG])])

*)

(* changed exprs
App (Just (5,36)-(5,57)) (Var (Just (5,36)-(5,39)) "cat") [App (Just (5,40)-(5,55)) (Var (Just (5,41)-(5,52)) "listReverse") [Var (Just (5,53)-(5,54)) "t"],Var (Just (5,56)-(5,57)) "h"]
*)

(* typed spans
(5,36)-(5,57)
*)

(* correct types
'a list
*)

(* bad types
'a list
*)
