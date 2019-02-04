
let stringOfList f l =
  match l with
  | [] -> ""
  | h::t ->
      let m a b = "[" ^ (a ^ ((";" b) ^ "]")) in
      let base = f h in List.fold_left m base l;;


(* fix

let stringOfList f l =
  match l with
  | [] -> ""
  | h::t ->
      let m a b = "[" ^ (a ^ (";" ^ (b ^ "]"))) in
      let base = f h in List.fold_left m base l;;

*)

(* changed spans
(6,30)-(6,37)
EMPTY
EmptyG

(6,35)-(6,36)
b ^ "]"
AppG (fromList [VarG,LitG])

*)
