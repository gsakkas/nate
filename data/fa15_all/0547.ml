
let pipe fs =
  let f a x = function | [] -> x | h::fs' -> h x in
  let base = [] in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x = a in let base fs = fs in List.fold_left f base fs;;

*)

(* changed spans
(3,14)-(3,48)
a
VarG

(4,13)-(4,15)
fun fs -> fs
LamG VarG

*)

(* changed exprs
Var (Just (2,26)-(2,27)) "a"
Lam (Just (2,40)-(2,47)) (VarPat (Just (2,40)-(2,42)) "fs") (Var (Just (2,45)-(2,47)) "fs") Nothing
*)

(* typed spans
(2,26)-(2,27)
(2,40)-(2,47)
*)

(* correct types
'a -> 'a
'a -> 'a
*)

(* bad types
'a -> 'a list -> 'a
'a list
*)
