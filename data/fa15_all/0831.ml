
let modulus ss = ss mod 10;;

let rec digitsOfInt n =
  if n <= 0
  then []
  else (match n with | x -> (digitsOfInt (n / 10)) @ [modulus x]);;

let lt10 q = q < 10;;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec additivePersistence n =
  if lt10 n
  then n
  else
    (match n with
     | n ->
         let x_ = digitsOfInt n in
         (sumList x_) = (let xx = sumList x_ in additivePersistence xx));;


(* fix

let modulus ss = ss mod 10;;

let rec digitsOfInt n =
  if n <= 0
  then []
  else (match n with | x -> (digitsOfInt (n / 10)) @ [modulus x]);;

let lt10 q = q < 10;;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec additivePersistence n =
  if lt10 n
  then n
  else
    (match n with
     | n ->
         let n1 = let x0 = digitsOfInt n in sumList x0 in
         additivePersistence n1);;

*)

(* changed spans
(19,9)-(20,71)
let n1 =
  (let x0 = digitsOfInt n in
   sumList x0) in
additivePersistence n1
LetG NonRec (fromList [LetG NonRec (fromList [EmptyG]) EmptyG]) (AppG (fromList [EmptyG]))

*)

(* changed exprs
Let (Just (19,9)-(20,31)) NonRec [(VarPat (Just (19,13)-(19,15)) "n1",Let (Just (19,18)-(19,54)) NonRec [(VarPat (Just (19,22)-(19,24)) "x0",App (Just (19,27)-(19,40)) (Var (Just (19,27)-(19,38)) "digitsOfInt") [Var (Just (19,39)-(19,40)) "n"])] (App (Just (19,44)-(19,54)) (Var (Just (19,44)-(19,51)) "sumList") [Var (Just (19,52)-(19,54)) "x0"]))] (App (Just (20,9)-(20,31)) (Var (Just (20,9)-(20,28)) "additivePersistence") [Var (Just (20,29)-(20,31)) "n1"])
*)

(* typed spans
(19,9)-(20,31)
*)

(* correct types
int
*)

(* bad types
bool
*)
