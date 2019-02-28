
let helper x r =
  let m = x r in match m with | r -> (r, false) | _ -> (r, true);;

let rec wwhile (f,b) =
  let (x,y) = f b in match y with | false  -> x | true  -> wwhile (f, x);;

let fixpoint (f,b) = wwhile ((helper (f, b)), b);;


(* fix

let helper (f,b) = let f b = let x = f b in (x, (x != b)) in f;;

let rec wwhile (f,b) =
  let (x,y) = f b in match y with | false  -> x | true  -> wwhile (f, x);;

let fixpoint (f,b) = wwhile ((helper (f, b)), b);;

*)

(* changed spans
(2,11)-(3,64)
fun (f , b) ->
  (let f =
     fun b ->
       (let x = f b in
        (x , x <> b)) in
   f)
LamG (LetG NonRec (fromList [EmptyG]) EmptyG)

*)

(* changed exprs
Lam (Just (2,12)-(2,62)) (TuplePat (Just (2,12)-(2,15)) [VarPat (Just (2,12)-(2,13)) "f",VarPat (Just (2,14)-(2,15)) "b"]) (Let (Just (2,19)-(2,62)) NonRec [(VarPat (Just (2,23)-(2,24)) "f",Lam (Just (2,25)-(2,57)) (VarPat (Just (2,25)-(2,26)) "b") (Let (Just (2,29)-(2,57)) NonRec [(VarPat (Just (2,33)-(2,34)) "x",App (Just (2,37)-(2,40)) (Var (Just (2,37)-(2,38)) "f") [Var (Just (2,39)-(2,40)) "b"])] (Tuple (Just (2,44)-(2,57)) [Var (Just (2,45)-(2,46)) "x",Bop (Just (2,48)-(2,56)) Neq (Var (Just (2,49)-(2,50)) "x") (Var (Just (2,54)-(2,55)) "b")])) Nothing)] (Var (Just (2,61)-(2,62)) "f")) Nothing
*)

(* typed spans
(2,12)-(2,62)
*)

(* correct types
('a -> 'a * 'a) -> 'a -> ('a * bool)
*)

(* bad types
('a -> 'a) -> 'a -> ('a * bool)
*)
