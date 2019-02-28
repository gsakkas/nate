
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if (!List.mem) h seen then h :: seen in
        let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;


(* fix

let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if List.mem h seen then h :: seen else h :: seen in
        let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;

*)

(* changed spans
(7,23)-(7,34)
List.mem
VarG

(7,20)-(7,56)
h :: seen
ConAppG (Just (TupleG (fromList [VarG])))

*)

(* changed exprs
Var (Just (7,23)-(7,31)) "List.mem"
ConApp (Just (7,59)-(7,68)) "::" (Just (Tuple (Just (7,59)-(7,68)) [Var (Just (7,59)-(7,60)) "h",Var (Just (7,64)-(7,68)) "seen"])) Nothing
*)

(* typed spans
(7,23)-(7,31)
(7,59)-(7,68)
*)

(* correct types
'a -> 'a list -> bool
'a list
*)

(* bad types
'a -> 'a list -> bool
unit
*)
