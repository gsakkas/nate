
let rec wwhile (f,b) =
  let temp = f b in
  match temp with | (a,boolean) -> if boolean then wwhile (f, a) else a;;

let fixpoint (f,b) =
  wwhile (let n x = let ff = f in (f, (x = (f x))) in (n, b));;


(* fix

let rec wwhile (f,b) =
  let temp = f b in
  match temp with | (a,boolean) -> if boolean then wwhile (f, a) else a;;

let fixpoint (f,b) = wwhile (let n x = ((f x), (x = (f x))) in (n, b));;

*)

(* changed spans
(7,20)-(7,50)
(f x , x = f x)
TupleG (fromList [AppG (fromList [EmptyG]),BopG EmptyG EmptyG])

*)

(* changed exprs
Tuple (Just (6,39)-(6,59)) [App (Just (6,40)-(6,45)) (Var (Just (6,41)-(6,42)) "f") [Var (Just (6,43)-(6,44)) "x"],Bop (Just (6,47)-(6,58)) Eq (Var (Just (6,48)-(6,49)) "x") (App (Just (6,52)-(6,57)) (Var (Just (6,53)-(6,54)) "f") [Var (Just (6,55)-(6,56)) "x"])]
*)

(* typed spans
(6,39)-(6,59)
*)

(* correct types
('a * bool)
*)

(* bad types
('a -> 'a * bool)
*)
