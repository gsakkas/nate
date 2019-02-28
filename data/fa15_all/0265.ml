
let rec mulByDigit i l =
  match l with | [] -> [] | 0 -> [] | hd::tl -> (mulByDigit i tl) @ (hd * i);;


(* fix

let rec mulByDigit i l =
  match l with | [] -> [] | hd::tl -> (mulByDigit i tl) @ [hd * i];;

*)

(* changed spans
(3,2)-(3,76)
match l with
| [] -> []
| hd :: tl -> mulByDigit i
                         tl @ [hd * i]
CaseG VarG (fromList [(Nothing,AppG (fromList [EmptyG])),(Nothing,ListG EmptyG)])

*)

(* changed exprs
Case (Just (3,2)-(3,66)) (Var (Just (3,8)-(3,9)) "l") [(ConPat (Just (3,17)-(3,19)) "[]" Nothing,Nothing,List (Just (3,23)-(3,25)) [] Nothing),(ConsPat (Just (3,28)-(3,34)) (VarPat (Just (3,28)-(3,30)) "hd") (VarPat (Just (3,32)-(3,34)) "tl"),Nothing,App (Just (3,38)-(3,66)) (Var (Just (3,56)-(3,57)) "@") [App (Just (3,38)-(3,55)) (Var (Just (3,39)-(3,49)) "mulByDigit") [Var (Just (3,50)-(3,51)) "i",Var (Just (3,52)-(3,54)) "tl"],List (Just (3,58)-(3,66)) [Bop (Just (3,59)-(3,65)) Times (Var (Just (3,59)-(3,61)) "hd") (Var (Just (3,64)-(3,65)) "i")] Nothing])]
*)

(* typed spans
(3,2)-(3,66)
*)

(* correct types
int list
*)

(* bad types
'a list
*)
