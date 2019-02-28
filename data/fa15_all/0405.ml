
let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) = let fx x = x in wwhile (2, b);;


(* fix

let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) =
  let funt b = if f b then (b, true) else (b, false) in wwhile (funt, b);;

*)

(* changed spans
(6,21)-(6,50)
let funt =
  fun b ->
    if f b
    then (b , true)
    else (b , false) in
wwhile (funt , b)
LetG NonRec (fromList [LamG EmptyG]) (AppG (fromList [EmptyG]))

(6,28)-(6,33)
wwhile (funt , b)
AppG (fromList [TupleG (fromList [EmptyG])])

(6,45)-(6,46)
funt
VarG

*)

(* typed spans
(7,2)-(7,72)
(7,56)-(7,72)
(7,64)-(7,68)
*)

(* typed spans
'a
'a
'a -> ('a * bool)
*)

(* typed spans
'a
'a -> 'a
int
*)
