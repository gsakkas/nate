
let rec clone x n = if n < 1 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2)
  else
    if (List.length l1) > (List.length l2)
    then (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2))
    else (l1, l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (i,j) = x in
      match a with
      | (c,d) ->
          if ((i + j) + c) > 9
          then (1, ((((i + j) + c) mod 10) :: d))
          else (0, ((((i + j) + c) mod 10) :: d)) in
    let base = (0, []) in
    let args = (List.rev (List.combine l1 l2)) @ [(0, 0)] in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  if i > 0 then bigAdd l (mulByDigit (i - 1) l) else [];;

let bigMul l1 l2 =
  let f a x =
    let (s,t) = x in
    match a with
    | (r,v) ->
        let sum = mulByDigit (int_of_string l1) s in
        if (sum + r) > 9
        then (((sum + r) / 10), (((sum + r) mod 10) :: v))
        else (0, (((sum + r) mod 10) :: v)) in
  let base = (0, []) in
  let args = List.rev (List.combine l2 l2) in
  let (_,res) = List.fold_left f base args in res;;


(* fix

let rec clone x n = if n < 1 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2)
  else
    if (List.length l1) > (List.length l2)
    then (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2))
    else (l1, l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (i,j) = x in
      match a with
      | (c,d) ->
          if ((i + j) + c) > 9
          then (1, ((((i + j) + c) mod 10) :: d))
          else (0, ((((i + j) + c) mod 10) :: d)) in
    let base = (0, []) in
    let args = (List.rev (List.combine l1 l2)) @ [(0, 0)] in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let intListToInt l = int_of_string (sepConcat "" (List.map string_of_int l));;

let rec mulByDigit i l =
  if i > 0 then bigAdd l (mulByDigit (i - 1) l) else [];;

let bigMul l1 l2 =
  let f a x =
    let (s,t) = x in
    match a with
    | (r,v) ->
        let sum = intListToInt (mulByDigit (intListToInt l1) [s]) in
        if (sum + r) > 9
        then (((sum + r) / 10), (((sum + r) mod 10) :: v))
        else (0, (((sum + r) mod 10) :: v)) in
  let base = (0, []) in
  let args = List.combine l2 l2 in
  let (_,res) = List.fold_left f base args in res;;

*)

(* changed spans
(29,19)-(30,55)
fun sep ->
  fun sl ->
    match sl with
    | [] -> ""
    | h :: t -> (let f =
                   fun a ->
                     fun x -> a ^ (sep ^ x) in
                 let base = h in
                 let l = t in
                 List.fold_left f base l)
LamG (LamG EmptyG)

(29,19)-(30,55)
fun l ->
  int_of_string (sepConcat ""
                           (List.map string_of_int l))
LamG (AppG (fromList [EmptyG]))

(37,18)-(37,49)
intListToInt (mulByDigit (intListToInt l1)
                         [s])
AppG (fromList [AppG (fromList [EmptyG])])

(37,30)-(37,43)
intListToInt
VarG

(37,48)-(37,49)
[s]
ListG VarG

(42,13)-(42,42)
List.combine l2 l2
AppG (fromList [VarG])

(42,13)-(42,42)
List.combine
VarG

(42,13)-(42,42)
l2
VarG

(42,13)-(42,42)
l2
VarG

*)

(* changed exprs
Lam (Just (29,18)-(34,58)) (VarPat (Just (29,18)-(29,21)) "sep") (Lam (Just (29,22)-(34,58)) (VarPat (Just (29,22)-(29,24)) "sl") (Case (Just (30,2)-(34,58)) (Var (Just (30,8)-(30,10)) "sl") [(ConPat (Just (31,4)-(31,6)) "[]" Nothing,Nothing,Lit (Just (31,10)-(31,12)) (LS "")),(ConsPat (Just (32,4)-(32,8)) (VarPat (Just (32,4)-(32,5)) "h") (VarPat (Just (32,7)-(32,8)) "t"),Nothing,Let (Just (33,6)-(34,58)) NonRec [(VarPat (Just (33,10)-(33,11)) "f",Lam (Just (33,12)-(33,31)) (VarPat (Just (33,12)-(33,13)) "a") (Lam (Just (33,14)-(33,31)) (VarPat (Just (33,14)-(33,15)) "x") (App (Just (33,18)-(33,31)) (Var (Just (33,20)-(33,21)) "^") [Var (Just (33,18)-(33,19)) "a",App (Just (33,22)-(33,31)) (Var (Just (33,27)-(33,28)) "^") [Var (Just (33,23)-(33,26)) "sep",Var (Just (33,29)-(33,30)) "x"]]) Nothing) Nothing)] (Let (Just (34,6)-(34,58)) NonRec [(VarPat (Just (34,10)-(34,14)) "base",Var (Just (34,17)-(34,18)) "h")] (Let (Just (34,22)-(34,58)) NonRec [(VarPat (Just (34,26)-(34,27)) "l",Var (Just (34,30)-(34,31)) "t")] (App (Just (34,35)-(34,58)) (Var (Just (34,35)-(34,49)) "List.fold_left") [Var (Just (34,50)-(34,51)) "f",Var (Just (34,52)-(34,56)) "base",Var (Just (34,57)-(34,58)) "l"]))))]) Nothing) Nothing
Lam (Just (36,17)-(36,76)) (VarPat (Just (36,17)-(36,18)) "l") (App (Just (36,21)-(36,76)) (Var (Just (36,21)-(36,34)) "int_of_string") [App (Just (36,35)-(36,76)) (Var (Just (36,36)-(36,45)) "sepConcat") [Lit (Just (36,46)-(36,48)) (LS ""),App (Just (36,49)-(36,75)) (Var (Just (36,50)-(36,58)) "List.map") [Var (Just (36,59)-(36,72)) "string_of_int",Var (Just (36,73)-(36,74)) "l"]]]) Nothing
App (Just (46,18)-(46,65)) (Var (Just (46,18)-(46,30)) "intListToInt") [App (Just (46,31)-(46,65)) (Var (Just (46,32)-(46,42)) "mulByDigit") [App (Just (46,43)-(46,60)) (Var (Just (46,44)-(46,56)) "intListToInt") [Var (Just (46,57)-(46,59)) "l1"],List (Just (46,61)-(46,64)) [Var (Just (46,62)-(46,63)) "s"] Nothing]]
Var (Just (46,44)-(46,56)) "intListToInt"
List (Just (46,61)-(46,64)) [Var (Just (46,62)-(46,63)) "s"] Nothing
App (Just (51,13)-(51,31)) (Var (Just (51,13)-(51,25)) "List.combine") [Var (Just (51,26)-(51,28)) "l2",Var (Just (51,29)-(51,31)) "l2"]
Var (Just (51,13)-(51,25)) "List.combine"
Var (Just (51,26)-(51,28)) "l2"
Var (Just (51,29)-(51,31)) "l2"
*)

(* typed spans
(29,18)-(34,58)
(36,17)-(36,76)
(46,18)-(46,65)
(46,44)-(46,56)
(46,61)-(46,64)
(51,13)-(51,31)
(51,13)-(51,25)
(51,26)-(51,28)
(51,29)-(51,31)
*)

(* correct types
string -> string list -> string
int list -> int
int
int list -> int
int list
(int * int) list
int list -> int list -> (int * int) list
int list
int list
*)

(* bad types
int -> int list -> int list
int -> int list -> int list
int list
string -> int
int list
(int list * int list) list
(int list * int list) list
(int list * int list) list
(int list * int list) list
*)
