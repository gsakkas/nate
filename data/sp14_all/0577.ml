
let rec wwhile (f,b) =
  let (number,boolean) = f b in
  if boolean then wwhile (f, number) else number;;

let fixpoint (f,b) =
  wwhile
    (fun y  ->
       fun x  -> let z = f x in if z = b then (x, true) else ((y z), b));;


(* fix

let rec wwhile (f,b) =
  let (number,boolean) = f b in
  if boolean then wwhile (f, number) else number;;

let fixpoint (f,b) =
  wwhile (let y x = let xx = f x in (xx, (xx != x)) in (y, b));;

*)

(* changed spans
(8,4)-(9,72)
let y =
  fun x ->
    (let xx = f x in
     (xx , xx <> x)) in
(y , b)
LetG NonRec (fromList [LamG EmptyG]) (TupleG (fromList [EmptyG]))

*)

(* changed exprs
Let (Just (7,9)-(7,62)) NonRec [(VarPat (Just (7,14)-(7,15)) "y",Lam (Just (7,16)-(7,51)) (VarPat (Just (7,16)-(7,17)) "x") (Let (Just (7,20)-(7,51)) NonRec [(VarPat (Just (7,24)-(7,26)) "xx",App (Just (7,29)-(7,32)) (Var (Just (7,29)-(7,30)) "f") [Var (Just (7,31)-(7,32)) "x"])] (Tuple (Just (7,36)-(7,51)) [Var (Just (7,37)-(7,39)) "xx",Bop (Just (7,41)-(7,50)) Neq (Var (Just (7,42)-(7,44)) "xx") (Var (Just (7,48)-(7,49)) "x")])) Nothing)] (Tuple (Just (7,55)-(7,61)) [Var (Just (7,56)-(7,57)) "y",Var (Just (7,59)-(7,60)) "b"])
*)

(* typed spans
(7,9)-(7,62)
*)

(* correct types
('a -> ('a * bool) * 'a)
*)

(* bad types
(bool -> 'a) -> 'a -> ('a * bool)
*)
