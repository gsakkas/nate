
let rec digitsOfInt n =
  if n <= 0 then [] else (n - ((n / 10) * 10)) :: ((digitsOfInt n) / 10);;


(* fix

let rec digitsOfInt n =
  if n <= 0 then [] else (n - ((n / 10) * 10)) :: (digitsOfInt (n / 10));;

*)

(* changed spans
(3,50)-(3,72)
digitsOfInt (n / 10)
AppG (fromList [BopG EmptyG EmptyG])

*)

(* changed exprs
App (Just (3,50)-(3,72)) (Var (Just (3,51)-(3,62)) "digitsOfInt") [Bop (Just (3,63)-(3,71)) Div (Var (Just (3,64)-(3,65)) "n") (Lit (Just (3,68)-(3,70)) (LI 10))]
*)

(* typed spans
(3,50)-(3,72)
*)

(* correct types
int list
*)

(* bad types
int
*)
