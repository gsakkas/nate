
let rec wwhile (f,b) =
  match f b with
  | (b',c') -> (match c' with | true  -> wwhile (f, b') | false  -> b');;

let fixpoint (f,b) = wwhile (fun x  -> (((f b), (not ((f b) = b))), b));;


(* fix

let rec wwhile (f,b) =
  match f b with
  | (b',c') -> (match c' with | true  -> wwhile (f, b') | false  -> b');;

let fixpoint (f,b) =
  wwhile (let func x x = ((f b), (not ((f b) = b))) in ((func b), b));;

*)

(* changed spans
(6,28)-(6,71)
let func =
  fun x ->
    fun x ->
      (f b , not (f b = b)) in
(func b , b)
LetG NonRec (fromList [LamG EmptyG]) (TupleG (fromList [EmptyG]))

*)

(* changed exprs
Let (Just (7,9)-(7,69)) NonRec [(VarPat (Just (7,14)-(7,18)) "func",Lam (Just (7,19)-(7,51)) (VarPat (Just (7,19)-(7,20)) "x") (Lam (Just (7,21)-(7,51)) (VarPat (Just (7,21)-(7,22)) "x") (Tuple (Just (7,25)-(7,51)) [App (Just (7,26)-(7,31)) (Var (Just (7,27)-(7,28)) "f") [Var (Just (7,29)-(7,30)) "b"],App (Just (7,33)-(7,50)) (Var (Just (7,34)-(7,37)) "not") [Bop (Just (7,38)-(7,49)) Eq (App (Just (7,39)-(7,44)) (Var (Just (7,40)-(7,41)) "f") [Var (Just (7,42)-(7,43)) "b"]) (Var (Just (7,47)-(7,48)) "b")]]) Nothing) Nothing)] (Tuple (Just (7,55)-(7,68)) [App (Just (7,56)-(7,64)) (Var (Just (7,57)-(7,61)) "func") [Var (Just (7,62)-(7,63)) "b"],Var (Just (7,66)-(7,67)) "b"])
*)

(* typed spans
(7,9)-(7,69)
*)

(* correct types
('a -> ('a * bool) * 'a)
*)

(* bad types
'a -> (('b * bool) * 'b)
*)
