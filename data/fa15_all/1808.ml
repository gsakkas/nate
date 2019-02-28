
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = seen in
        let rest' = List.rev t in
        if (List.mem h rest') = false
        then let seen' = h :: seen' in helper (seen', rest') in
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
(7,20)-(7,24)
h :: seen
ConAppG (Just (TupleG (fromList [VarG])))

(8,20)-(8,30)
t
VarG

(9,8)-(10,60)
helper (seen' , rest')
AppG (fromList [TupleG (fromList [EmptyG])])

(9,8)-(10,60)
helper
VarG

(9,8)-(10,60)
(seen' , rest')
TupleG (fromList [VarG])

(9,8)-(10,60)
seen'
VarG

(9,8)-(10,60)
rest'
VarG

*)

(* changed exprs
ConApp (Just (6,26)-(6,35)) "::" (Just (Tuple (Just (6,26)-(6,35)) [Var (Just (6,26)-(6,27)) "h",Var (Just (6,31)-(6,35)) "seen"])) Nothing
Var (Just (6,51)-(6,52)) "t"
App (Just (6,56)-(6,77)) (Var (Just (6,56)-(6,62)) "helper") [Tuple (Just (6,63)-(6,77)) [Var (Just (6,64)-(6,69)) "seen'",Var (Just (6,71)-(6,76)) "rest'"]]
Var (Just (6,56)-(6,62)) "helper"
Tuple (Just (6,63)-(6,77)) [Var (Just (6,64)-(6,69)) "seen'",Var (Just (6,71)-(6,76)) "rest'"]
Var (Just (6,64)-(6,69)) "seen'"
Var (Just (6,71)-(6,76)) "rest'"
*)

(* typed spans
(6,26)-(6,35)
(6,51)-(6,52)
(6,56)-(6,77)
(6,56)-(6,62)
(6,63)-(6,77)
(6,64)-(6,69)
(6,71)-(6,76)
*)

(* correct types
'a list
'a list
'a list
('a list * 'a list) -> 'a list
('a list * 'a list)
'a list
'a list
*)

(* bad types
'a list
'a list
unit
unit
unit
unit
unit
*)
