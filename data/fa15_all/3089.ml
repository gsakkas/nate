
let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile ((fun f'  -> fun x  -> (f, ((f x) = x))), b);;


(* fix

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile ((let f' x = ((f x), ((f x) = x)) in f'), b);;

*)

(* changed spans
(4,29)-(4,68)
let f' =
  fun x -> (f x , f x = x) in
f'
LetG NonRec (fromList [LamG EmptyG]) VarG

*)

(* changed exprs
Let (Just (4,29)-(4,68)) NonRec [(VarPat (Just (4,34)-(4,36)) "f'",Lam (Just (4,37)-(4,61)) (VarPat (Just (4,37)-(4,38)) "x") (Tuple (Just (4,41)-(4,61)) [App (Just (4,42)-(4,47)) (Var (Just (4,43)-(4,44)) "f") [Var (Just (4,45)-(4,46)) "x"],Bop (Just (4,49)-(4,60)) Eq (App (Just (4,50)-(4,55)) (Var (Just (4,51)-(4,52)) "f") [Var (Just (4,53)-(4,54)) "x"]) (Var (Just (4,58)-(4,59)) "x")]) Nothing)] (Var (Just (4,65)-(4,67)) "f'")
*)

(* typed spans
(4,29)-(4,68)
*)

(* correct types
'a -> ('a * bool)
*)

(* bad types
'a -> 'b -> ('b -> 'b * bool)
*)
