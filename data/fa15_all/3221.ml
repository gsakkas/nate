
let rec mulByDigit i l =
  match l with
  | [] -> []
  | x::x' -> [[(x * i) / 10]; ((x * i) mod 10) + (mulByDigit i x')];;


(* fix

let rec mulByDigit i l =
  match l with
  | [] -> []
  | x::x'::x'' ->
      [(x * i) / 10] @
        ([((x * i) mod 10) + x'] @ ((mulByDigit i [x']) @ x''));;

*)

(* changed spans
(3,2)-(5,67)
match l with
| [] -> []
| x :: x' :: x'' -> [(x * i) / 10] @ ([((x * i) mod 10) + x'] @ (mulByDigit i
                                                                            [x'] @ x''))
CaseG VarG (fromList [(Nothing,AppG (fromList [EmptyG])),(Nothing,ListG EmptyG)])

*)

(* changed exprs
Case (Just (3,2)-(7,63)) (Var (Just (3,8)-(3,9)) "l") [(ConPat (Just (4,4)-(4,6)) "[]" Nothing,Nothing,List (Just (4,10)-(4,12)) [] Nothing),(ConsPat (Just (5,4)-(5,14)) (VarPat (Just (5,4)-(5,5)) "x") (ConsPat (Just (5,7)-(5,14)) (VarPat (Just (5,7)-(5,9)) "x'") (VarPat (Just (5,11)-(5,14)) "x''")),Nothing,App (Just (6,6)-(7,63)) (Var (Just (6,21)-(6,22)) "@") [List (Just (6,6)-(6,20)) [Bop (Just (6,7)-(6,19)) Div (Bop (Just (6,7)-(6,14)) Times (Var (Just (6,8)-(6,9)) "x") (Var (Just (6,12)-(6,13)) "i")) (Lit (Just (6,17)-(6,19)) (LI 10))] Nothing,App (Just (7,8)-(7,63)) (Var (Just (7,33)-(7,34)) "@") [List (Just (7,9)-(7,32)) [Bop (Just (7,10)-(7,31)) Plus (Bop (Just (7,10)-(7,26)) Mod (Bop (Just (7,11)-(7,18)) Times (Var (Just (7,12)-(7,13)) "x") (Var (Just (7,16)-(7,17)) "i")) (Lit (Just (7,23)-(7,25)) (LI 10))) (Var (Just (7,29)-(7,31)) "x'")] Nothing,App (Just (7,35)-(7,62)) (Var (Just (7,56)-(7,57)) "@") [App (Just (7,36)-(7,55)) (Var (Just (7,37)-(7,47)) "mulByDigit") [Var (Just (7,48)-(7,49)) "i",List (Just (7,50)-(7,54)) [Var (Just (7,51)-(7,53)) "x'"] Nothing],Var (Just (7,58)-(7,61)) "x''"]]])]
*)

(* typed spans
(3,2)-(7,63)
*)

(* correct types
int list
*)

(* bad types
int list list
*)
