
let rec digitsOfInt n =
  let rec loop x listX =
    if x = 0 then listX else loop (x / 10) ((x mod 10) :: listX) in
  match n with | 0 -> [0] | x' -> loop x' [];;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec additivePersistence n =
  let rec loop x y =
    if x = 0 then y else loop ((sumList (digitsOfInt x)) + y) in
  match n with | 0 -> 0 | x' -> loop x' 0;;


(* fix

let rec digitsOfInt n =
  let rec loop x listX =
    if x = 0 then listX else loop (x / 10) ((x mod 10) :: listX) in
  match n with | 0 -> [0] | x' -> loop x' [];;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec additivePersistence n =
  let rec loop x y = if x < 10 then y else (sumList (digitsOfInt x)) + y in
  match n with | 0 -> 0 | x' -> loop x' 0;;

*)

(* changed spans
(11,7)-(11,12)
x < 10
BopG VarG LitG

(11,25)-(11,61)
sumList (digitsOfInt x) + y
BopG (AppG (fromList [EmptyG])) VarG

(11,25)-(11,61)
sumList (digitsOfInt x)
AppG (fromList [AppG (fromList [EmptyG])])

(11,25)-(11,61)
sumList
VarG

(11,25)-(11,61)
digitsOfInt x
AppG (fromList [VarG])

(11,25)-(11,61)
digitsOfInt
VarG

(11,25)-(11,61)
x
VarG

(11,25)-(11,61)
y
VarG

*)

(* changed exprs
Bop (Just (10,24)-(10,30)) Lt (Var (Just (10,24)-(10,25)) "x") (Lit (Just (10,28)-(10,30)) (LI 10))
Bop (Just (10,43)-(10,72)) Plus (App (Just (10,43)-(10,68)) (Var (Just (10,44)-(10,51)) "sumList") [App (Just (10,52)-(10,67)) (Var (Just (10,53)-(10,64)) "digitsOfInt") [Var (Just (10,65)-(10,66)) "x"]]) (Var (Just (10,71)-(10,72)) "y")
App (Just (10,43)-(10,68)) (Var (Just (10,44)-(10,51)) "sumList") [App (Just (10,52)-(10,67)) (Var (Just (10,53)-(10,64)) "digitsOfInt") [Var (Just (10,65)-(10,66)) "x"]]
Var (Just (10,44)-(10,51)) "sumList"
App (Just (10,52)-(10,67)) (Var (Just (10,53)-(10,64)) "digitsOfInt") [Var (Just (10,65)-(10,66)) "x"]
Var (Just (10,53)-(10,64)) "digitsOfInt"
Var (Just (10,65)-(10,66)) "x"
Var (Just (10,71)-(10,72)) "y"
*)

(* typed spans
(10,24)-(10,30)
(10,43)-(10,72)
(10,43)-(10,68)
(10,44)-(10,51)
(10,52)-(10,67)
(10,53)-(10,64)
(10,65)-(10,66)
(10,71)-(10,72)
*)

(* correct types
bool
int
int
int list -> int
int list
int -> int list
int
int
*)

(* bad types
bool
int
int
int
int
int
int
int
*)
