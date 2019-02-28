
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = x ^ a in
      let base = if (List.length t) <> 0 then "" else sep in
      let l = if (List.length t) <> 0 then t else h in
      List.fold_left f base l;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = x ^ a in
      let base = if (List.length t) <> 0 then "" else sep in
      let l = if (List.length t) <> 0 then t else [h] in
      List.fold_left f base l;;

*)

(* changed spans
(8,50)-(8,51)
[h]
ListG VarG

*)

(* changed exprs
List (Just (8,50)-(8,53)) [Var (Just (8,51)-(8,52)) "h"] Nothing
*)

(* typed spans
(8,50)-(8,53)
*)

(* correct types
string list
*)

(* bad types
string list
*)
