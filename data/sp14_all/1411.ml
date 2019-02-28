
let rec digitalRoot n =
  if n <= 9
  then n
  else
    (let rec r_digitalRoot n m =
       if n <= 9 then n else r_digitalRoot (n / 10) ((n mod 10) + m) in
     match n with | 0 -> 123 | _ -> (r_digitalRoot n) - 1);;


(* fix

let rec digitalRoot n =
  if n <= 9
  then n
  else
    (let rec r_digitalRoot n m =
       if n <= 9 then n else r_digitalRoot (n / 10) ((n mod 10) + m) in
     match n with | 0 -> 123 | _ -> r_digitalRoot n (-1));;

*)

(* changed spans
(8,36)-(8,57)
r_digitalRoot n (-1)
AppG (fromList [VarG,LitG])

*)

(* changed exprs
App (Just (8,36)-(8,56)) (Var (Just (8,36)-(8,49)) "r_digitalRoot") [Var (Just (8,50)-(8,51)) "n",Lit (Just (8,52)-(8,56)) (LI (-1))]
*)

(* typed spans
(8,36)-(8,56)
*)

(* correct types
int
*)

(* bad types
int
*)
