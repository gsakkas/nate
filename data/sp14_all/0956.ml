
let rec append xs x =
  match xs with | [] -> [x] | hd::tl -> hd :: (append tl x);;

let rec digitsOfInt n =
  if n <= 0 then [] else n - ((n / 10) * (10 append digitsOfInt (n / 10)));;


(* fix

let rec digitsOfInt n =
  if n <= 0 then [] else (n - ((n / 10) * 10)) :: (digitsOfInt (n / 10));;

*)

(* changed spans
(6,17)-(6,19)
(n - ((n / 10) * 10)) :: (digitsOfInt (n / 10))
ConAppG (Just (TupleG (fromList [AppG (fromList [BopG VarG LitG]),BopG VarG (BopG (BopG VarG LitG) LitG)])))

*)

(* changed exprs
ConApp (Just (3,25)-(3,72)) "::" (Just (Tuple (Just (3,25)-(3,72)) [Bop (Just (3,25)-(3,46)) Minus (Var (Just (3,26)-(3,27)) "n") (Bop (Just (3,30)-(3,45)) Times (Bop (Just (3,31)-(3,39)) Div (Var (Just (3,32)-(3,33)) "n") (Lit (Just (3,36)-(3,38)) (LI 10))) (Lit (Just (3,42)-(3,44)) (LI 10))),App (Just (3,50)-(3,72)) (Var (Just (3,51)-(3,62)) "digitsOfInt") [Bop (Just (3,63)-(3,71)) Div (Var (Just (3,64)-(3,65)) "n") (Lit (Just (3,68)-(3,70)) (LI 10))]])) Nothing
*)

(* typed spans
(3,25)-(3,72)
*)

(* correct types
int list
*)

(* bad types
'a list
*)
