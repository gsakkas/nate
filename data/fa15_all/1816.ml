
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let r = List.rev t in
        if List.mem h r
        then
          let seen' = h :: seen in
          let seen' = seen in let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;


(* fix

let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let r = List.rev t in
        let seen' = seen in let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;

*)

(* changed spans
(8,8)-(11,68)
let seen' = seen in
let rest' = t in
helper (seen' , rest')
LetG NonRec (fromList [VarG]) (LetG NonRec (fromList [EmptyG]) EmptyG)

*)

(* changed exprs
Let (Just (8,8)-(8,66)) NonRec [(VarPat (Just (8,12)-(8,17)) "seen'",Var (Just (8,20)-(8,24)) "seen")] (Let (Just (8,28)-(8,66)) NonRec [(VarPat (Just (8,32)-(8,37)) "rest'",Var (Just (8,40)-(8,41)) "t")] (App (Just (8,45)-(8,66)) (Var (Just (8,45)-(8,51)) "helper") [Tuple (Just (8,52)-(8,66)) [Var (Just (8,53)-(8,58)) "seen'",Var (Just (8,60)-(8,65)) "rest'"]]))
*)

(* typed spans
(8,8)-(8,66)
*)

(* correct types
'a list
*)

(* bad types
unit
*)
