
let rec assoc (d,k,l) =
  match l with
  | [] -> d
  | ((s,i) as h)::t -> if s = k then i else assoc (d k t);;


(* fix

let rec assoc (d,k,l) =
  match l with
  | [] -> d
  | h::t -> if (fst h) = k then snd h else assoc (d, k, t);;

*)

(* changed spans
(3,2)-(5,57)
match l with
| [] -> d
| h :: t -> if fst h = k
            then snd h
            else assoc (d , k , t)
CaseG VarG (fromList [(Nothing,VarG),(Nothing,IteG EmptyG EmptyG EmptyG)])

*)

(* changed exprs
Case (Just (3,2)-(5,58)) (Var (Just (3,8)-(3,9)) "l") [(ConPat (Just (4,4)-(4,6)) "[]" Nothing,Nothing,Var (Just (4,10)-(4,11)) "d"),(ConsPat (Just (5,4)-(5,8)) (VarPat (Just (5,4)-(5,5)) "h") (VarPat (Just (5,7)-(5,8)) "t"),Nothing,Ite (Just (5,12)-(5,58)) (Bop (Just (5,15)-(5,26)) Eq (App (Just (5,15)-(5,22)) (Var (Just (5,16)-(5,19)) "fst") [Var (Just (5,20)-(5,21)) "h"]) (Var (Just (5,25)-(5,26)) "k")) (App (Just (5,32)-(5,37)) (Var (Just (5,32)-(5,35)) "snd") [Var (Just (5,36)-(5,37)) "h"]) (App (Just (5,43)-(5,58)) (Var (Just (5,43)-(5,48)) "assoc") [Tuple (Just (5,49)-(5,58)) [Var (Just (5,50)-(5,51)) "d",Var (Just (5,53)-(5,54)) "k",Var (Just (5,56)-(5,57)) "t"]]))]
*)

(* typed spans
(3,2)-(5,58)
*)

(* correct types
'a
*)

(* bad types
'a -> ('a * 'b) list -> 'c
*)
