
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l = sepConcat (sepConcat ";" (List.map f l)) [("[", "]")];;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l = sepConcat (sepConcat ";" (List.map f l)) ["["; "]"];;

*)

(* changed spans
(9,64)-(9,76)
["[" ; "]"]
ListG LitG

*)

(* changed exprs
List (Just (9,64)-(9,74)) [Lit (Just (9,65)-(9,68)) (LS "["),Lit (Just (9,70)-(9,73)) (LS "]")] Nothing
*)

(* typed spans
(9,64)-(9,74)
*)

(* correct types
string list
*)

(* bad types
(string * string) list
*)
