
let rec wwhile (f,b) =
  let temp = f b in
  match temp with | (a,boolean) -> if boolean then wwhile (f, a) else a;;

let fixpoint (f,b) = wwhile (let n x = (f, (x = (f x))) in (f, b));;


(* fix

let rec wwhile (f,b) =
  let temp = f b in
  match temp with | (a,boolean) -> if boolean then wwhile (f, a) else a;;

let fixpoint (f,b) = wwhile (let n x = ((f x), (x = (f x))) in (n, b));;

*)

(* changed spans
(6,40)-(6,41)
f x
AppG (fromList [VarG])

(6,60)-(6,61)
n
VarG

*)

(* changed exprs
App (Just (6,40)-(6,45)) (Var (Just (6,41)-(6,42)) "f") [Var (Just (6,43)-(6,44)) "x"]
Var (Just (6,64)-(6,65)) "n"
*)

(* typed spans
(6,40)-(6,45)
(6,64)-(6,65)
*)

(* correct types
'a
'a -> ('a * bool)
*)

(* bad types
'a -> 'a
'a -> 'a
*)
