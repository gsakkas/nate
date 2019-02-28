
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
        let sum = mulByDigit (intListToInt l1) s in
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
(46,18)-(46,48)
intListToInt (mulByDigit (intListToInt l1)
                         [s])
AppG (fromList [AppG (fromList [EmptyG])])

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
App (Just (46,18)-(46,65)) (Var (Just (46,18)-(46,30)) "intListToInt") [App (Just (46,31)-(46,65)) (Var (Just (46,32)-(46,42)) "mulByDigit") [App (Just (46,43)-(46,60)) (Var (Just (46,44)-(46,56)) "intListToInt") [Var (Just (46,57)-(46,59)) "l1"],List (Just (46,61)-(46,64)) [Var (Just (46,62)-(46,63)) "s"] Nothing]]
App (Just (51,13)-(51,31)) (Var (Just (51,13)-(51,25)) "List.combine") [Var (Just (51,26)-(51,28)) "l2",Var (Just (51,29)-(51,31)) "l2"]
Var (Just (51,13)-(51,25)) "List.combine"
Var (Just (51,26)-(51,28)) "l2"
Var (Just (51,29)-(51,31)) "l2"
*)

(* typed spans
(46,18)-(46,65)
(51,13)-(51,31)
(51,13)-(51,25)
(51,26)-(51,28)
(51,29)-(51,31)
*)

(* correct types
int
(int * int) list
int list -> int list -> (int * int) list
int list
int list
*)

(* bad types
int list
(int list * int list) list
(int list * int list) list
(int list * int list) list
(int list * int list) list
*)
