
let remainder x y = if (x * y) > 10 then (x * y) mod 10 else 0;;

let rec mulByDigit i l =
  match i with
  | i -> []
  | h::t ->
      if (List.length t) = 0
      then [h * i] @ (mulByDigit i t)
      else (remainder i h) :: (mulByDigit i t);;


(* fix

let remainder x y = if (x * y) > 10 then (x * y) mod 10 else 0;;

let rec mulByDigit i l =
  match i with
  | i -> []
  | _ ->
      (match l with
       | [] -> []
       | h::t ->
           if (List.length t) = 0
           then [h * i] @ (mulByDigit i t)
           else (remainder i h) :: (mulByDigit i t));;

*)

(* changed spans
(5,2)-(10,46)
match i with
| i -> []
| _ -> match l with
       | [] -> []
       | h :: t -> if List.length t = 0
                   then [h * i] @ mulByDigit i t
                   else (remainder i
                                   h) :: (mulByDigit i t)
CaseG VarG (fromList [(Nothing,CaseG EmptyG (fromList [(Nothing,EmptyG)])),(Nothing,ListG EmptyG)])

*)

(* changed exprs
Case (Just (5,2)-(13,52)) (Var (Just (5,8)-(5,9)) "i") [(VarPat (Just (6,4)-(6,5)) "i",Nothing,List (Just (6,9)-(6,11)) [] Nothing),(WildPat (Just (7,4)-(7,5)),Nothing,Case (Just (8,6)-(13,52)) (Var (Just (8,13)-(8,14)) "l") [(ConPat (Just (9,9)-(9,11)) "[]" Nothing,Nothing,List (Just (9,15)-(9,17)) [] Nothing),(ConsPat (Just (10,9)-(10,13)) (VarPat (Just (10,9)-(10,10)) "h") (VarPat (Just (10,12)-(10,13)) "t"),Nothing,Ite (Just (11,11)-(13,51)) (Bop (Just (11,14)-(11,33)) Eq (App (Just (11,14)-(11,29)) (Var (Just (11,15)-(11,26)) "List.length") [Var (Just (11,27)-(11,28)) "t"]) (Lit (Just (11,32)-(11,33)) (LI 0))) (App (Just (12,16)-(12,42)) (Var (Just (12,24)-(12,25)) "@") [List (Just (12,16)-(12,23)) [Bop (Just (12,17)-(12,22)) Times (Var (Just (12,17)-(12,18)) "h") (Var (Just (12,21)-(12,22)) "i")] Nothing,App (Just (12,26)-(12,42)) (Var (Just (12,27)-(12,37)) "mulByDigit") [Var (Just (12,38)-(12,39)) "i",Var (Just (12,40)-(12,41)) "t"]]) (ConApp (Just (13,16)-(13,51)) "::" (Just (Tuple (Just (13,16)-(13,51)) [App (Just (13,16)-(13,31)) (Var (Just (13,17)-(13,26)) "remainder") [Var (Just (13,27)-(13,28)) "i",Var (Just (13,29)-(13,30)) "h"],App (Just (13,35)-(13,51)) (Var (Just (13,36)-(13,46)) "mulByDigit") [Var (Just (13,47)-(13,48)) "i",Var (Just (13,49)-(13,50)) "t"]])) Nothing))])]
*)

(* typed spans
(5,2)-(13,52)
*)

(* correct types
int list
*)

(* bad types
int list
*)
