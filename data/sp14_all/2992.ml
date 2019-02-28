
let rec digitsOfInt n =
  if n <= 0
  then []
  else
    (let rec loop n a = if n = 0 then a else loop (n / 10) ((n mod 10) :: a) in
     match n with | 0 -> [0] | _ -> loop n []);;

let rec sumList xs = match xs with | [] -> 0 | x::xs' -> x + (sumList xs');;

let rec additivePersistence n =
  if n < 10 then n else n = (sumList (digitsOfInt n));;


(* fix

let a = int_of_char '3';;

let rec digitsOfInt n =
  if n <= 0
  then []
  else
    (let rec loop n a = if n = 0 then a else loop (n / 10) ((n mod 10) :: a) in
     match n with | 0 -> [0] | _ -> loop n []);;

let rec sumList xs = match xs with | [] -> 0 | x::xs' -> x + (sumList xs');;

let rec additivePersistence n =
  if n < 10 then a else additivePersistence (sumList (digitsOfInt n));;

*)

(* changed spans
(2,20)-(7,46)
int_of_char '3'
AppG (fromList [LitG])

(12,24)-(12,53)
a
VarG

(12,29)-(12,36)
additivePersistence
VarG

(12,29)-(12,36)
sumList (digitsOfInt n)
AppG (fromList [AppG (fromList [EmptyG])])

*)

(* changed exprs
App (Just (2,8)-(2,23)) (Var (Just (2,8)-(2,19)) "int_of_char") [Lit (Just (2,20)-(2,23)) (LC '3')]
Var (Just (14,17)-(14,18)) "a"
Var (Just (14,24)-(14,43)) "additivePersistence"
App (Just (14,44)-(14,69)) (Var (Just (14,45)-(14,52)) "sumList") [App (Just (14,53)-(14,68)) (Var (Just (14,54)-(14,65)) "digitsOfInt") [Var (Just (14,66)-(14,67)) "n"]]
*)

(* typed spans
(2,8)-(2,23)
(14,17)-(14,18)
(14,24)-(14,43)
(14,44)-(14,69)
*)

(* correct types
int
int
int -> int
int
*)

(* bad types
int -> int list
bool
int list -> int
int list -> int
*)
