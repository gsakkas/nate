
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
fun n ->
  if n < 10
  then 0
  else (let x = myHelper n in
        1 + additivePersistence x)
LamG (IteG EmptyG EmptyG EmptyG)

(10,35)-(10,42)
n < 10
BopG VarG LitG

(10,48)-(10,55)
EMPTY
EmptyG

(10,48)-(10,69)
EMPTY
EmptyG

(10,56)-(10,67)
0
LitG

(10,68)-(10,69)
let x = myHelper n in
1 + additivePersistence x
LetG NonRec (fromList [AppG (fromList [EmptyG])]) (BopG EmptyG EmptyG)

*)
