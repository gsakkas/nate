
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l = "[" ^ ((List.map ";" sepConcat) ^ "]");;


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
(2,18)-(7,58)
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

(9,31)-(9,39)
stringOfList
VarG

(9,31)-(9,39)
f
VarG

(9,31)-(9,39)
List.map f l
AppG (fromList [VarG])

(9,44)-(9,53)
f
VarG

(9,57)-(9,60)
l
VarG

*)

(* changed exprs
Lam (Just (2,17)-(7,64)) (VarPat (Just (2,17)-(2,18)) "f") (Lam (Just (2,19)-(7,64)) (VarPat (Just (2,19)-(2,20)) "l") (Case (Just (3,2)-(7,64)) (Var (Just (3,8)-(3,9)) "l") [(ConPat (Just (4,4)-(4,6)) "[]" Nothing,Nothing,Lit (Just (4,10)-(4,14)) (LS "[]")),(ConsPat (Just (5,4)-(5,9)) (VarPat (Just (5,4)-(5,5)) "x") (VarPat (Just (5,7)-(5,9)) "xs"),Nothing,Let (Just (6,6)-(7,64)) NonRec [(VarPat (Just (6,10)-(6,11)) "g",Lam (Just (6,12)-(6,36)) (VarPat (Just (6,12)-(6,13)) "a") (Lam (Just (6,14)-(6,36)) (VarPat (Just (6,14)-(6,15)) "x") (App (Just (6,18)-(6,36)) (Var (Just (6,20)-(6,21)) "^") [Var (Just (6,18)-(6,19)) "a",App (Just (6,22)-(6,36)) (Var (Just (6,28)-(6,29)) "^") [Lit (Just (6,23)-(6,27)) (LS "; "),App (Just (6,30)-(6,35)) (Var (Just (6,31)-(6,32)) "f") [Var (Just (6,33)-(6,34)) "x"]]]) Nothing) Nothing)] (Let (Just (7,6)-(7,64)) NonRec [(VarPat (Just (7,10)-(7,14)) "base",App (Just (7,17)-(7,28)) (Var (Just (7,21)-(7,22)) "^") [Lit (Just (7,17)-(7,20)) (LS "["),App (Just (7,23)-(7,28)) (Var (Just (7,24)-(7,25)) "f") [Var (Just (7,26)-(7,27)) "x"]])] (App (Just (7,32)-(7,64)) (Var (Just (7,59)-(7,60)) "^") [App (Just (7,32)-(7,58)) (Var (Just (7,33)-(7,47)) "List.fold_left") [Var (Just (7,48)-(7,49)) "g",Var (Just (7,50)-(7,54)) "base",Var (Just (7,55)-(7,57)) "xs"],Lit (Just (7,61)-(7,64)) (LS "]")])))]) Nothing) Nothing
Var (Just (9,31)-(9,43)) "stringOfList"
Var (Just (9,44)-(9,45)) "f"
App (Just (9,46)-(9,60)) (Var (Just (9,47)-(9,55)) "List.map") [Var (Just (9,56)-(9,57)) "f",Var (Just (9,58)-(9,59)) "l"]
Var (Just (9,56)-(9,57)) "f"
Var (Just (9,58)-(9,59)) "l"
*)

(* typed spans
(2,17)-(7,64)
(9,31)-(9,43)
(9,44)-(9,45)
(9,46)-(9,60)
(9,56)-(9,57)
(9,58)-(9,59)
*)

(* correct types
(string -> string) -> string list -> string
(string -> string) -> string list -> string
string -> string
string list
string -> string
string list
*)

(* bad types
string -> string list -> string
('a -> 'b) -> 'a list -> 'b list
('a -> 'b) -> 'a list -> 'b list
('a -> 'b) -> 'a list -> 'b list
string -> string list -> string
string
*)
