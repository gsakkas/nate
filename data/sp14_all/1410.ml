
let rec digitalRoot n =
  if n = 0
  then 0
  else
    (let rec r_digitalRoot n m =
       if n <= 9 then n else r_digitalRoot (n / 10) ((n mod 10) + m) in
     match n with | 0 -> r_digitalRoot | _ -> r_digitalRoot n (n mod 10));;


(* fix

let rec digitalRoot n =
  if n = 0
  then 0
  else
    (let rec r_digitalRoot n m =
       if n <= 9 then n else r_digitalRoot (n / 10) ((n mod 10) + m) in
     match n with | 0 -> 0 | _ -> r_digitalRoot n 0);;

*)

(* changed spans
(8,25)-(8,38)
0
LitG

(8,62)-(8,72)
0
LitG

*)

(* changed exprs
Lit (Just (8,25)-(8,26)) (LI 0)
Lit (Just (8,50)-(8,51)) (LI 0)
*)

(* typed spans
(8,25)-(8,26)
(8,50)-(8,51)
*)

(* correct types
int
int
*)

(* bad types
int -> int -> int
int
*)
