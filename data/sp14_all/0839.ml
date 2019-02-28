
let rec sumDigits n1 =
  if n1 < 10 then n1 else (n1 mod 10) + (sumDigits (n1 / 10));;

let rec digitalRoot n = if n > 10 then digitalRoot sumDigits n else n;;


(* fix

let rec sumDigits n1 =
  if n1 < 10 then n1 else (n1 mod 10) + (sumDigits (n1 / 10));;

let rec digitalRoot n = if n > 10 then digitalRoot (sumDigits n) else n;;

*)

(* changed spans
(5,39)-(5,62)
digitalRoot (sumDigits n)
AppG (fromList [AppG (fromList [EmptyG])])

*)

(* changed exprs
App (Just (5,39)-(5,64)) (Var (Just (5,39)-(5,50)) "digitalRoot") [App (Just (5,51)-(5,64)) (Var (Just (5,52)-(5,61)) "sumDigits") [Var (Just (5,62)-(5,63)) "n"]]
*)

(* typed spans
(5,39)-(5,64)
*)

(* correct types
int
*)

(* bad types
int
*)
