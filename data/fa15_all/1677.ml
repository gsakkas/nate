
let rec digitsOfInt n =
  if n <= 0
  then []
  else (let x = n mod 10
        and n = n / 10 in (digitsOfInt n) @ [x]);;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec additivePersistence n = if n >= 10 then sumList digitsOfInt n;;


(* fix

let rec digitsOfInt n =
  if n <= 0
  then []
  else (let x = n mod 10
        and n = n / 10 in (digitsOfInt n) @ [x]);;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let myHelper n = let n = digitsOfInt n in sumList n;;

let rec additivePersistence n =
  if n < 10 then 0 else (let x = myHelper n in 1 + (additivePersistence x));;

*)

(* changed spans
(10,32)-(10,69)
let n = digitsOfInt n in
sumList n
LetG NonRec (fromList [AppG (fromList [EmptyG])]) (AppG (fromList [EmptyG]))

(10,32)-(10,69)
fun n ->
  if n < 10
  then 0
  else (let x = myHelper n in
        1 + additivePersistence x)
LamG (IteG EmptyG EmptyG EmptyG)

(10,35)-(10,42)
n < 10
BopG VarG LitG

(10,48)-(10,69)
0
LitG

(10,68)-(10,69)
let x = myHelper n in
1 + additivePersistence x
LetG NonRec (fromList [AppG (fromList [EmptyG])]) (BopG EmptyG EmptyG)

(10,32)-(10,69)
1 + additivePersistence x
BopG LitG (AppG (fromList [EmptyG]))

*)

(* changed exprs
Let (Just (10,17)-(10,51)) NonRec [(VarPat (Just (10,21)-(10,22)) "n",App (Just (10,25)-(10,38)) (Var (Just (10,25)-(10,36)) "digitsOfInt") [Var (Just (10,37)-(10,38)) "n"])] (App (Just (10,42)-(10,51)) (Var (Just (10,42)-(10,49)) "sumList") [Var (Just (10,50)-(10,51)) "n"])
Lam (Just (12,28)-(13,75)) (VarPat (Just (12,28)-(12,29)) "n") (Ite (Just (13,2)-(13,75)) (Bop (Just (13,5)-(13,11)) Lt (Var (Just (13,5)-(13,6)) "n") (Lit (Just (13,9)-(13,11)) (LI 10))) (Lit (Just (13,17)-(13,18)) (LI 0)) (Let (Just (13,24)-(13,75)) NonRec [(VarPat (Just (13,29)-(13,30)) "x",App (Just (13,33)-(13,43)) (Var (Just (13,33)-(13,41)) "myHelper") [Var (Just (13,42)-(13,43)) "n"])] (Bop (Just (13,47)-(13,74)) Plus (Lit (Just (13,47)-(13,48)) (LI 1)) (App (Just (13,51)-(13,74)) (Var (Just (13,52)-(13,71)) "additivePersistence") [Var (Just (13,72)-(13,73)) "x"])))) Nothing
Bop (Just (13,5)-(13,11)) Lt (Var (Just (13,5)-(13,6)) "n") (Lit (Just (13,9)-(13,11)) (LI 10))
Lit (Just (13,17)-(13,18)) (LI 0)
Let (Just (13,24)-(13,75)) NonRec [(VarPat (Just (13,29)-(13,30)) "x",App (Just (13,33)-(13,43)) (Var (Just (13,33)-(13,41)) "myHelper") [Var (Just (13,42)-(13,43)) "n"])] (Bop (Just (13,47)-(13,74)) Plus (Lit (Just (13,47)-(13,48)) (LI 1)) (App (Just (13,51)-(13,74)) (Var (Just (13,52)-(13,71)) "additivePersistence") [Var (Just (13,72)-(13,73)) "x"]))
Bop (Just (13,47)-(13,74)) Plus (Lit (Just (13,47)-(13,48)) (LI 1)) (App (Just (13,51)-(13,74)) (Var (Just (13,52)-(13,71)) "additivePersistence") [Var (Just (13,72)-(13,73)) "x"])
*)

(* typed spans
(10,17)-(10,51)
(12,28)-(13,75)
(13,5)-(13,11)
(13,17)-(13,18)
(13,24)-(13,75)
(13,47)-(13,74)
*)

(* correct types
int
int -> int
bool
int
int
int
*)

(* bad types
unit
unit
bool
unit
int
unit
*)
