
let sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l =
  sepConcat ";" (List.map (fun t  -> let g = f t in g :: "]") l);;


(* fix

let sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l = sepConcat ";" (List.map (fun t  -> f t) l);;

*)

(* changed spans
(10,37)-(10,60)
f t
AppG (fromList [VarG])

*)

(* changed exprs
App (Just (9,58)-(9,61)) (Var (Just (9,58)-(9,59)) "f") [Var (Just (9,60)-(9,61)) "t"]
*)

(* typed spans
(9,58)-(9,61)
*)

(* correct types
string
*)

(* bad types
'a list
*)
