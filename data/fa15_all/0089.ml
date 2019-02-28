
let rec digitsOfInt n =
  let return = [n mod 10] in
  if (n / 10) <> 0
  then ((n mod 10) :: return; (digitsOfInt (n / 10)) @ return)
  else return;;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec digitalRoot n =
  let digits = digitsOfInt n in
  let s = sumList digits in
  if (n / 10) <> 0
  then (print_int n; print_endline " "; digitalRoot)
  else digits;;


(* fix

let rec digitsOfInt n =
  let return = [n mod 10] in
  if (n / 10) <> 0
  then ((n mod 10) :: return; (digitsOfInt (n / 10)) @ return)
  else return;;

let digits n = digitsOfInt (abs n);;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec digitalRoot n =
  let d = digits n in
  let s = sumList d in if (n / 10) <> 0 then digitalRoot s else s;;

*)

(* changed spans
(8,16)-(8,70)
fun n -> digitsOfInt (abs n)
LamG (AppG (fromList [EmptyG]))

(11,2)-(15,13)
let d = digits n in
let s = sumList d in
if (n / 10) <> 0
then digitalRoot s
else s
LetG NonRec (fromList [AppG (fromList [EmptyG])]) (LetG NonRec (fromList [EmptyG]) EmptyG)

*)

(* changed exprs
Lam (Just (8,11)-(8,34)) (VarPat (Just (8,11)-(8,12)) "n") (App (Just (8,15)-(8,34)) (Var (Just (8,15)-(8,26)) "digitsOfInt") [App (Just (8,27)-(8,34)) (Var (Just (8,28)-(8,31)) "abs") [Var (Just (8,32)-(8,33)) "n"]]) Nothing
Let (Just (13,2)-(14,65)) NonRec [(VarPat (Just (13,6)-(13,7)) "d",App (Just (13,10)-(13,18)) (Var (Just (13,10)-(13,16)) "digits") [Var (Just (13,17)-(13,18)) "n"])] (Let (Just (14,2)-(14,65)) NonRec [(VarPat (Just (14,6)-(14,7)) "s",App (Just (14,10)-(14,19)) (Var (Just (14,10)-(14,17)) "sumList") [Var (Just (14,18)-(14,19)) "d"])] (Ite (Just (14,23)-(14,65)) (Bop (Just (14,26)-(14,39)) Neq (Bop (Just (14,26)-(14,34)) Div (Var (Just (14,27)-(14,28)) "n") (Lit (Just (14,31)-(14,33)) (LI 10))) (Lit (Just (14,38)-(14,39)) (LI 0))) (App (Just (14,45)-(14,58)) (Var (Just (14,45)-(14,56)) "digitalRoot") [Var (Just (14,57)-(14,58)) "s"]) (Var (Just (14,64)-(14,65)) "s")))
*)

(* typed spans
(8,11)-(8,34)
(13,2)-(14,65)
*)

(* correct types
int -> int list
int
*)

(* bad types
int list -> int
int list
*)
