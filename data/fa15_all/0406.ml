
let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) = let fx x = x in wwhile (b, b);;


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

(6,32)-(6,33)
b
VarG

(6,37)-(6,43)
(b , false)
TupleG (fromList [VarG,LitG])

(6,44)-(6,50)
wwhile (funt , b)
AppG (fromList [TupleG (fromList [EmptyG])])

*)

(* typed spans
(7,2)-(7,72)
(7,20)-(7,21)
(7,42)-(7,52)
(7,56)-(7,72)
*)

(* typed spans
'a
'a
('a * bool)
'a
*)

(* typed spans
'a
'a
('a -> ('a * bool) * 'a) -> 'a
('a -> ('a * bool) * 'a -> ('a * bool))
*)
