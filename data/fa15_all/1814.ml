
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let r = List.rev t in
        let seen' = h :: seen in
        if (List.mem h r) = false
        then let seen' = h :: seen in let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;


(* fix

let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let r = List.rev t in
        let seen' = h :: seen in let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;

*)

(* changed spans
(9,8)-(10,76)
let rest' = t in
helper (seen' , rest')
LetG NonRec (fromList [VarG]) (AppG (fromList [EmptyG]))

*)

(* changed exprs
Let (Just (8,33)-(8,71)) NonRec [(VarPat (Just (8,37)-(8,42)) "rest'",Var (Just (8,45)-(8,46)) "t")] (App (Just (8,50)-(8,71)) (Var (Just (8,50)-(8,56)) "helper") [Tuple (Just (8,57)-(8,71)) [Var (Just (8,58)-(8,63)) "seen'",Var (Just (8,65)-(8,70)) "rest'"]])
*)

(* typed spans
(8,33)-(8,71)
*)

(* correct types
'a list
*)

(* bad types
unit
*)
