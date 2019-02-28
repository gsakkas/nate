
let pipe fs =
  let f a x g = a (x g) in
  let base = match fs with | (b,c)::t -> f b c | [] -> (fun x  -> x) in
  List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x g = a (x g) in
  let base = match fs with | h::t -> f h h | [] -> (fun x  -> x) in
  List.fold_left f base fs;;

*)

(* changed spans
(4,13)-(4,68)
match fs with
| h :: t -> f h h
| [] -> fun x -> x
CaseG VarG (fromList [(Nothing,LamG EmptyG),(Nothing,AppG (fromList [EmptyG]))])

*)

(* changed exprs
Case (Just (4,13)-(4,64)) (Var (Just (4,19)-(4,21)) "fs") [(ConsPat (Just (4,29)-(4,33)) (VarPat (Just (4,29)-(4,30)) "h") (VarPat (Just (4,32)-(4,33)) "t"),Nothing,App (Just (4,37)-(4,42)) (Var (Just (4,37)-(4,38)) "f") [Var (Just (4,39)-(4,40)) "h",Var (Just (4,41)-(4,42)) "h"]),(ConPat (Just (4,45)-(4,47)) "[]" Nothing,Nothing,Lam (Just (4,51)-(4,64)) (VarPat (Just (4,56)-(4,57)) "x") (Var (Just (4,62)-(4,63)) "x") Nothing)]
*)

(* typed spans
(4,13)-(4,64)
*)

(* correct types
'a -> 'a
*)

(* bad types
'a -> 'a
*)
