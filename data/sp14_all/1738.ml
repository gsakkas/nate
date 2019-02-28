
let rec listReverse l =
  match l with | [] -> [] | h::t -> (listReverse t) @ [h];;

let rec digitsOfInt n =
  if n <= 0
  then []
  else
    (let leading = (digitsOfInt (n / 10)) :: (n mod 10) in
     listReverse leading);;


(* fix

let rec digitsOfInt n =
  if n <= 0
  then []
  else (let digits = digitsOfInt (n / 10) in digits @ [n mod 10]);;

*)

(* changed spans
(9,4)-(10,25)
let digits =
  digitsOfInt (n / 10) in
digits @ [n mod 10]
LetG NonRec (fromList [AppG (fromList [EmptyG])]) (AppG (fromList [EmptyG]))

*)

(* changed exprs
Let (Just (5,7)-(5,65)) NonRec [(VarPat (Just (5,12)-(5,18)) "digits",App (Just (5,21)-(5,41)) (Var (Just (5,21)-(5,32)) "digitsOfInt") [Bop (Just (5,33)-(5,41)) Div (Var (Just (5,34)-(5,35)) "n") (Lit (Just (5,38)-(5,40)) (LI 10))])] (App (Just (5,45)-(5,64)) (Var (Just (5,52)-(5,53)) "@") [Var (Just (5,45)-(5,51)) "digits",List (Just (5,54)-(5,64)) [Bop (Just (5,55)-(5,63)) Mod (Var (Just (5,55)-(5,56)) "n") (Lit (Just (5,61)-(5,63)) (LI 10))] Nothing])
*)

(* typed spans
(5,7)-(5,65)
*)

(* correct types
int list
*)

(* bad types
'a list
*)
