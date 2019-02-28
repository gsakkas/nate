
let pipe fs =
  let f a x = let h::t = fs in h a x in
  let base = [0] in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x g = x (a g) in let base k = k in List.fold_left f base fs;;

*)

(* changed spans
(3,14)-(3,36)
fun g -> x (a g)
LamG (AppG (fromList [EmptyG]))

(4,13)-(4,16)
fun k -> k
LamG VarG

*)

(* changed exprs
Lam (Just (3,12)-(3,23)) (VarPat (Just (3,12)-(3,13)) "g") (App (Just (3,16)-(3,23)) (Var (Just (3,16)-(3,17)) "x") [App (Just (3,18)-(3,23)) (Var (Just (3,19)-(3,20)) "a") [Var (Just (3,21)-(3,22)) "g"]]) Nothing
Lam (Just (3,36)-(3,41)) (VarPat (Just (3,36)-(3,37)) "k") (Var (Just (3,40)-(3,41)) "k") Nothing
*)

(* typed spans
(3,12)-(3,23)
(3,36)-(3,41)
*)

(* correct types
'a -> 'a
'a -> 'a
*)

(* bad types
int list
int list
*)
