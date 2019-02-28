
let rec digitsOfInt n =
  match n < 0 with
  | true  -> []
  | false  ->
      if (n / 10) = 0 then n mod 10 else (digitsOfInt (n / 10)) :: (n mod 10);;


(* fix

let rec digitsOfInt n =
  match n < 0 with
  | true  -> []
  | false  ->
      if (n / 10) = 0
      then [n mod 10]
      else (digitsOfInt (n / 10)) @ [n mod 10];;

let _ = digitsOfInt 3124;;

*)

(* changed spans
(6,27)-(6,35)
[n mod 10]
ListG (BopG EmptyG EmptyG)

(6,41)-(6,77)
digitsOfInt (n / 10) @ [n mod 10]
AppG (fromList [AppG (fromList [EmptyG]),ListG EmptyG])

*)

(* changed exprs
List (Just (7,11)-(7,21)) [Bop (Just (7,12)-(7,20)) Mod (Var (Just (7,12)-(7,13)) "n") (Lit (Just (7,18)-(7,20)) (LI 10))] Nothing
App (Just (8,11)-(8,46)) (Var (Just (8,34)-(8,35)) "@") [App (Just (8,11)-(8,33)) (Var (Just (8,12)-(8,23)) "digitsOfInt") [Bop (Just (8,24)-(8,32)) Div (Var (Just (8,25)-(8,26)) "n") (Lit (Just (8,29)-(8,31)) (LI 10))],List (Just (8,36)-(8,46)) [Bop (Just (8,37)-(8,45)) Mod (Var (Just (8,37)-(8,38)) "n") (Lit (Just (8,43)-(8,45)) (LI 10))] Nothing]
*)

(* typed spans
(7,11)-(7,21)
(8,11)-(8,46)
*)

(* correct types
int list
int list
*)

(* bad types
int
'a list
*)
