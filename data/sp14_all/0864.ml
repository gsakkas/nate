
let rec sumList xs =
  match xs with | _ -> (List.hd xs) + (sumList List.tl) | [] -> [];;


(* fix

let rec sumList xs =
  match xs with | [] -> 0 | xs -> (List.hd xs) + (sumList (List.tl xs));;

*)

(* changed spans
(3,2)-(3,66)
match xs with
| [] -> 0
| xs -> List.hd xs + sumList (List.tl xs)
CaseG VarG (fromList [(Nothing,BopG EmptyG EmptyG),(Nothing,LitG)])

*)

(* changed exprs
Case (Just (3,2)-(3,71)) (Var (Just (3,8)-(3,10)) "xs") [(ConPat (Just (3,18)-(3,20)) "[]" Nothing,Nothing,Lit (Just (3,24)-(3,25)) (LI 0)),(VarPat (Just (3,28)-(3,30)) "xs",Nothing,Bop (Just (3,34)-(3,71)) Plus (App (Just (3,34)-(3,46)) (Var (Just (3,35)-(3,42)) "List.hd") [Var (Just (3,43)-(3,45)) "xs"]) (App (Just (3,49)-(3,71)) (Var (Just (3,50)-(3,57)) "sumList") [App (Just (3,58)-(3,70)) (Var (Just (3,59)-(3,66)) "List.tl") [Var (Just (3,67)-(3,69)) "xs"]]))]
*)

(* typed spans
(3,2)-(3,71)
*)

(* correct types
int
*)

(* bad types
int
*)
