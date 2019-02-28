
let rec digitsOfInt n =
  if n <= 0 then [] else (digitsOfInt (n / 10)) @ [n mod 10];;

let rec sumList xs =
  match xs with | [] -> 0 | head::tail -> head + (sumList tail);;

let rec additivePersistence n =
  let x = digitsOfInt in
  match x with
  | [] -> 0
  | head::[] -> 0
  | head::tail -> 1 + (additivePersistence (sumList x));;


(* fix

let rec digitsOfInt n =
  if n <= 0 then [] else (digitsOfInt (n / 10)) @ [n mod 10];;

let rec sumList xs =
  match xs with | [] -> 0 | head::tail -> head + (sumList tail);;

let rec additivePersistence n =
  let x = digitsOfInt n in
  match x with
  | [] -> 0
  | head::[] -> 0
  | head::tail -> 1 + (additivePersistence (sumList x));;

*)

(* changed spans
(9,10)-(9,21)
digitsOfInt n
AppG (fromList [VarG])

*)

(* changed exprs
App (Just (9,10)-(9,23)) (Var (Just (9,10)-(9,21)) "digitsOfInt") [Var (Just (9,22)-(9,23)) "n"]
*)

(* typed spans
(9,10)-(9,23)
*)

(* correct types
int list
*)

(* bad types
int -> int list
*)
