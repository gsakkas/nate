
let pipe fs = let f a x = a x in let base = fs in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x = function | g -> g in
  let base = function | x -> x in List.fold_left f base fs;;

*)

(* changed spans
(2,26)-(2,29)
function | g -> g
LamG (CaseG EmptyG (fromList [(Nothing,EmptyG)]))

(2,44)-(2,46)
function | x -> x
LamG (CaseG EmptyG (fromList [(Nothing,EmptyG)]))

*)

(* changed exprs
Lam (Just (3,14)-(3,31)) (VarPat (Just (3,14)-(3,31)) "$x") (Case (Just (3,14)-(3,31)) (Var (Just (3,14)-(3,31)) "$x") [(VarPat (Just (3,25)-(3,26)) "g",Nothing,Var (Just (3,30)-(3,31)) "g")]) Nothing
Lam (Just (4,13)-(4,30)) (VarPat (Just (4,13)-(4,30)) "$x") (Case (Just (4,13)-(4,30)) (Var (Just (4,13)-(4,30)) "$x") [(VarPat (Just (4,24)-(4,25)) "x",Nothing,Var (Just (4,29)-(4,30)) "x")]) Nothing
*)

(* typed spans
(3,14)-(3,31)
(4,13)-(4,30)
*)

(* correct types
'a -> 'a
'a -> 'a
*)

(* bad types
'a
'a
*)
