
let rec wwhile (f,b) =
  let helper = f b in
  match helper with | (x,y) -> if y = false then x else wwhile (f, x);;

let fixpoint (f,b) =
  wwhile
    (let g b =
       let helper = f b in
       match helper with | b -> if f = b then (f, false) else (f, true) in
     (g, b));;


(* fix

let rec wwhile (f,b) =
  let helper = f b in
  match helper with | (x,y) -> if y = false then x else wwhile (f, x);;

let fixpoint (f,b) =
  wwhile
    (let g b =
       let helper = f b in
       match helper with | f -> if f = b then (f, false) else (f, true) in
     (g, b));;

*)

(* changed spans
(10,7)-(10,71)
match helper with
| f -> if f = b
       then (f , false)
       else (f , true)
CaseG VarG (fromList [(Nothing,IteG EmptyG EmptyG EmptyG)])

*)

(* changed exprs
Case (Just (10,7)-(10,71)) (Var (Just (10,13)-(10,19)) "helper") [(VarPat (Just (10,27)-(10,28)) "f",Nothing,Ite (Just (10,32)-(10,71)) (Bop (Just (10,35)-(10,40)) Eq (Var (Just (10,35)-(10,36)) "f") (Var (Just (10,39)-(10,40)) "b")) (Tuple (Just (10,46)-(10,56)) [Var (Just (10,47)-(10,48)) "f",Lit (Just (10,50)-(10,55)) (LB False)]) (Tuple (Just (10,62)-(10,71)) [Var (Just (10,63)-(10,64)) "f",Lit (Just (10,66)-(10,70)) (LB True)]))]
*)

(* typed spans
(10,7)-(10,71)
*)

(* correct types
('a * bool)
*)

(* bad types
('a -> 'b * bool)
*)
