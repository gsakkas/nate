
let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile ((f, ((f b) = b)), b);;


(* fix

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile (let h x = ((f x), ((f x) = x)) in (h, b));;

*)

(* changed spans
(4,28)-(4,49)
let h =
  fun x -> (f x , f x = x) in
(h , b)
LetG NonRec (fromList [LamG EmptyG]) (TupleG (fromList [EmptyG]))

*)

(* changed exprs
Let (Just (4,28)-(4,70)) NonRec [(VarPat (Just (4,33)-(4,34)) "h",Lam (Just (4,35)-(4,59)) (VarPat (Just (4,35)-(4,36)) "x") (Tuple (Just (4,39)-(4,59)) [App (Just (4,40)-(4,45)) (Var (Just (4,41)-(4,42)) "f") [Var (Just (4,43)-(4,44)) "x"],Bop (Just (4,47)-(4,58)) Eq (App (Just (4,48)-(4,53)) (Var (Just (4,49)-(4,50)) "f") [Var (Just (4,51)-(4,52)) "x"]) (Var (Just (4,56)-(4,57)) "x")]) Nothing)] (Tuple (Just (4,63)-(4,69)) [Var (Just (4,64)-(4,65)) "h",Var (Just (4,67)-(4,68)) "b"])
*)

(* typed spans
(4,28)-(4,70)
*)

(* correct types
('a -> ('a * bool) * 'a)
*)

(* bad types
(('a -> 'a * bool) * 'a)
*)
