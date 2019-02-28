
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

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let bigMul l1 l2 =
  let f a x =
    let (s,t) = x in
    match a with
    | (r,v) ->
        let sum =
          int_of_string
            (sepConcat "" (mulByDigit (int_of_string (sepConcat "" l1)) s)) in
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
(37,57)-(37,58)
fun l ->
  int_of_string (sepConcat ""
                           (List.map string_of_int l))
LamG (AppG (fromList [EmptyG]))

(37,57)-(37,58)
fun i ->
  fun l ->
    if i > 0
    then bigAdd l
                (mulByDigit (i - 1) l)
    else []
LamG (LamG EmptyG)

(46,12)-(46,75)
intListToInt
VarG

(46,64)-(46,66)
intListToInt
VarG

(46,67)-(46,69)
[s]
ListG VarG

(51,13)-(51,42)
List.combine l2 l2
AppG (fromList [VarG])

(51,13)-(51,42)
List.combine
VarG

(51,13)-(51,42)
l2
VarG

(51,13)-(51,42)
l2
VarG

*)

(* changed exprs
Lam (Just (36,17)-(36,76)) (VarPat (Just (36,17)-(36,18)) "l") (App (Just (36,21)-(36,76)) (Var (Just (36,21)-(36,34)) "int_of_string") [App (Just (36,35)-(36,76)) (Var (Just (36,36)-(36,45)) "sepConcat") [Lit (Just (36,46)-(36,48)) (LS ""),App (Just (36,49)-(36,75)) (Var (Just (36,50)-(36,58)) "List.map") [Var (Just (36,59)-(36,72)) "string_of_int",Var (Just (36,73)-(36,74)) "l"]]]) Nothing
Lam (Just (38,19)-(39,55)) (VarPat (Just (38,19)-(38,20)) "i") (Lam (Just (38,21)-(39,55)) (VarPat (Just (38,21)-(38,22)) "l") (Ite (Just (39,2)-(39,55)) (Bop (Just (39,5)-(39,10)) Gt (Var (Just (39,5)-(39,6)) "i") (Lit (Just (39,9)-(39,10)) (LI 0))) (App (Just (39,16)-(39,47)) (Var (Just (39,16)-(39,22)) "bigAdd") [Var (Just (39,23)-(39,24)) "l",App (Just (39,25)-(39,47)) (Var (Just (39,26)-(39,36)) "mulByDigit") [Bop (Just (39,37)-(39,44)) Minus (Var (Just (39,38)-(39,39)) "i") (Lit (Just (39,42)-(39,43)) (LI 1)),Var (Just (39,45)-(39,46)) "l"]]) (List (Just (39,53)-(39,55)) [] Nothing)) Nothing) Nothing
Var (Just (46,18)-(46,30)) "intListToInt"
Var (Just (46,44)-(46,56)) "intListToInt"
List (Just (46,61)-(46,64)) [Var (Just (46,62)-(46,63)) "s"] Nothing
App (Just (51,13)-(51,31)) (Var (Just (51,13)-(51,25)) "List.combine") [Var (Just (51,26)-(51,28)) "l2",Var (Just (51,29)-(51,31)) "l2"]
Var (Just (51,13)-(51,25)) "List.combine"
Var (Just (51,26)-(51,28)) "l2"
Var (Just (51,29)-(51,31)) "l2"
*)

(* typed spans
(36,17)-(36,76)
(38,19)-(39,55)
(46,18)-(46,30)
(46,44)-(46,56)
(46,61)-(46,64)
(51,13)-(51,31)
(51,13)-(51,25)
(51,26)-(51,28)
(51,29)-(51,31)
*)

(* correct types
int list -> int
int -> int list -> int list
int list -> int
int list -> int
int list
(int * int) list
int list -> int list -> (int * int) list
int list
int list
*)

(* bad types
string list
string list
string
string
string list
(int list * int list) list
(int list * int list) list
(int list * int list) list
(int list * int list) list
*)
