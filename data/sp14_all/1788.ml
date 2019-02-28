
let pipe fs =
  let f a x g = a (x g) in
  let base = match fs with | h::t -> f h | [] -> (fun x  -> x) in
  List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x g = a (x g) in
  let base = match fs with | [] -> (fun x  -> x) | h::t -> f (fun x  -> x) h in
  List.fold_left f base fs;;

*)

(* changed spans
(4,13)-(4,62)
match fs with
| [] -> fun x -> x
| h :: t -> f (fun x -> x) h
CaseG VarG (fromList [(Nothing,LamG EmptyG),(Nothing,AppG (fromList [EmptyG]))])

*)

(* changed exprs
Case (Just (4,13)-(4,76)) (Var (Just (4,19)-(4,21)) "fs") [(ConPat (Just (4,29)-(4,31)) "[]" Nothing,Nothing,Lam (Just (4,35)-(4,48)) (VarPat (Just (4,40)-(4,41)) "x") (Var (Just (4,46)-(4,47)) "x") Nothing),(ConsPat (Just (4,51)-(4,55)) (VarPat (Just (4,51)-(4,52)) "h") (VarPat (Just (4,54)-(4,55)) "t"),Nothing,App (Just (4,59)-(4,76)) (Var (Just (4,59)-(4,60)) "f") [Lam (Just (4,61)-(4,74)) (VarPat (Just (4,66)-(4,67)) "x") (Var (Just (4,72)-(4,73)) "x") Nothing,Var (Just (4,75)-(4,76)) "h"])]
*)

(* typed spans
(4,13)-(4,76)
*)

(* correct types
'a -> 'a
*)

(* bad types
('a -> 'a) -> 'a -> 'a
*)
