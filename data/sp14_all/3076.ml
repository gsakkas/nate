
let rec cat x y = match x with | [] -> [y] | h::t -> h :: (cat t y);;

let rec listReverse l =
  match l with | [] -> [] | h::t -> cat l (listReverse t h);;


(* fix

let rec cat x y = match x with | [] -> [y] | h::t -> h :: (cat t y);;

let rec listReverse l =
  match l with | [] -> [] | h::t -> cat (listReverse t) h;;

*)

(* changed spans
(5,42)-(5,59)
listReverse t
AppG (fromList [VarG])

*)

(* changed exprs
App (Just (5,40)-(5,55)) (Var (Just (5,41)-(5,52)) "listReverse") [Var (Just (5,53)-(5,54)) "t"]
*)

(* typed spans
(5,40)-(5,55)
*)

(* correct types
'a list
*)

(* bad types
'a
*)
