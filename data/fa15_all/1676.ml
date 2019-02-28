
let rec digitsOfInt n =
  if n <= 0
  then []
  else (let x = n mod 10
        and n = n / 10 in (digitsOfInt n) @ [x]);;

let rec additivePersistence n = if n >= 10 then digitsOfInt n;;


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
(8,28)-(8,61)
fun xs ->
  match xs with
  | [] -> 0
  | h :: t -> h + sumList t
LamG (CaseG EmptyG (fromList [(Nothing,EmptyG)]))

(8,32)-(8,61)
fun n ->
  if n < 10
  then 0
  else (let x = myHelper n in
        1 + additivePersistence x)
LamG (IteG EmptyG EmptyG EmptyG)

(8,35)-(8,42)
n < 10
BopG VarG LitG

(8,48)-(8,59)
myHelper
VarG

(8,48)-(8,61)
let x = myHelper n in
1 + additivePersistence x
LetG NonRec (fromList [AppG (fromList [EmptyG])]) (BopG EmptyG EmptyG)

*)

(* typed spans
(8,16)-(8,70)
(12,28)-(13,75)
(13,5)-(13,11)
(13,33)-(13,41)
(13,24)-(13,75)
*)

(* typed spans
int list -> int
int -> int
bool
int -> int
int
*)

(* typed spans
int -> unit
unit
bool
int -> int list
int list
*)
