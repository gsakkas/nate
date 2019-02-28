
let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) =
  let funt b = if f b then (1, 1) else (true, 1) in wwhile (funt, b);;


(* fix

let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) =
  let funt b = if f b then (b, b) else (b, b) in wwhile (funt, b);;

*)

(* changed spans
(7,31)-(7,32)
b
VarG

(7,27)-(7,33)
b
VarG

(7,46)-(7,47)
b
VarG

(7,39)-(7,48)
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
(int * int)
int
(bool * int)
*)
