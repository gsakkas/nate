
let rec wwhile (f,b) =
  let (b',c') = f b in if c' = true then wwhile (f b') else c';;


(* fix

let rec wwhile (f,b) =
  let (b',c') = f b in if c' = true then wwhile (f, b') else c';;

*)

(* changed spans
(3,48)-(3,54)
(f , b')
TupleG (fromList [VarG])

*)

(* changed exprs
Tuple (Just (3,48)-(3,55)) [Var (Just (3,49)-(3,50)) "f",Var (Just (3,52)-(3,54)) "b'"]
*)

(* typed spans
(3,48)-(3,55)
*)

(* correct types
('a -> ('a * bool) * 'a)
*)

(* bad types
('a * bool)
*)
