
let rec reverseInt x y =
  if x != 0 then reverseInt (x / 10) ((y * 10) + (10 mod 10)) else y;;

let rec digitsOfInt n =
  if n < 0
  then []
  else
    (let x = (reverseInt n) / 10
     and y = (reverseInt n) mod 10 in
     if (x = 0) && (y = 0) then [] else y :: (digitsOfInt x));;


(* fix

let rec reverseInt x y =
  if x != 0 then reverseInt (x / 10) ((y * 10) + (10 mod 10)) else y;;

let rec digitsOfInt n =
  if n < 0
  then []
  else
    (let x = (reverseInt n 0) / 10
     and y = (reverseInt n 0) mod 10 in
     if (x = 0) && (y = 0) then [] else y :: (digitsOfInt x));;

*)

(* changed spans
(9,13)-(9,27)
reverseInt n 0
AppG (fromList [VarG,LitG])

(10,13)-(10,27)
reverseInt n 0
AppG (fromList [VarG,LitG])

*)

(* changed exprs
App (Just (9,13)-(9,29)) (Var (Just (9,14)-(9,24)) "reverseInt") [Var (Just (9,25)-(9,26)) "n",Lit (Just (9,27)-(9,28)) (LI 0)]
App (Just (10,13)-(10,29)) (Var (Just (10,14)-(10,24)) "reverseInt") [Var (Just (10,25)-(10,26)) "n",Lit (Just (10,27)-(10,28)) (LI 0)]
*)

(* typed spans
(9,13)-(9,29)
(10,13)-(10,29)
*)

(* correct types
int
int
*)

(* bad types
int -> int
int -> int
*)
