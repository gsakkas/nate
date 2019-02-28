
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if List.mem (h, seen) then helper ((h :: seen), t) in
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
(7,23)-(7,41)
List.mem h seen
AppG (fromList [VarG])

(7,55)-(7,66)
seen
VarG

(7,55)-(7,66)
t
VarG

(7,55)-(7,66)
helper (h :: seen , t)
AppG (fromList [TupleG (fromList [EmptyG])])

*)

(* changed exprs
App (Just (8,13)-(8,28)) (Var (Just (8,13)-(8,21)) "List.mem") [Var (Just (8,22)-(8,23)) "h",Var (Just (8,24)-(8,28)) "seen"]
Var (Just (9,23)-(9,27)) "seen"
Var (Just (9,29)-(9,30)) "t"
App (Just (10,15)-(10,38)) (Var (Just (10,15)-(10,21)) "helper") [Tuple (Just (10,22)-(10,38)) [ConApp (Just (10,23)-(10,34)) "::" (Just (Tuple (Just (10,24)-(10,33)) [Var (Just (10,24)-(10,25)) "h",Var (Just (10,29)-(10,33)) "seen"])) Nothing,Var (Just (10,36)-(10,37)) "t"]]
*)

(* typed spans
(8,13)-(8,28)
(9,23)-(9,27)
(9,29)-(9,30)
(10,15)-(10,38)
*)

(* correct types
bool
'a list
'a list
'a list
*)

(* bad types
('a * 'a list) list -> bool
'a list
'a list
'a list
*)
