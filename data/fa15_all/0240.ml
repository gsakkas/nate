
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = List.mem h t in let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;


(* fix

let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if List.mem h seen then seen else h :: seen in
        let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;

*)

(* changed spans
(7,20)-(7,32)
if List.mem h seen
then seen
else h :: seen
IteG (AppG (fromList [EmptyG])) VarG (ConAppG (Just EmptyG))

*)

(* changed exprs
Ite (Just (7,20)-(7,63)) (App (Just (7,23)-(7,38)) (Var (Just (7,23)-(7,31)) "List.mem") [Var (Just (7,32)-(7,33)) "h",Var (Just (7,34)-(7,38)) "seen"]) (Var (Just (7,44)-(7,48)) "seen") (ConApp (Just (7,54)-(7,63)) "::" (Just (Tuple (Just (7,54)-(7,63)) [Var (Just (7,54)-(7,55)) "h",Var (Just (7,59)-(7,63)) "seen"])) Nothing)
*)

(* typed spans
(7,20)-(7,63)
*)

(* correct types
'a list
*)

(* bad types
bool
*)
