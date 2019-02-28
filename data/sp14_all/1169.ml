
let rec listReverse l = match l with | [] -> [] | a::b -> listReverse [a] b;;


(* fix

let rec listReverse l = match l with | [] -> [] | a::b -> listReverse [a];;

*)

(* changed spans
(2,58)-(2,75)
listReverse [a]
AppG (fromList [ListG EmptyG])

*)

(* changed exprs
App (Just (2,58)-(2,73)) (Var (Just (2,58)-(2,69)) "listReverse") [List (Just (2,70)-(2,73)) [Var (Just (2,71)-(2,72)) "a"] Nothing]
*)

(* typed spans
(2,58)-(2,73)
*)

(* correct types
'a list
*)

(* bad types
'a list
*)
