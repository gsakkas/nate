
let rec wwhile (f,b) =
  match f b with | (h,true ) -> wwhile (f, h) | (h,false ) -> h;;

let fixpoint (f,b) =
  wwhile
    (let func b = match f b with | b -> (b, false) | x -> (x, true) in
     ((func b), b));;


(* fix

let rec wwhile (f,b) =
  match f b with | (h,true ) -> wwhile (f, h) | (h,false ) -> h;;

let fixpoint (f,b) =
  wwhile
    (let g x = match f x with | x -> (x, false) | y -> (y, true) in (g, b));;

*)

(* changed spans
(7,4)-(8,19)
let g =
  fun x ->
    match f x with
    | x -> (x , false)
    | y -> (y , true) in
(g , b)
LetG NonRec (fromList [LamG EmptyG]) (TupleG (fromList [EmptyG]))

*)

(* changed exprs
Let (Just (7,4)-(7,75)) NonRec [(VarPat (Just (7,9)-(7,10)) "g",Lam (Just (7,11)-(7,64)) (VarPat (Just (7,11)-(7,12)) "x") (Case (Just (7,15)-(7,64)) (App (Just (7,21)-(7,24)) (Var (Just (7,21)-(7,22)) "f") [Var (Just (7,23)-(7,24)) "x"]) [(VarPat (Just (7,32)-(7,33)) "x",Nothing,Tuple (Just (7,37)-(7,47)) [Var (Just (7,38)-(7,39)) "x",Lit (Just (7,41)-(7,46)) (LB False)]),(VarPat (Just (7,50)-(7,51)) "y",Nothing,Tuple (Just (7,55)-(7,64)) [Var (Just (7,56)-(7,57)) "y",Lit (Just (7,59)-(7,63)) (LB True)])]) Nothing)] (Tuple (Just (7,68)-(7,74)) [Var (Just (7,69)-(7,70)) "g",Var (Just (7,72)-(7,73)) "b"])
*)

(* typed spans
(7,4)-(7,75)
*)

(* correct types
('a -> ('a * bool) * 'a)
*)

(* bad types
(('a * bool) * 'b)
*)
