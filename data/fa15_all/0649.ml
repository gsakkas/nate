
let pipe fs =
  let f a x g = x (a g) in let base = [] in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x g = x (a g) in let base k = k in List.fold_left f base fs;;

*)

(* changed spans
(3,38)-(3,40)
fun k -> k
LamG VarG

*)

(* changed exprs
Lam (Just (3,36)-(3,41)) (VarPat (Just (3,36)-(3,37)) "k") (Var (Just (3,40)-(3,41)) "k") Nothing
*)

(* typed spans
(3,36)-(3,41)
*)

(* correct types
'a -> 'a
*)

(* bad types
'a list
*)
