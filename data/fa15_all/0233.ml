
let rec wwhile (f,b) =
  let temp = f b in
  match temp with | (a,boolean) -> if boolean then wwhile (f, a) else a;;

let fixpoint (f,b) =
  wwhile (let n x = let ff = f b in (f, (b = ff)) in (n, b));;


(* fix

let rec wwhile (f,b) =
  let temp = f b in
  match temp with | (a,boolean) -> if boolean then wwhile (f, a) else a;;

let fixpoint (f,b) =
  wwhile (let n x = let ff = f b in (ff, (b = (f b))) in (n, b));;

*)

(* changed spans
(7,37)-(7,38)
ff
VarG

(7,45)-(7,47)
f b
AppG (fromList [VarG])

*)

(* changed exprs
Var (Just (7,37)-(7,39)) "ff"
App (Just (7,46)-(7,51)) (Var (Just (7,47)-(7,48)) "f") [Var (Just (7,49)-(7,50)) "b"]
*)

(* typed spans
(7,37)-(7,39)
(7,46)-(7,51)
*)

(* correct types
'a
'a
*)

(* bad types
'a -> 'a
'a
*)
