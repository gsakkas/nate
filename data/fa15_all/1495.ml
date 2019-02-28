
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = List.mem seen h in let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;


(* fix

let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if List.mem h seen then seen else seen @ [h] in
        let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;

*)

(* changed spans
(7,20)-(7,35)
if List.mem h seen
then seen
else seen @ [h]
IteG (AppG (fromList [EmptyG])) VarG (AppG (fromList [EmptyG]))

*)

(* changed exprs
Ite (Just (7,20)-(7,64)) (App (Just (7,23)-(7,38)) (Var (Just (7,23)-(7,31)) "List.mem") [Var (Just (7,32)-(7,33)) "h",Var (Just (7,34)-(7,38)) "seen"]) (Var (Just (7,44)-(7,48)) "seen") (App (Just (7,54)-(7,64)) (Var (Just (7,59)-(7,60)) "@") [Var (Just (7,54)-(7,58)) "seen",List (Just (7,61)-(7,64)) [Var (Just (7,62)-(7,63)) "h"] Nothing])
*)

(* typed spans
(7,20)-(7,64)
*)

(* correct types
'a list
*)

(* bad types
bool
*)
