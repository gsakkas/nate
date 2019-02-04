
let stringOfList f l =
  let g a x = a ^ ("; " ^ (f x)) in "[" ^ ((List.map g l) "]");;


(* fix

let stringOfList f l =
  match l with
  | [] -> "[]"
  | x::xs ->
      let g a x = a ^ ("; " ^ (f x)) in
      let base = "[" ^ (f x) in (List.fold_left g base xs) ^ "]";;

let stringOfList f l = "[" ^ ((stringOfList f (List.map f l)) ^ "]");;

*)

(* changed spans
(3,2)-(3,62)
match l with
| [] -> "[]"
| x :: xs -> (let g =
                fun a ->
                  fun x -> a ^ ("; " ^ f x) in
              let base = "[" ^ f x in
              List.fold_left g base
                             xs ^ "]")
CaseG VarG (fromList [(Nothing,LitG),(Nothing,LetG NonRec (fromList [EmptyG]) EmptyG)])

(3,36)-(3,62)
let base = "[" ^ f x in
List.fold_left g base xs ^ "]"
LetG NonRec (fromList [AppG (fromList [EmptyG])]) (AppG (fromList [EmptyG]))

(3,43)-(3,57)
x
VarG

(3,44)-(3,52)
(^)
VarG

(3,53)-(3,54)
List.fold_left g base xs
AppG (fromList [VarG])

(3,55)-(3,56)
fun f ->
  fun l ->
    "[" ^ (stringOfList f
                        (List.map f l) ^ "]")
LamG (LamG EmptyG)

*)
