
let pipe fs =
  let f a x = function | _ -> x a in let base = 0 in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x = function | v -> x (a v) in
  let base = function | y -> y in List.fold_left f base fs;;

*)

(* changed spans
(3,14)-(3,33)
match $x with
| v -> x (a v)
CaseG VarG (fromList [(Nothing,AppG (fromList [EmptyG]))])

(3,48)-(3,49)
function | y -> y
LamG (CaseG EmptyG (fromList [(Nothing,EmptyG)]))

*)

(* changed exprs
Case (Just (3,14)-(3,37)) (Var (Just (3,14)-(3,37)) "$x") [(VarPat (Just (3,25)-(3,26)) "v",Nothing,App (Just (3,30)-(3,37)) (Var (Just (3,30)-(3,31)) "x") [App (Just (3,32)-(3,37)) (Var (Just (3,33)-(3,34)) "a") [Var (Just (3,35)-(3,36)) "v"]])]
Lam (Just (4,13)-(4,30)) (VarPat (Just (4,13)-(4,30)) "$x") (Case (Just (4,13)-(4,30)) (Var (Just (4,13)-(4,30)) "$x") [(VarPat (Just (4,24)-(4,25)) "y",Nothing,Var (Just (4,29)-(4,30)) "y")]) Nothing
*)

(* typed spans
(3,14)-(3,37)
(4,13)-(4,30)
*)

(* correct types
'a -> 'a
'a -> 'a
*)

(* bad types
'a -> 'b
int
*)
