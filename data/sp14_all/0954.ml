
let rec sumList xs = match xs with | [] -> 0 | hd::tl -> hd + (sumList tl);;

let rec additivePersistence n =
  if n < 10 then 0 else 1 + (additivePersistence (sumList n));;


(* fix

let rec append xs1 xs2 =
  match xs1 with | [] -> xs2 | hd::tl -> hd :: (append tl xs2);;

let rec digitsOfInt n =
  if n <= 0 then [] else append (digitsOfInt (n / 10)) [n - ((n / 10) * 10)];;

let digits n = digitsOfInt (abs n);;

let rec sumList xs = match xs with | [] -> 0 | hd::tl -> hd + (sumList tl);;

let rec additivePersistence n =
  if n < 10 then 0 else 1 + (additivePersistence (sumList (digits n)));;

*)

(* changed spans
(2,16)-(2,74)
fun n ->
  if n <= 0
  then []
  else append (digitsOfInt (n / 10))
              [n - ((n / 10) * 10)]
LamG (IteG EmptyG EmptyG EmptyG)

(5,58)-(5,59)
digits n
AppG (fromList [VarG])

*)
