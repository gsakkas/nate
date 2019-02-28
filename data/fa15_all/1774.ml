
let rec wwhile (f,b) =
  let (b',c') = f b in if c' = false then wwhile (f b') else b';;


(* fix

let rec wwhile (f,b) =
  let (b',c') = f b in if c' = true then wwhile (f, b') else b';;

*)

(* changed spans
(3,31)-(3,36)
true
LitG

(3,49)-(3,55)
(f , b')
TupleG (fromList [VarG])

*)

(* changed exprs
Lit (Just (3,31)-(3,35)) (LB True)
Tuple (Just (3,48)-(3,55)) [Var (Just (3,49)-(3,50)) "f",Var (Just (3,52)-(3,54)) "b'"]
*)

(* typed spans
(3,31)-(3,35)
(3,48)-(3,55)
*)

(* correct types
bool
('a -> ('a * bool) * 'a)
*)

(* bad types
bool
('a * bool)
*)
