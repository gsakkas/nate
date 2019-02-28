
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if List.mem h seen then helper ((h :: seen), t) in
        let rest' = helper (seen', t) in helper (seen', rest') in
  List.rev (helper ([], l));;


(* fix

let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' =
          if List.mem h seen
          then helper (seen, t)
          else helper ((h :: seen), t) in
        let rest' = helper (seen', t) in helper (seen', rest') in
  List.rev (helper ([], l));;

*)

(* changed spans
(7,52)-(7,63)
seen
VarG

(7,52)-(7,63)
t
VarG

(7,52)-(7,63)
helper (h :: seen , t)
AppG (fromList [TupleG (fromList [EmptyG])])

*)

(* changed exprs
Var (Just (9,23)-(9,27)) "seen"
Var (Just (9,29)-(9,30)) "t"
App (Just (10,15)-(10,38)) (Var (Just (10,15)-(10,21)) "helper") [Tuple (Just (10,22)-(10,38)) [ConApp (Just (10,23)-(10,34)) "::" (Just (Tuple (Just (10,24)-(10,33)) [Var (Just (10,24)-(10,25)) "h",Var (Just (10,29)-(10,33)) "seen"])) Nothing,Var (Just (10,36)-(10,37)) "t"]]
*)

(* typed spans
(9,23)-(9,27)
(9,29)-(9,30)
(10,15)-(10,38)
*)

(* correct types
'a list
'a list
'a list
*)

(* bad types
'a list
'a list
'a list
*)
