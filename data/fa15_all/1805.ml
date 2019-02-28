
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = [] in
        let rest' = List.rev t in
        if List.mem h rest'
        then rest' = t
        else rest' = (t helper (seen', rest')) in
  List.rev (helper ([], l));;


(* fix

let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t -> let seen' = h :: seen in let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;

*)

(* changed spans
(8,8)-(11,46)
h :: seen
ConAppG (Just (TupleG (fromList [VarG])))

(11,22)-(11,23)
let rest' = t in
helper (seen' , rest')
LetG NonRec (fromList [VarG]) (AppG (fromList [EmptyG]))

(11,24)-(11,30)
helper (seen' , rest')
AppG (fromList [TupleG (fromList [EmptyG])])

*)

(* changed exprs
ConApp (Just (6,26)-(6,35)) "::" (Just (Tuple (Just (6,26)-(6,35)) [Var (Just (6,26)-(6,27)) "h",Var (Just (6,31)-(6,35)) "seen"])) Nothing
Let (Just (6,39)-(6,77)) NonRec [(VarPat (Just (6,43)-(6,48)) "rest'",Var (Just (6,51)-(6,52)) "t")] (App (Just (6,56)-(6,77)) (Var (Just (6,56)-(6,62)) "helper") [Tuple (Just (6,63)-(6,77)) [Var (Just (6,64)-(6,69)) "seen'",Var (Just (6,71)-(6,76)) "rest'"]])
App (Just (6,56)-(6,77)) (Var (Just (6,56)-(6,62)) "helper") [Tuple (Just (6,63)-(6,77)) [Var (Just (6,64)-(6,69)) "seen'",Var (Just (6,71)-(6,76)) "rest'"]]
*)

(* typed spans
(6,26)-(6,35)
(6,39)-(6,77)
(6,56)-(6,77)
*)

(* correct types
'a list
'a list
'a list
*)

(* bad types
bool
'a list
(bool * 'a list) -> bool
*)
