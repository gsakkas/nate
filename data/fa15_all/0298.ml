
let pipe fs = let f a x = a fs in let base = [] in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x = (fun n  -> n) a in let base n = n in List.fold_left f base fs;;

*)

(* changed spans
(2,26)-(2,27)
fun n -> n
LamG VarG

(2,45)-(2,47)
fun n -> n
LamG VarG

*)

(* changed exprs
Lam (Just (3,14)-(3,27)) (VarPat (Just (3,19)-(3,20)) "n") (Var (Just (3,25)-(3,26)) "n") Nothing
Lam (Just (3,42)-(3,47)) (VarPat (Just (3,42)-(3,43)) "n") (Var (Just (3,46)-(3,47)) "n") Nothing
*)

(* typed spans
(3,14)-(3,27)
(3,42)-(3,47)
*)

(* correct types
('a -> 'a) -> 'a -> 'a
'a -> 'a
*)

(* bad types
'a -> 'b
'a list
*)
