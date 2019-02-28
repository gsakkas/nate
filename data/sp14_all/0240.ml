
let rec append x y = match y with | [] -> [x] | h::t -> h :: (append x t);;

let rec digitsOfInt n =
  if n < 0
  then []
  else
    (let (x,y) = ((n mod 10), (n / 10)) in
     if n < 10 then [n] else append x (digitsOfInt y));;

let digits n = digitsOfInt (abs n);;

let rec numdigits x = match x with | [] -> 0 | h::t -> 1 + (numdigits x);;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec additivePersistence n =
  if (sumList (digits n)) < 10
  then numdigits n
  else additivePersistence sumList n;;


(* fix

let rec append x y = match y with | [] -> [x] | h::t -> h :: (append x t);;

let rec digitsOfInt n =
  if n < 0
  then []
  else
    (let (x,y) = ((n mod 10), (n / 10)) in
     if n < 10 then [n] else append x (digitsOfInt y));;

let digits n = digitsOfInt (abs n);;

let rec numdigits x = match x with | [] -> 0 | h::t -> 1 + (numdigits x);;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec additivePersistence n =
  if (sumList (digits n)) < 10
  then numdigits (digits n)
  else additivePersistence (sumList (digits n));;

*)

(* changed spans
(19,17)-(19,18)
digits n
AppG (fromList [VarG])

(20,7)-(20,36)
additivePersistence (sumList (digits n))
AppG (fromList [AppG (fromList [EmptyG])])

*)

(* changed exprs
App (Just (19,17)-(19,27)) (Var (Just (19,18)-(19,24)) "digits") [Var (Just (19,25)-(19,26)) "n"]
App (Just (20,7)-(20,47)) (Var (Just (20,7)-(20,26)) "additivePersistence") [App (Just (20,27)-(20,47)) (Var (Just (20,28)-(20,35)) "sumList") [App (Just (20,36)-(20,46)) (Var (Just (20,37)-(20,43)) "digits") [Var (Just (20,44)-(20,45)) "n"]]]
*)

(* typed spans
(19,17)-(19,27)
(20,7)-(20,47)
*)

(* correct types
int list
int
*)

(* bad types
int
'a
*)
