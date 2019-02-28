
let pipe fs =
  let f a x c d = d c in let base b = b in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x c = x (let fn d = d in fn) in
  let base b = b in List.fold_left f base fs;;

*)

(* changed spans
(3,14)-(3,21)
x (let fn = fun d -> d in fn)
AppG (fromList [LetG NonRec (fromList [EmptyG]) EmptyG])

*)

(* changed exprs
App (Just (3,16)-(3,38)) (Var (Just (3,16)-(3,17)) "x") [Let (Just (3,18)-(3,38)) NonRec [(VarPat (Just (3,23)-(3,25)) "fn",Lam (Just (3,26)-(3,31)) (VarPat (Just (3,26)-(3,27)) "d") (Var (Just (3,30)-(3,31)) "d") Nothing)] (Var (Just (3,35)-(3,37)) "fn")]
*)

(* typed spans
(3,16)-(3,38)
*)

(* correct types
'a
*)

(* bad types
('a -> 'b) -> 'b
*)
