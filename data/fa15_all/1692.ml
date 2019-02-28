
let rec assoc (d,k,l) =
  match k with
  | (h1,h2)::t -> if k = h2 then h1 else (h1, h2) :: (assoc (d, k, t))
  | _ -> d;;


(* fix

let rec assoc (d,k,l) =
  let (h1,h2)::t = l in
  match k with | h2 -> h1 | _ -> if l = [] then d else assoc (d, k, t);;

*)

(* changed spans
(3,2)-(5,10)
let (h1 , h2) :: t = l in
match k with
| h2 -> h1
| _ -> if l = []
       then d
       else assoc (d , k , t)
LetG NonRec (fromList [VarG]) (CaseG EmptyG (fromList [(Nothing,EmptyG)]))

*)

(* changed exprs
Let (Just (3,2)-(4,70)) NonRec [(ConsPat (Just (3,7)-(3,16)) (TuplePat (Just (3,7)-(3,12)) [VarPat (Just (3,7)-(3,9)) "h1",VarPat (Just (3,10)-(3,12)) "h2"]) (VarPat (Just (3,15)-(3,16)) "t"),Var (Just (3,19)-(3,20)) "l")] (Case (Just (4,2)-(4,70)) (Var (Just (4,8)-(4,9)) "k") [(VarPat (Just (4,17)-(4,19)) "h2",Nothing,Var (Just (4,23)-(4,25)) "h1"),(WildPat (Just (4,28)-(4,29)),Nothing,Ite (Just (4,33)-(4,70)) (Bop (Just (4,36)-(4,42)) Eq (Var (Just (4,36)-(4,37)) "l") (List (Just (4,40)-(4,42)) [] Nothing)) (Var (Just (4,48)-(4,49)) "d") (App (Just (4,55)-(4,70)) (Var (Just (4,55)-(4,60)) "assoc") [Tuple (Just (4,61)-(4,70)) [Var (Just (4,62)-(4,63)) "d",Var (Just (4,65)-(4,66)) "k",Var (Just (4,68)-(4,69)) "t"]]))])
*)

(* typed spans
(3,2)-(4,70)
*)

(* correct types
'a
*)

(* bad types
('a * 'b) list
*)
