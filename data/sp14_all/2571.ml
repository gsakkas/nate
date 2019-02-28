
let x = [1; 2; 3];;

let rec listReverse l =
  match l with | [] -> [] | x::[] -> [x] | head::tail::third -> head :: tail;;


(* fix

let x = [1; 2; 3];;

let rec listReverse l =
  match l with | [] -> [] | x::[] -> [x] | head::tail::third -> [head; tail];;

*)

(* changed spans
(5,64)-(5,76)
[head ; tail]
ListG VarG

*)

(* changed exprs
List (Just (5,64)-(5,76)) [Var (Just (5,65)-(5,69)) "head",Var (Just (5,71)-(5,75)) "tail"] Nothing
*)

(* typed spans
(5,64)-(5,76)
*)

(* correct types
'a list
*)

(* bad types
'a list
*)
