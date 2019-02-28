
let pipe fs = let f a x x = x a in let base y = y in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x = (fun x  -> x) a in let base y = y in List.fold_left f base fs;;

*)

(* changed spans
(2,24)-(2,31)
(fun x -> x) a
AppG (fromList [VarG])

*)

(* changed exprs
App (Just (3,14)-(3,29)) (Lam (Just (3,14)-(3,27)) (VarPat (Just (3,19)-(3,20)) "x") (Var (Just (3,25)-(3,26)) "x") Nothing) [Var (Just (3,28)-(3,29)) "a"]
*)

(* typed spans
(3,14)-(3,29)
*)

(* correct types
'a -> 'a
*)

(* bad types
('a -> 'b) -> 'b
*)
