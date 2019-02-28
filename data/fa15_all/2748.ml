
let rec clone x n = match n with | 0 -> x | _ -> (clone x (n - 1)) :: x;;


(* fix

let rec clone x n =
  let x' = abs n in if x' > 0 then [x] @ (clone x (n - 1)) else [];;

*)

(* changed spans
(2,20)-(2,71)
let x' = abs n in
if x' > 0
then [x] @ clone x (n - 1)
else []
LetG NonRec (fromList [AppG (fromList [EmptyG])]) (IteG EmptyG EmptyG EmptyG)

*)

(* changed exprs
Let (Just (3,2)-(3,66)) NonRec [(VarPat (Just (3,6)-(3,8)) "x'",App (Just (3,11)-(3,16)) (Var (Just (3,11)-(3,14)) "abs") [Var (Just (3,15)-(3,16)) "n"])] (Ite (Just (3,20)-(3,66)) (Bop (Just (3,23)-(3,29)) Gt (Var (Just (3,23)-(3,25)) "x'") (Lit (Just (3,28)-(3,29)) (LI 0))) (App (Just (3,35)-(3,58)) (Var (Just (3,39)-(3,40)) "@") [List (Just (3,35)-(3,38)) [Var (Just (3,36)-(3,37)) "x"] Nothing,App (Just (3,41)-(3,58)) (Var (Just (3,42)-(3,47)) "clone") [Var (Just (3,48)-(3,49)) "x",Bop (Just (3,50)-(3,57)) Minus (Var (Just (3,51)-(3,52)) "n") (Lit (Just (3,55)-(3,56)) (LI 1))]]) (List (Just (3,64)-(3,66)) [] Nothing))
*)

(* typed spans
(3,2)-(3,66)
*)

(* correct types
'a list
*)

(* bad types
'a list
*)
