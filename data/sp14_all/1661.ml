
let rec wwhile (f,b) =
  let f' = f b in
  match f' with | (b',false ) -> b' | (b',true ) -> wwhile (f, b');;

let fixpoint (f,b) = wwhile ((let g = f in ((g b), (b = (g b)))), b);;


(* fix

let rec wwhile (f,b) =
  let f' = f b in
  match f' with | (b',false ) -> b' | (b',true ) -> wwhile (f, b');;

let fixpoint (f,b) =
  wwhile
    ((let whilesFun f' b' = let fOfB = f' b' in (fOfB, (fOfB = b')) in
      whilesFun f), b);;

*)

(* changed spans
(6,29)-(6,64)
let whilesFun =
  fun f' ->
    fun b' ->
      (let fOfB = f' b' in
       (fOfB , fOfB = b')) in
whilesFun f
LetG NonRec (fromList [LamG EmptyG]) (AppG (fromList [EmptyG]))

*)

(* changed exprs
Let (Just (8,5)-(9,18)) NonRec [(VarPat (Just (8,10)-(8,19)) "whilesFun",Lam (Just (8,20)-(8,67)) (VarPat (Just (8,20)-(8,22)) "f'") (Lam (Just (8,23)-(8,67)) (VarPat (Just (8,23)-(8,25)) "b'") (Let (Just (8,28)-(8,67)) NonRec [(VarPat (Just (8,32)-(8,36)) "fOfB",App (Just (8,39)-(8,44)) (Var (Just (8,39)-(8,41)) "f'") [Var (Just (8,42)-(8,44)) "b'"])] (Tuple (Just (8,48)-(8,67)) [Var (Just (8,49)-(8,53)) "fOfB",Bop (Just (8,55)-(8,66)) Eq (Var (Just (8,56)-(8,60)) "fOfB") (Var (Just (8,63)-(8,65)) "b'")])) Nothing) Nothing)] (App (Just (9,6)-(9,17)) (Var (Just (9,6)-(9,15)) "whilesFun") [Var (Just (9,16)-(9,17)) "f"])
*)

(* typed spans
(8,5)-(9,18)
*)

(* correct types
'a -> ('a * bool)
*)

(* bad types
('a * bool)
*)
