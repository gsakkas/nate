
let pipe fs =
  let f a x = function | f' -> f' x a in
  let base = function | y -> y in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x = function | v -> x (a v) in
  let base = function | y -> y in List.fold_left f base fs;;

*)

(* changed spans
(3,14)-(3,37)
match $x with
| v -> x (a v)
CaseG VarG (fromList [(Nothing,AppG (fromList [EmptyG]))])

*)

(* changed exprs
Case (Just (3,14)-(3,37)) (Var (Just (3,14)-(3,37)) "$x") [(VarPat (Just (3,25)-(3,26)) "v",Nothing,App (Just (3,30)-(3,37)) (Var (Just (3,30)-(3,31)) "x") [App (Just (3,32)-(3,37)) (Var (Just (3,33)-(3,34)) "a") [Var (Just (3,35)-(3,36)) "v"]])]
*)

(* typed spans
(3,14)-(3,37)
*)

(* correct types
'a -> 'a
*)

(* bad types
('a -> 'b -> 'c) -> 'c
*)
