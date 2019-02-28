
let rec wwhile (f,b) =
  let calc = f b in let (b',c') = calc in if c' then f b' else b';;


(* fix

let rec wwhile (f,b) =
  let calc = f b in let (b',c') = calc in if c' then wwhile (f, b') else b';;

*)

(* changed spans
(3,53)-(3,54)
wwhile
VarG

(3,53)-(3,54)
(f , b')
TupleG (fromList [VarG])

*)

(* changed exprs
Var (Just (3,53)-(3,59)) "wwhile"
Tuple (Just (3,60)-(3,67)) [Var (Just (3,61)-(3,62)) "f",Var (Just (3,64)-(3,66)) "b'"]
*)

(* typed spans
(3,53)-(3,59)
(3,60)-(3,67)
*)

(* correct types
('a -> ('a * bool) * 'a) -> 'a
('a -> ('a * bool) * 'a)
*)

(* bad types
'a -> ('a * bool)
'a -> ('a * bool)
*)
