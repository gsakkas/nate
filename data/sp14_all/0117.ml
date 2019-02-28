
let rec wwhile (f,b) =
  let helper = f b in
  match helper with | (x,y) -> if y = false then x else wwhile (f, x);;

let fixpoint (f,b) =
  wwhile
    (let g =
       let self = f b in
       match self with | b -> (self, true) | _ -> (self, false) in
     (g, b));;


(* fix

let rec wwhile (f,b) =
  let helper = f b in
  match helper with | (x,y) -> if y = false then x else wwhile (f, x);;

let fixpoint (f,b) =
  wwhile
    (let g b =
       let self = f b in
       match b with | self -> (self, false) | _ -> (self, true) in
     (g, b));;

*)

(* changed spans
(9,7)-(10,63)
fun b ->
  (let self = f b in
   match b with
   | self -> (self , false)
   | _ -> (self , true))
LamG (LetG NonRec (fromList [EmptyG]) EmptyG)

*)

(* changed exprs
Lam (Just (8,11)-(10,63)) (VarPat (Just (8,11)-(8,12)) "b") (Let (Just (9,7)-(10,63)) NonRec [(VarPat (Just (9,11)-(9,15)) "self",App (Just (9,18)-(9,21)) (Var (Just (9,18)-(9,19)) "f") [Var (Just (9,20)-(9,21)) "b"])] (Case (Just (10,7)-(10,63)) (Var (Just (10,13)-(10,14)) "b") [(VarPat (Just (10,22)-(10,26)) "self",Nothing,Tuple (Just (10,30)-(10,43)) [Var (Just (10,31)-(10,35)) "self",Lit (Just (10,37)-(10,42)) (LB False)]),(WildPat (Just (10,46)-(10,47)),Nothing,Tuple (Just (10,51)-(10,63)) [Var (Just (10,52)-(10,56)) "self",Lit (Just (10,58)-(10,62)) (LB True)])])) Nothing
*)

(* typed spans
(8,11)-(10,63)
*)

(* correct types
'a -> ('a * bool)
*)

(* bad types
('a * bool)
*)
