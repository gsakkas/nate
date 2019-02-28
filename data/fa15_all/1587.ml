
let rec digitsOfInt n =
  if n <= 0 then [] else (digitsOfInt (n / 10)) @ [n mod 10];;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec additivePersistence n =
  let rec recCounter n count =
    if n < 10
    then count
    else recCounter ((sumList (digitsOfInt n)) (count + 1)) in
  recCounter n 0;;


(* fix

let rec digitsOfInt n =
  if n <= 0 then [] else (digitsOfInt (n / 10)) @ [n mod 10];;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec additivePersistence n =
  let rec recCounter n count =
    if n < 10
    then count
    else (recCounter (sumList (digitsOfInt n)) count) + 1 in
  recCounter n 0;;

*)

(* changed spans
(11,9)-(11,59)
recCounter (sumList (digitsOfInt n))
           count + 1
BopG (AppG (fromList [EmptyG])) LitG

*)

(* changed exprs
Bop (Just (11,9)-(11,57)) Plus (App (Just (11,9)-(11,53)) (Var (Just (11,10)-(11,20)) "recCounter") [App (Just (11,21)-(11,46)) (Var (Just (11,22)-(11,29)) "sumList") [App (Just (11,30)-(11,45)) (Var (Just (11,31)-(11,42)) "digitsOfInt") [Var (Just (11,43)-(11,44)) "n"]],Var (Just (11,47)-(11,52)) "count"]) (Lit (Just (11,56)-(11,57)) (LI 1))
*)

(* typed spans
(11,9)-(11,57)
*)

(* correct types
int
*)

(* bad types
int
*)
