
let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) =
  let fs bs = if bs = 0 then 0 else if bs > 1 then bs - 1 else bs + 1 in
  wwhile ((fs b), true, b);;


(* fix

let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) =
  let funt b = if f b then (b, true) else (b, false) in wwhile (funt, b);;

*)

(* changed spans
(7,2)-(8,26)
let funt =
  fun b ->
    if f b
    then (b , true)
    else (b , false) in
wwhile (funt , b)
LetG NonRec (fromList [LamG EmptyG]) (AppG (fromList [EmptyG]))

(7,17)-(7,19)
fun b ->
  if f b
  then (b , true)
  else (b , false)
LamG (IteG EmptyG EmptyG EmptyG)

(7,39)-(7,45)
EMPTY
EmptyG

(8,2)-(8,8)
f
VarG

(8,10)-(8,16)
(b , true)
TupleG (fromList [VarG,LitG])

(8,11)-(8,13)
(b , false)
TupleG (fromList [VarG,LitG])

(8,14)-(8,15)
wwhile (funt , b)
AppG (fromList [TupleG (fromList [EmptyG])])

*)

(* typed spans
(7,2)-(7,72)
(7,11)-(7,52)
(7,18)-(7,19)
(7,27)-(7,36)
(7,42)-(7,52)
(7,56)-(7,72)
*)

(* typed spans
'a
'a -> ('a * bool)
'a -> bool
('a * bool)
('a * bool)
'a
*)

(* typed spans
'a
int
('a -> ('a * bool) * 'a) -> 'a
int
int -> int
int
*)
