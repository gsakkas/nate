
let rec wwhile (f,b) =
  let (number,boolean) = f b in
  if boolean then wwhile (f, number) else number;;

let x = 1.0;;

let fixpoint (f,b) =
  wwhile (let y x = let xx = f x in (xx, (xx != x)) in ((y x), b));;


(* fix

let rec wwhile (f,b) =
  let (number,boolean) = f b in
  if boolean then wwhile (f, number) else number;;

let fixpoint (f,b) =
  wwhile (let y x = let xx = f x in (xx, (xx != x)) in (y, b));;

*)

(* changed spans
(9,56)-(9,61)
y
VarG

*)

(* changed exprs
Var (Just (7,56)-(7,57)) "y"
*)

(* typed spans
(7,56)-(7,57)
*)

(* correct types
'a -> ('a * bool)
*)

(* bad types
(float * bool)
*)
