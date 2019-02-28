
let rec digOfIntHelper h = match h > 0 with | true  -> 1 | false  -> 0;;

let rec digitsOfInt n =
  match n with
  | 0 -> []
  | 0::[] -> []
  | 1 -> []
  | true  -> [digOfIntHelper n; []; n mod 10]
  | false  -> [];;


(* fix

let rec digitsOfInt n =
  match n > 0 with
  | false  -> []
  | true  ->
      (match n > 9 with
       | false  -> n :: (digitsOfInt n)
       | true  -> digitsOfInt (n mod 10));;

*)

(* changed spans
(5,2)-(10,16)
match n > 0 with
| false -> []
| true -> match n > 9 with
          | false -> n :: (digitsOfInt n)
          | true -> digitsOfInt (n mod 10)
CaseG (BopG EmptyG EmptyG) (fromList [(Nothing,CaseG EmptyG (fromList [(Nothing,EmptyG)])),(Nothing,ListG EmptyG)])

*)

(* changed exprs
Case (Just (3,2)-(8,41)) (Bop (Just (3,8)-(3,13)) Gt (Var (Just (3,8)-(3,9)) "n") (Lit (Just (3,12)-(3,13)) (LI 0))) [(LitPat (Just (4,4)-(4,9)) (LB False),Nothing,List (Just (4,14)-(4,16)) [] Nothing),(LitPat (Just (5,4)-(5,8)) (LB True),Nothing,Case (Just (6,6)-(8,41)) (Bop (Just (6,13)-(6,18)) Gt (Var (Just (6,13)-(6,14)) "n") (Lit (Just (6,17)-(6,18)) (LI 9))) [(LitPat (Just (7,9)-(7,14)) (LB False),Nothing,ConApp (Just (7,19)-(7,39)) "::" (Just (Tuple (Just (7,19)-(7,39)) [Var (Just (7,19)-(7,20)) "n",App (Just (7,24)-(7,39)) (Var (Just (7,25)-(7,36)) "digitsOfInt") [Var (Just (7,37)-(7,38)) "n"]])) Nothing),(LitPat (Just (8,9)-(8,13)) (LB True),Nothing,App (Just (8,18)-(8,40)) (Var (Just (8,18)-(8,29)) "digitsOfInt") [Bop (Just (8,30)-(8,40)) Mod (Var (Just (8,31)-(8,32)) "n") (Lit (Just (8,37)-(8,39)) (LI 10))])])]
*)

(* typed spans
(3,2)-(8,41)
*)

(* correct types
int list
*)

(* bad types
int list
*)
