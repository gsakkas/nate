
let x = [1; 2; 3];;

let rec listReverse l =
  match l with
  | [] -> []
  | x::[] -> [x]
  | head::tail -> head :: (listReverse tail) :: tail;;


(* fix

let x = [1; 2; 3];;

let rec listReverse l =
  match l with
  | [] -> []
  | x::[] -> [x]
  | head::tail -> head :: (listReverse tail);;

*)

(* changed spans
(8,26)-(8,52)
listReverse tail
AppG (fromList [VarG])

*)

(* changed exprs
App (Just (8,26)-(8,44)) (Var (Just (8,27)-(8,38)) "listReverse") [Var (Just (8,39)-(8,43)) "tail"]
*)

(* typed spans
(8,26)-(8,44)
*)

(* correct types
'a list
*)

(* bad types
'a list
*)
