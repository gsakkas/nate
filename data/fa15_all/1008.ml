
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let x = List.mem h seen in
        if x
        then helper (seen, t)
        else (let seen' = seen @ h in let rest' = t in helper (seen', rest')) in
  List.rev (helper ([], l));;


(* fix

let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let x = List.mem h seen in
        if x
        then helper (seen, t)
        else
          (let seen' = seen @ [h] in let rest' = t in helper (seen', rest')) in
  List.rev (helper ([], l));;

*)

(* changed spans
(10,33)-(10,34)
[h]
ListG VarG

*)

(* changed exprs
List (Just (11,30)-(11,33)) [Var (Just (11,31)-(11,32)) "h"] Nothing
*)

(* typed spans
(11,30)-(11,33)
*)

(* correct types
'a list
*)

(* bad types
'a
*)
