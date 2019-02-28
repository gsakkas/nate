
let rec digitsOfInt n =
  let rec helper n l = if n = 0 then l else helper (n / 10) ((n mod 10) :: l) in
  match n with | 0 -> [0] | _ -> helper n [];;

let digits n = digitsOfInt (abs n);;

let rec additivePersistence n =
  if (List.length (digits n)) = 1
  then List.hd (digits n)
  else additivePersistence (digits n);;


(* fix

let rec digitsOfInt n =
  let rec helper n l = if n = 0 then l else helper (n / 10) ((n mod 10) :: l) in
  match n with | 0 -> [0] | _ -> helper n [];;

let digits n = digitsOfInt (abs n);;

let rec additivePersistence n =
  if (List.length (digits n)) = 1
  then List.hd (digits n)
  else additivePersistence (n / 10);;

*)

(* changed spans
(11,27)-(11,37)
n / 10
BopG VarG LitG

*)

(* changed exprs
Bop (Just (11,27)-(11,35)) Div (Var (Just (11,28)-(11,29)) "n") (Lit (Just (11,32)-(11,34)) (LI 10))
*)

(* typed spans
(11,27)-(11,35)
*)

(* correct types
int
*)

(* bad types
int list
*)
