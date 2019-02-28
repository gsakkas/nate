
let sqsum xs = let f a x = a * a in let base = f in List.fold_left f base xs;;


(* fix

let sqsum xs =
  let f a x = a + x in let base = List.hd xs in List.fold_left f base xs;;

*)

(* changed spans
(2,27)-(2,32)
a + x
BopG VarG VarG

(2,47)-(2,48)
List.hd xs
AppG (fromList [VarG])

*)

(* changed exprs
Bop (Just (3,14)-(3,19)) Plus (Var (Just (3,14)-(3,15)) "a") (Var (Just (3,18)-(3,19)) "x")
App (Just (3,34)-(3,44)) (Var (Just (3,34)-(3,41)) "List.hd") [Var (Just (3,42)-(3,44)) "xs"]
*)

(* typed spans
(3,14)-(3,19)
(3,34)-(3,44)
*)

(* correct types
int
int
*)

(* bad types
int
int -> 'a -> int
*)
