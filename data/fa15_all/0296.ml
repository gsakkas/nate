
let pipe fs = let f a x = fs a x in let base = [] in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x = (fun n  -> n) a in let base n = n in List.fold_left f base fs;;

*)

(* changed spans
(2,26)-(2,32)
(fun n -> n) a
AppG (fromList [VarG])

(2,47)-(2,49)
fun n -> n
LamG VarG

*)

(* changed exprs
App (Just (3,14)-(3,29)) (Lam (Just (3,14)-(3,27)) (VarPat (Just (3,19)-(3,20)) "n") (Var (Just (3,25)-(3,26)) "n") Nothing) [Var (Just (3,28)-(3,29)) "a"]
Lam (Just (3,42)-(3,47)) (VarPat (Just (3,42)-(3,43)) "n") (Var (Just (3,46)-(3,47)) "n") Nothing
*)

(* typed spans
(3,14)-(3,29)
(3,42)-(3,47)
*)

(* correct types
'a -> 'a
'a -> 'a
*)

(* bad types
'a list
'a list
*)
