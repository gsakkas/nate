
let rec wwhile (f,b) =
  let temp = f b in
  match temp with | (a,boolean) -> if boolean then wwhile (f, a) else a;;

let fixpoint (f,b) =
  wwhile (let n x = let ff = f in (ff, (b = (ff b))) in (n, b));;


(* fix

let rec wwhile (f,b) =
  let temp = f b in
  match temp with | (a,boolean) -> if boolean then wwhile (f, a) else a;;

let fixpoint (f,b) =
  wwhile (let n x = let ff = f b in (ff, (b = ff)) in (n, b));;

*)

(* changed spans
(7,29)-(7,30)
f b
AppG (fromList [VarG])

(7,44)-(7,50)
ff
VarG

*)

(* changed exprs
App (Just (7,29)-(7,32)) (Var (Just (7,29)-(7,30)) "f") [Var (Just (7,31)-(7,32)) "b"]
Var (Just (7,46)-(7,48)) "ff"
*)

(* typed spans
(7,29)-(7,32)
(7,46)-(7,48)
*)

(* correct types
'a
'a
*)

(* bad types
'a -> 'a
'a
*)
