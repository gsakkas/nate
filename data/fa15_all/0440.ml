
let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) = let rec fs x = ((fs x), ((f b) = b)) in wwhile (fs, b);;


(* fix

let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) = let fs x = ((f b), ((f b) = b)) in wwhile (fs, b);;

*)

(* changed spans
(6,21)-(6,75)
let fs =
  fun x -> (f b , f b = b) in
wwhile (fs , b)
LetG NonRec (fromList [LamG EmptyG]) (AppG (fromList [EmptyG]))

*)

(* changed exprs
Let (Just (6,21)-(6,70)) NonRec [(VarPat (Just (6,25)-(6,27)) "fs",Lam (Just (6,28)-(6,52)) (VarPat (Just (6,28)-(6,29)) "x") (Tuple (Just (6,32)-(6,52)) [App (Just (6,33)-(6,38)) (Var (Just (6,34)-(6,35)) "f") [Var (Just (6,36)-(6,37)) "b"],Bop (Just (6,40)-(6,51)) Eq (App (Just (6,41)-(6,46)) (Var (Just (6,42)-(6,43)) "f") [Var (Just (6,44)-(6,45)) "b"]) (Var (Just (6,49)-(6,50)) "b")]) Nothing)] (App (Just (6,56)-(6,70)) (Var (Just (6,56)-(6,62)) "wwhile") [Tuple (Just (6,63)-(6,70)) [Var (Just (6,64)-(6,66)) "fs",Var (Just (6,68)-(6,69)) "b"]])
*)

(* typed spans
(6,21)-(6,70)
*)

(* correct types
'a
*)

(* bad types
'a
*)
