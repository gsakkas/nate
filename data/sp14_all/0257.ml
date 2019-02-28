
let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec digitalRoot n = if n > 9 then digitalRoot (sumList n) else n;;


(* fix

let rec append l1 l2 = match l1 with | [] -> l2 | h::t -> h :: (append t l2);;

let rec listReverse l =
  match l with | [] -> [] | h::t -> append (listReverse t) [h];;

let rec digitsOfInt n =
  if n <= 0
  then []
  else listReverse ((n mod 10) :: (listReverse (digitsOfInt (n / 10))));;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec digitalRoot n =
  if n > 9 then digitalRoot (sumList (digitsOfInt n)) else n;;

*)

(* changed spans
(2,16)-(2,70)
fun l1 ->
  fun l2 ->
    match l1 with
    | [] -> l2
    | h :: t -> h :: (append t l2)
LamG (LamG EmptyG)

(2,16)-(2,70)
fun l ->
  match l with
  | [] -> []
  | h :: t -> append (listReverse t)
                     [h]
LamG (CaseG EmptyG (fromList [(Nothing,EmptyG)]))

(2,16)-(2,70)
fun n ->
  if n <= 0
  then []
  else listReverse ((n mod 10) :: (listReverse (digitsOfInt (n / 10))))
LamG (IteG EmptyG EmptyG EmptyG)

(4,59)-(4,60)
digitsOfInt n
AppG (fromList [VarG])

*)

(* changed exprs
Lam (Just (2,15)-(2,76)) (VarPat (Just (2,15)-(2,17)) "l1") (Lam (Just (2,18)-(2,76)) (VarPat (Just (2,18)-(2,20)) "l2") (Case (Just (2,23)-(2,76)) (Var (Just (2,29)-(2,31)) "l1") [(ConPat (Just (2,39)-(2,41)) "[]" Nothing,Nothing,Var (Just (2,45)-(2,47)) "l2"),(ConsPat (Just (2,50)-(2,54)) (VarPat (Just (2,50)-(2,51)) "h") (VarPat (Just (2,53)-(2,54)) "t"),Nothing,ConApp (Just (2,58)-(2,76)) "::" (Just (Tuple (Just (2,58)-(2,76)) [Var (Just (2,58)-(2,59)) "h",App (Just (2,63)-(2,76)) (Var (Just (2,64)-(2,70)) "append") [Var (Just (2,71)-(2,72)) "t",Var (Just (2,73)-(2,75)) "l2"]])) Nothing)]) Nothing) Nothing
Lam (Just (4,20)-(5,62)) (VarPat (Just (4,20)-(4,21)) "l") (Case (Just (5,2)-(5,62)) (Var (Just (5,8)-(5,9)) "l") [(ConPat (Just (5,17)-(5,19)) "[]" Nothing,Nothing,List (Just (5,23)-(5,25)) [] Nothing),(ConsPat (Just (5,28)-(5,32)) (VarPat (Just (5,28)-(5,29)) "h") (VarPat (Just (5,31)-(5,32)) "t"),Nothing,App (Just (5,36)-(5,62)) (Var (Just (5,36)-(5,42)) "append") [App (Just (5,43)-(5,58)) (Var (Just (5,44)-(5,55)) "listReverse") [Var (Just (5,56)-(5,57)) "t"],List (Just (5,59)-(5,62)) [Var (Just (5,60)-(5,61)) "h"] Nothing])]) Nothing
Lam (Just (7,20)-(10,71)) (VarPat (Just (7,20)-(7,21)) "n") (Ite (Just (8,2)-(10,71)) (Bop (Just (8,5)-(8,11)) Le (Var (Just (8,5)-(8,6)) "n") (Lit (Just (8,10)-(8,11)) (LI 0))) (List (Just (9,7)-(9,9)) [] Nothing) (App (Just (10,7)-(10,71)) (Var (Just (10,7)-(10,18)) "listReverse") [ConApp (Just (10,19)-(10,71)) "::" (Just (Tuple (Just (10,20)-(10,70)) [Bop (Just (10,20)-(10,30)) Mod (Var (Just (10,21)-(10,22)) "n") (Lit (Just (10,27)-(10,29)) (LI 10)),App (Just (10,34)-(10,70)) (Var (Just (10,35)-(10,46)) "listReverse") [App (Just (10,47)-(10,69)) (Var (Just (10,48)-(10,59)) "digitsOfInt") [Bop (Just (10,60)-(10,68)) Div (Var (Just (10,61)-(10,62)) "n") (Lit (Just (10,65)-(10,67)) (LI 10))]]])) Nothing])) Nothing
App (Just (15,37)-(15,52)) (Var (Just (15,38)-(15,49)) "digitsOfInt") [Var (Just (15,50)-(15,51)) "n"]
*)

(* typed spans
(2,15)-(2,76)
(4,20)-(5,62)
(7,20)-(10,71)
(15,37)-(15,52)
*)

(* correct types
int list -> int list -> int list
int list -> int list
int -> int list
int list
*)

(* bad types
int list -> int
int list -> int
int list -> int
int
*)
