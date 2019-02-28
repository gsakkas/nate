
let rec wwhile (f,b) =
  match f b with | (a,c) -> if not c then a else wwhile (f, a);;

let fixpoint (f,b) = wwhile ((let h a = ((f a), false) in h b), b);;


(* fix

let rec wwhile (f,b) =
  match f b with | (a,c) -> if not c then a else wwhile (f, a);;

let fixpoint (f,b) = wwhile (let h x = ((f x), false) in (h, b));;

*)

(* changed spans
(5,28)-(5,66)
let h =
  fun x -> (f x , false) in
(h , b)
LetG NonRec (fromList [LamG EmptyG]) (TupleG (fromList [EmptyG]))

*)

(* changed exprs
Let (Just (5,28)-(5,64)) NonRec [(VarPat (Just (5,33)-(5,34)) "h",Lam (Just (5,35)-(5,53)) (VarPat (Just (5,35)-(5,36)) "x") (Tuple (Just (5,39)-(5,53)) [App (Just (5,40)-(5,45)) (Var (Just (5,41)-(5,42)) "f") [Var (Just (5,43)-(5,44)) "x"],Lit (Just (5,47)-(5,52)) (LB False)]) Nothing)] (Tuple (Just (5,57)-(5,63)) [Var (Just (5,58)-(5,59)) "h",Var (Just (5,61)-(5,62)) "b"])
*)

(* typed spans
(5,28)-(5,64)
*)

(* correct types
('a -> ('a * bool) * 'a)
*)

(* bad types
(('a * bool) * 'b)
*)
