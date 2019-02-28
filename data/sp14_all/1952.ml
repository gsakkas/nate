
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        if List.mem h seen
        then let seen' = h :: seen in let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;


(* fix

let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t -> let seen' = h :: seen in let rest' = t in helper (seen', rest') in
  helper ([], l);;

*)

(* changed spans
(7,8)-(8,76)
let seen' = h :: seen in
let rest' = t in
helper (seen' , rest')
LetG NonRec (fromList [ConAppG (Just EmptyG)]) (LetG NonRec (fromList [EmptyG]) EmptyG)

(9,11)-(9,27)
helper
VarG

(9,11)-(9,27)
([] , l)
TupleG (fromList [VarG,ListG EmptyG])

(9,11)-(9,27)
[]
ListG EmptyG

(9,11)-(9,27)
l
VarG

*)

(* changed exprs
Let (Just (6,14)-(6,77)) NonRec [(VarPat (Just (6,18)-(6,23)) "seen'",ConApp (Just (6,26)-(6,35)) "::" (Just (Tuple (Just (6,26)-(6,35)) [Var (Just (6,26)-(6,27)) "h",Var (Just (6,31)-(6,35)) "seen"])) Nothing)] (Let (Just (6,39)-(6,77)) NonRec [(VarPat (Just (6,43)-(6,48)) "rest'",Var (Just (6,51)-(6,52)) "t")] (App (Just (6,56)-(6,77)) (Var (Just (6,56)-(6,62)) "helper") [Tuple (Just (6,63)-(6,77)) [Var (Just (6,64)-(6,69)) "seen'",Var (Just (6,71)-(6,76)) "rest'"]]))
Var (Just (7,2)-(7,8)) "helper"
Tuple (Just (7,9)-(7,16)) [List (Just (7,10)-(7,12)) [] Nothing,Var (Just (7,14)-(7,15)) "l"]
List (Just (7,10)-(7,12)) [] Nothing
Var (Just (7,14)-(7,15)) "l"
*)

(* typed spans
(6,14)-(6,77)
(7,2)-(7,8)
(7,9)-(7,16)
(7,10)-(7,12)
(7,14)-(7,15)
*)

(* correct types
'a list
('a list * 'a list) -> 'a list
('a list * 'a list)
'a list
'a list
*)

(* bad types
unit
unit
unit
unit
unit
*)
