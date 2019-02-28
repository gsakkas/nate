
let f a x = let (r,s) = x in r + s;;

let pipe fs =
  let f a x a x = f x f a in let base x = x in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x a x = a x in let base x = x in List.fold_left f base fs;;

*)

(* changed spans
(5,18)-(5,25)
a x
AppG (fromList [VarG])

*)

(* changed exprs
App (Just (3,18)-(3,21)) (Var (Just (3,18)-(3,19)) "a") [Var (Just (3,20)-(3,21)) "x"]
*)

(* typed spans
(3,18)-(3,21)
*)

(* correct types
'a
*)

(* bad types
'a
*)
