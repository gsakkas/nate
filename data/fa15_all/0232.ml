
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

(7,34)-(7,52)
b
VarG

(7,44)-(7,50)
EMPTY
EmptyG

(7,48)-(7,49)
EMPTY
EmptyG

*)
