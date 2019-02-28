
let rec wwhile (f,b) =
  let rec acc result =
    let res = f result in
    match res with | (b',c') -> if c' then acc b' else b' in
  acc b;;

let fixpoint (f,b) = wwhile (fun xx  -> ((xx, ((f xx) = xx)), b));;


(* fix

let rec wwhile (f,b) =
  let rec acc result =
    let res = f result in
    match res with | (b',c') -> if c' then acc b' else b' in
  acc b;;

let fixpoint (f,b) = wwhile ((fun xx  -> (xx, ((f xx) = xx))), b);;

*)

(* changed spans
(8,28)-(8,65)
(fun xx ->
   (xx , f xx = xx) , b)
TupleG (fromList [VarG,LamG EmptyG])

*)

(* changed exprs
Tuple (Just (8,28)-(8,65)) [Lam (Just (8,29)-(8,61)) (VarPat (Just (8,34)-(8,36)) "xx") (Tuple (Just (8,41)-(8,60)) [Var (Just (8,42)-(8,44)) "xx",Bop (Just (8,46)-(8,59)) Eq (App (Just (8,47)-(8,53)) (Var (Just (8,48)-(8,49)) "f") [Var (Just (8,50)-(8,52)) "xx"]) (Var (Just (8,56)-(8,58)) "xx")]) Nothing,Var (Just (8,63)-(8,64)) "b"]
*)

(* typed spans
(8,28)-(8,65)
*)

(* correct types
('a -> ('a * bool) * 'a)
*)

(* bad types
'a -> (('a * bool) * 'b)
*)
