
let pipe fs =
  let f a x = (fun result  -> fun x  -> a + x) 0 in
  let base = 1 in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x n = x (a n) in let base f = 0 in List.fold_left f base fs;;

*)

(* changed spans
(3,14)-(3,48)
fun n -> x (a n)
LamG (AppG (fromList [EmptyG]))

(4,13)-(4,14)
fun f -> 0
LamG LitG

*)

(* changed exprs
Lam (Just (3,12)-(3,23)) (VarPat (Just (3,12)-(3,13)) "n") (App (Just (3,16)-(3,23)) (Var (Just (3,16)-(3,17)) "x") [App (Just (3,18)-(3,23)) (Var (Just (3,19)-(3,20)) "a") [Var (Just (3,21)-(3,22)) "n"]]) Nothing
Lam (Just (3,36)-(3,41)) (VarPat (Just (3,36)-(3,37)) "f") (Lit (Just (3,40)-(3,41)) (LI 0)) Nothing
*)

(* typed spans
(3,12)-(3,23)
(3,36)-(3,41)
*)

(* correct types
'a -> int
'a -> int
*)

(* bad types
int -> int
int
*)
