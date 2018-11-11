
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l = "[" ^ ((List.map sepConcat ";") ^ "]");;


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
(6,6)-(7,58)
fun f ->
  fun l ->
    match l with
    | [] -> "[]"
    | x :: xs -> (let g =
                    fun a ->
                      fun x -> a ^ ("; " ^ f x) in
                  let base = "[" ^ f x in
                  List.fold_left g base
                                 xs ^ "]")
LamG (LamG EmptyG)

(6,12)-(6,31)
l
VarG

(6,12)-(6,31)
fun l ->
  match l with
  | [] -> "[]"
  | x :: xs -> (let g =
                  fun a ->
                    fun x -> a ^ ("; " ^ f x) in
                let base = "[" ^ f x in
                List.fold_left g base
                               xs ^ "]")
LamG (CaseG EmptyG [(Nothing,EmptyG),(Nothing,EmptyG)])

(6,12)-(6,31)
"[]"
LitG

(6,12)-(6,31)
let g =
  fun a ->
    fun x -> a ^ ("; " ^ f x) in
let base = "[" ^ f x in
List.fold_left g base xs ^ "]"
LetG NonRec [LamG EmptyG] (LetG NonRec [EmptyG] EmptyG)

(6,12)-(6,31)
match l with
| [] -> "[]"
| x :: xs -> (let g =
                fun a ->
                  fun x -> a ^ ("; " ^ f x) in
              let base = "[" ^ f x in
              List.fold_left g base
                             xs ^ "]")
CaseG VarG [(Nothing,LitG),(Nothing,LetG NonRec [EmptyG] EmptyG)]

(6,23)-(6,26)
"; "
LitG

(6,29)-(6,30)
f
VarG

(6,29)-(6,30)
f x
AppG [VarG]

(7,30)-(7,31)
"[" ^ f x
AppG [LitG,AppG [EmptyG]]

(7,35)-(7,58)
(^)
VarG

(7,35)-(7,58)
f
VarG

(7,35)-(7,58)
x
VarG

(7,35)-(7,58)
(^)
VarG

(7,35)-(7,58)
f x
AppG [VarG]

(7,35)-(7,58)
List.fold_left g base xs ^ "]"
AppG [AppG [EmptyG,EmptyG,EmptyG],LitG]

(7,35)-(7,58)
"["
LitG

(7,50)-(7,51)
g
VarG

(7,57)-(7,58)
xs
VarG

(9,17)-(9,61)
"]"
LitG

(9,31)-(9,39)
stringOfList
VarG

(9,31)-(9,39)
f
VarG

(9,31)-(9,39)
List.map f l
AppG [VarG,VarG]

(9,50)-(9,53)
f
VarG

(9,57)-(9,60)
l
VarG

*)