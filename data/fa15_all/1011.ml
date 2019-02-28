
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let x = List.mem h seen in
        if x
        then helper (seen, t)
        else
          (let seen' = seen :: h in let rest' = t in helper (seen', rest')) in
  helper ([], l);;


(* fix

let rec append (x,y) =
  match y with | [] -> x | h::t -> let z = h :: x in append (z, t);;

let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let x = List.mem h seen in
        if x
        then helper (seen, t)
        else
          (let seen' = append (seen, [h]) in
           let rest' = t in helper (seen', rest')) in
  helper ([], l);;

*)

(* changed spans
(2,21)-(12,16)
fun (x , y) ->
  match y with
  | [] -> x
  | h :: t -> (let z = h :: x in
               append (z , t))
LamG (CaseG EmptyG (fromList [(Nothing,EmptyG)]))

(11,23)-(11,32)
append (seen , [h])
AppG (fromList [TupleG (fromList [EmptyG])])

*)

(* changed exprs
Lam (Just (2,16)-(3,66)) (TuplePat (Just (2,16)-(2,19)) [VarPat (Just (2,16)-(2,17)) "x",VarPat (Just (2,18)-(2,19)) "y"]) (Case (Just (3,2)-(3,66)) (Var (Just (3,8)-(3,9)) "y") [(ConPat (Just (3,17)-(3,19)) "[]" Nothing,Nothing,Var (Just (3,23)-(3,24)) "x"),(ConsPat (Just (3,27)-(3,31)) (VarPat (Just (3,27)-(3,28)) "h") (VarPat (Just (3,30)-(3,31)) "t"),Nothing,Let (Just (3,35)-(3,66)) NonRec [(VarPat (Just (3,39)-(3,40)) "z",ConApp (Just (3,43)-(3,49)) "::" (Just (Tuple (Just (3,43)-(3,49)) [Var (Just (3,43)-(3,44)) "h",Var (Just (3,48)-(3,49)) "x"])) Nothing)] (App (Just (3,53)-(3,66)) (Var (Just (3,53)-(3,59)) "append") [Tuple (Just (3,60)-(3,66)) [Var (Just (3,61)-(3,62)) "z",Var (Just (3,64)-(3,65)) "t"]]))]) Nothing
App (Just (14,23)-(14,41)) (Var (Just (14,23)-(14,29)) "append") [Tuple (Just (14,30)-(14,41)) [Var (Just (14,31)-(14,35)) "seen",List (Just (14,37)-(14,40)) [Var (Just (14,38)-(14,39)) "h"] Nothing]]
*)

(* typed spans
(2,16)-(3,66)
(14,23)-(14,41)
*)

(* correct types
('a list * 'a list) -> 'a list
'a list
*)

(* bad types
'a list -> 'a list
'a list list
*)
