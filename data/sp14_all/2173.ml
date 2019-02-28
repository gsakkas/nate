
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l =
  sepConcat "; " (List.append ("[" :: (List.map f l)) "]");;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l =
  sepConcat "; " (List.append ("[" :: (List.map f l)) ["]"]);;

*)

(* changed spans
(10,54)-(10,57)
["]"]
ListG LitG

*)

(* changed exprs
List (Just (10,54)-(10,59)) [Lit (Just (10,55)-(10,58)) (LS "]")] Nothing
*)

(* typed spans
(10,54)-(10,59)
*)

(* correct types
string list
*)

(* bad types
string
*)
