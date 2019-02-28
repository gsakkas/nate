
let rec assoc (d,k,l) =
  match (d, k, l) with
  | [] -> 0
  | (d,k,l) ->
      if l = []
      then d
      else
        (match l with
         | h::t ->
             (match h with | (a,b) -> if a = k then b else assoc (d, k, t)));;


(* fix

let rec assoc (d,k,l) =
  match (d, k, l) with
  | (d,k,l) ->
      if l = []
      then d
      else
        (match l with
         | h::t ->
             (match h with | (a,b) -> if a = k then b else assoc (d, k, t)));;

*)

(* changed spans
(3,2)-(11,76)
match (d , k , l) with
| (d , k , l) -> if l = []
                 then d
                 else (match l with
                       | h :: t -> match h with
                                   | (a , b) -> if a = k
                                                then b
                                                else assoc (d , k , t))
CaseG (TupleG (fromList [EmptyG])) (fromList [(Nothing,IteG EmptyG EmptyG EmptyG)])

*)

(* changed exprs
Case (Just (3,2)-(10,76)) (Tuple (Just (3,8)-(3,17)) [Var (Just (3,9)-(3,10)) "d",Var (Just (3,12)-(3,13)) "k",Var (Just (3,15)-(3,16)) "l"]) [(TuplePat (Just (4,5)-(4,10)) [VarPat (Just (4,5)-(4,6)) "d",VarPat (Just (4,7)-(4,8)) "k",VarPat (Just (4,9)-(4,10)) "l"],Nothing,Ite (Just (5,6)-(10,76)) (Bop (Just (5,9)-(5,15)) Eq (Var (Just (5,9)-(5,10)) "l") (List (Just (5,13)-(5,15)) [] Nothing)) (Var (Just (6,11)-(6,12)) "d") (Case (Just (8,8)-(10,76)) (Var (Just (8,15)-(8,16)) "l") [(ConsPat (Just (9,11)-(9,15)) (VarPat (Just (9,11)-(9,12)) "h") (VarPat (Just (9,14)-(9,15)) "t"),Nothing,Case (Just (10,13)-(10,75)) (Var (Just (10,20)-(10,21)) "h") [(TuplePat (Just (10,30)-(10,33)) [VarPat (Just (10,30)-(10,31)) "a",VarPat (Just (10,32)-(10,33)) "b"],Nothing,Ite (Just (10,38)-(10,74)) (Bop (Just (10,41)-(10,46)) Eq (Var (Just (10,41)-(10,42)) "a") (Var (Just (10,45)-(10,46)) "k")) (Var (Just (10,52)-(10,53)) "b") (App (Just (10,59)-(10,74)) (Var (Just (10,59)-(10,64)) "assoc") [Tuple (Just (10,65)-(10,74)) [Var (Just (10,66)-(10,67)) "d",Var (Just (10,69)-(10,70)) "k",Var (Just (10,72)-(10,73)) "t"]]))])]))]
*)

(* typed spans
(3,2)-(10,76)
*)

(* correct types
'a
*)

(* bad types
int
*)
