
let rec assoc (d,k,l) =
  match l with | [] -> (-1) | h::l' -> let (x,y) = h in print_int h;;


(* fix

let rec assoc (d,k,l) =
  match l with
  | [] -> (-1)
  | h::l' -> let (x,y) = h in (match x with | k -> y | _ -> assoc (d, k, l'));;

*)

(* changed spans
(3,56)-(3,67)
match x with
| k -> y
| _ -> assoc (d , k , l')
CaseG VarG (fromList [(Nothing,VarG),(Nothing,AppG (fromList [EmptyG]))])

*)

(* changed exprs
Case (Just (5,30)-(5,77)) (Var (Just (5,37)-(5,38)) "x") [(VarPat (Just (5,46)-(5,47)) "k",Nothing,Var (Just (5,51)-(5,52)) "y"),(WildPat (Just (5,55)-(5,56)),Nothing,App (Just (5,60)-(5,76)) (Var (Just (5,60)-(5,65)) "assoc") [Tuple (Just (5,66)-(5,76)) [Var (Just (5,67)-(5,68)) "d",Var (Just (5,70)-(5,71)) "k",Var (Just (5,73)-(5,75)) "l'"]])]
*)

(* typed spans
(5,30)-(5,77)
*)

(* correct types
int
*)

(* bad types
int
*)
