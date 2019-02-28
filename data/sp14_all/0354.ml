
let rec wwhile (f,b) =
  let func = f b in
  let (value,boo) = func in if boo then wwhile func else value;;


(* fix

let rec wwhile (f,b) =
  let func = f b in
  let (value,boo) = func in if boo then wwhile (f, value) else value;;

*)

(* changed spans
(4,47)-(4,51)
(f , value)
TupleG (fromList [VarG])

*)

(* changed exprs
Tuple (Just (4,47)-(4,57)) [Var (Just (4,48)-(4,49)) "f",Var (Just (4,51)-(4,56)) "value"]
*)

(* typed spans
(4,47)-(4,57)
*)

(* correct types
('a -> ('a * bool) * 'a)
*)

(* bad types
('a * bool)
*)
