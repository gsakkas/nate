
let rec myAppend l n = match l with | [] -> [n] | h::t -> h :: (myAppend t n);;

let rec digitsOfInt n =
  if n = 0
  then [0]
  else if n > 0 then myAppend [digitsOfInt (n / 10)] (n mod 10) else [];;


(* fix

let rec myAppend l n = match l with | [] -> [n] | h::t -> h :: (myAppend t n);;

let rec getDigits n =
  match n with | 0 -> [] | _ -> myAppend (getDigits (n / 10)) (n mod 10);;

let rec digitsOfInt n = if n = 0 then [0] else getDigits n;;

*)

(* changed spans
(5,2)-(7,71)
match n with
| 0 -> []
| _ -> myAppend (getDigits (n / 10))
                (n mod 10)
CaseG VarG (fromList [(Nothing,AppG (fromList [EmptyG])),(Nothing,ListG EmptyG)])

*)

(* changed exprs
Case (Just (5,2)-(5,72)) (Var (Just (5,8)-(5,9)) "n") [(LitPat (Just (5,17)-(5,18)) (LI 0),Nothing,List (Just (5,22)-(5,24)) [] Nothing),(WildPat (Just (5,27)-(5,28)),Nothing,App (Just (5,32)-(5,72)) (Var (Just (5,32)-(5,40)) "myAppend") [App (Just (5,41)-(5,61)) (Var (Just (5,42)-(5,51)) "getDigits") [Bop (Just (5,52)-(5,60)) Div (Var (Just (5,53)-(5,54)) "n") (Lit (Just (5,57)-(5,59)) (LI 10))],Bop (Just (5,62)-(5,72)) Mod (Var (Just (5,63)-(5,64)) "n") (Lit (Just (5,69)-(5,71)) (LI 10))])]
*)

(* typed spans
(5,2)-(5,72)
*)

(* correct types
int list
*)

(* bad types
int list
*)
