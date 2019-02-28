
let rec listReverse l =
  match l with
  | _ -> []
  | x -> [x]
  | head::tail -> (listReverse tail) :: head;;


(* fix

let x = [1; 2; 3];;

let rec listReverse l =
  match l with
  | [] -> []
  | x::[] -> [x]
  | head::tail::t::s -> head :: tail :: t :: s;;

*)

(* changed spans
(2,20)-(6,44)
[1 ; 2 ; 3]
ListG LitG

(3,2)-(6,44)
match l with
| [] -> []
| x :: [] -> [x]
| head :: tail :: t :: s -> head :: (tail :: (t :: s))
CaseG VarG (fromList [(Nothing,ConAppG (Just EmptyG)),(Nothing,ListG EmptyG)])

*)

(* changed exprs
List (Just (2,8)-(2,17)) [Lit (Just (2,9)-(2,10)) (LI 1),Lit (Just (2,12)-(2,13)) (LI 2),Lit (Just (2,15)-(2,16)) (LI 3)] Nothing
Case (Just (5,2)-(8,46)) (Var (Just (5,8)-(5,9)) "l") [(ConPat (Just (6,4)-(6,6)) "[]" Nothing,Nothing,List (Just (6,10)-(6,12)) [] Nothing),(ConsPat (Just (7,4)-(7,9)) (VarPat (Just (7,4)-(7,5)) "x") (ConPat (Just (7,7)-(7,9)) "[]" Nothing),Nothing,List (Just (7,13)-(7,16)) [Var (Just (7,14)-(7,15)) "x"] Nothing),(ConsPat (Just (8,4)-(8,20)) (VarPat (Just (8,4)-(8,8)) "head") (ConsPat (Just (8,10)-(8,20)) (VarPat (Just (8,10)-(8,14)) "tail") (ConsPat (Just (8,16)-(8,20)) (VarPat (Just (8,16)-(8,17)) "t") (VarPat (Just (8,19)-(8,20)) "s"))),Nothing,ConApp (Just (8,24)-(8,46)) "::" (Just (Tuple (Just (8,24)-(8,46)) [Var (Just (8,24)-(8,28)) "head",ConApp (Just (8,32)-(8,46)) "::" (Just (Tuple (Just (8,32)-(8,46)) [Var (Just (8,32)-(8,36)) "tail",ConApp (Just (8,40)-(8,46)) "::" (Just (Tuple (Just (8,40)-(8,46)) [Var (Just (8,40)-(8,41)) "t",Var (Just (8,45)-(8,46)) "s"])) Nothing])) Nothing])) Nothing)]
*)

(* typed spans
(2,8)-(2,17)
(5,2)-(8,46)
*)

(* correct types
int list
'a list
*)

(* bad types
'a list list -> 'a list list list
'a list list list
*)
