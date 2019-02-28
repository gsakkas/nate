
let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) =
  let funt b = if f b then (true, 1) else (true, 1) in wwhile (funt, b);;


(* fix

let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) =
  let funt b = if f b then (b, b) else (b, b) in wwhile (funt, b);;

*)

(* changed spans
(7,34)-(7,35)
b
VarG

(7,27)-(7,36)
b
VarG

(7,49)-(7,50)
b
VarG

(7,42)-(7,51)
b
VarG

*)

(* changed exprs
Var (Just (7,28)-(7,29)) "b"
Var (Just (7,31)-(7,32)) "b"
Var (Just (7,40)-(7,41)) "b"
Var (Just (7,43)-(7,44)) "b"
*)

(* typed spans
(7,28)-(7,29)
(7,31)-(7,32)
(7,40)-(7,41)
(7,43)-(7,44)
*)

(* correct types
bool
bool
bool
bool
*)

(* bad types
int
(bool * int)
int
(bool * int)
*)
