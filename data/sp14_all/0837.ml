
let rec addList xs = match xs with | [] -> 0 | h::t -> h + (addList t);;

let rec digitsOfInt n =
  if n < 1 then [] else (digitsOfInt (n / 10)) @ [n mod 10];;

let rec additivePersistence n =
  let count = 0 in
  if (List.length (digitsOfInt n)) = 1
  then count
  else count = (count + (1 additivePersistence (addList (digitsOfInt n))));;


(* fix

let rec addList xs = match xs with | [] -> 0 | h::t -> h + (addList t);;

let rec digitsOfInt n =
  if n < 1 then [] else (digitsOfInt (n / 10)) @ [n mod 10];;

let rec addNum n = if n < 10 then n else addList (digitsOfInt n);;

let rec addHelp (count,n) =
  if n < 10 then count + 1 else addHelp ((count + 1), (addNum n));;

let rec additivePersistence n = addHelp (0, n);;

*)

(* changed spans
(8,2)-(11,74)
if n < 10
then n
else addList (digitsOfInt n)
IteG (BopG EmptyG EmptyG) VarG (AppG (fromList [EmptyG]))

(11,7)-(11,74)
fun (count , n) ->
  if n < 10
  then count + 1
  else addHelp (count + 1 , addNum n)
LamG (IteG EmptyG EmptyG EmptyG)

(11,56)-(11,71)
fun n -> addHelp (0 , n)
LamG (AppG (fromList [EmptyG]))

(11,57)-(11,68)
addHelp
VarG

(11,69)-(11,70)
(0 , n)
TupleG (fromList [VarG,LitG])

*)

(* changed exprs
Ite (Just (7,19)-(7,64)) (Bop (Just (7,22)-(7,28)) Lt (Var (Just (7,22)-(7,23)) "n") (Lit (Just (7,26)-(7,28)) (LI 10))) (Var (Just (7,34)-(7,35)) "n") (App (Just (7,41)-(7,64)) (Var (Just (7,41)-(7,48)) "addList") [App (Just (7,49)-(7,64)) (Var (Just (7,50)-(7,61)) "digitsOfInt") [Var (Just (7,62)-(7,63)) "n"]])
Lam (Just (9,17)-(10,65)) (TuplePat (Just (9,17)-(9,24)) [VarPat (Just (9,17)-(9,22)) "count",VarPat (Just (9,23)-(9,24)) "n"]) (Ite (Just (10,2)-(10,65)) (Bop (Just (10,5)-(10,11)) Lt (Var (Just (10,5)-(10,6)) "n") (Lit (Just (10,9)-(10,11)) (LI 10))) (Bop (Just (10,17)-(10,26)) Plus (Var (Just (10,17)-(10,22)) "count") (Lit (Just (10,25)-(10,26)) (LI 1))) (App (Just (10,32)-(10,65)) (Var (Just (10,32)-(10,39)) "addHelp") [Tuple (Just (10,40)-(10,65)) [Bop (Just (10,41)-(10,52)) Plus (Var (Just (10,42)-(10,47)) "count") (Lit (Just (10,50)-(10,51)) (LI 1)),App (Just (10,54)-(10,64)) (Var (Just (10,55)-(10,61)) "addNum") [Var (Just (10,62)-(10,63)) "n"]]])) Nothing
Lam (Just (12,28)-(12,46)) (VarPat (Just (12,28)-(12,29)) "n") (App (Just (12,32)-(12,46)) (Var (Just (12,32)-(12,39)) "addHelp") [Tuple (Just (12,40)-(12,46)) [Lit (Just (12,41)-(12,42)) (LI 0),Var (Just (12,44)-(12,45)) "n"]]) Nothing
Var (Just (12,32)-(12,39)) "addHelp"
Tuple (Just (12,40)-(12,46)) [Lit (Just (12,41)-(12,42)) (LI 0),Var (Just (12,44)-(12,45)) "n"]
*)

(* typed spans
(7,19)-(7,64)
(9,17)-(10,65)
(12,28)-(12,46)
(12,32)-(12,39)
(12,40)-(12,46)
*)

(* correct types
int
(int * int) -> int
int -> int
(int * int) -> int
(int * int)
*)

(* bad types
bool
bool
int list
int -> int list
int
*)
