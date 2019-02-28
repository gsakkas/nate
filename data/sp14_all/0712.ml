
let rec digitsOfInt n =
  if ((n mod 2) = 0) && (n > 0)
  then
    let rec loop input =
      if input = 0 then [] else (loop (input / 10)) @ [input mod 10] in
    loop n
  else [];;

let digits n = digitsOfInt (abs n);;

let rec sumList xs =
  if xs = [] then 0 else (let h::t = xs in h + (sumList t));;

let rec additivePersistence n =
  if (n / 10) = 0 then n else additivePersistence (sumList digits n);;


(* fix

let rec digitsOfInt n =
  if ((n mod 2) = 0) && (n > 0)
  then
    let rec loop input =
      if input = 0 then [] else (loop (input / 10)) @ [input mod 10] in
    loop n
  else [];;

let digits n = digitsOfInt (abs n);;

let rec sumList xs =
  if xs = [] then 0 else (let h::t = xs in h + (sumList t));;

let rec additivePersistence n =
  if (n / 10) = 0 then n else additivePersistence (sumList (digits n));;

*)

(* changed spans
(16,50)-(16,68)
sumList (digits n)
AppG (fromList [AppG (fromList [EmptyG])])

*)

(* changed exprs
App (Just (16,50)-(16,70)) (Var (Just (16,51)-(16,58)) "sumList") [App (Just (16,59)-(16,69)) (Var (Just (16,60)-(16,66)) "digits") [Var (Just (16,67)-(16,68)) "n"]]
*)

(* typed spans
(16,50)-(16,70)
*)

(* correct types
int
*)

(* bad types
int
*)
