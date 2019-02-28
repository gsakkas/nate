
let rec digitsOfInt n =
  if n < 0
  then []
  else
    if n < 10 then [n] else (let d = digitsOfInt (n / 10) in d @ [n mod 10]);;

let rec sumList xs =
  match xs with | [] -> 0 | h::t -> let s = sumList t in h + s;;

let rec digitalRoot n =
  if n < 10 then n else digitalRoot sumList digitsOfInt n;;


(* fix

let rec digitsOfInt n =
  if n < 0
  then []
  else
    if n < 10 then [n] else (let d = digitsOfInt (n / 10) in d @ [n mod 10]);;

let rec sumList xs =
  match xs with | [] -> 0 | h::t -> let s = sumList t in h + s;;

let rec digitalRoot n =
  if n < 10 then n else digitalRoot (sumList (digitsOfInt n));;

*)

(* changed spans
(12,24)-(12,57)
digitalRoot (sumList (digitsOfInt n))
AppG (fromList [AppG (fromList [EmptyG])])

*)

(* changed exprs
App (Just (12,24)-(12,61)) (Var (Just (12,24)-(12,35)) "digitalRoot") [App (Just (12,36)-(12,61)) (Var (Just (12,37)-(12,44)) "sumList") [App (Just (12,45)-(12,60)) (Var (Just (12,46)-(12,57)) "digitsOfInt") [Var (Just (12,58)-(12,59)) "n"]]]
*)

(* typed spans
(12,24)-(12,61)
*)

(* correct types
int
*)

(* bad types
int
*)
