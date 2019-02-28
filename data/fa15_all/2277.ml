
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let difference = (List.length l1) - (List.length l2) in
  if difference > 0
  then (l1, ((clone 0 difference) @ l2))
  else
    if difference < 0
    then (((clone 0 ((-1) * difference)) @ l1), l2)
    else (l1, l2);;

let rec removeZero l =
  match l with | [] -> l | h::t -> if h = 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match a with
      | (o,l) ->
          let sum = x + o in
          if sum < 10 then (0, (sum :: l)) else (1, ((sum - 10) :: l)) in
    let base = (0, []) in
    let args =
      let combine (a,b) = a + b in
      (List.map combine (List.rev (List.combine l1 l2))) @ [0] in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  if i = 0 then [0] else if i = 1 then l else mulByDigit (i - (1 bigAdd l l));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let difference = (List.length l1) - (List.length l2) in
  if difference > 0
  then (l1, ((clone 0 difference) @ l2))
  else
    if difference < 0
    then (((clone 0 ((-1) * difference)) @ l1), l2)
    else (l1, l2);;

let rec removeZero l =
  match l with | [] -> l | h::t -> if h = 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match a with
      | (o,l) ->
          let sum = x + o in
          if sum < 10 then (0, (sum :: l)) else (1, ((sum - 10) :: l)) in
    let base = (0, []) in
    let args =
      let combine (a,b) = a + b in
      (List.map combine (List.rev (List.combine l1 l2))) @ [0] in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  if i = 0
  then [0]
  else if i = 1 then l else (let l' = bigAdd l l in mulByDigit (i - 1) l');;

*)

(* changed spans
(31,46)-(31,77)
let l' = bigAdd l l in
mulByDigit (i - 1) l'
LetG NonRec (fromList [AppG (fromList [EmptyG])]) (AppG (fromList [EmptyG]))

*)

(* changed exprs
Let (Just (33,28)-(33,74)) NonRec [(VarPat (Just (33,33)-(33,35)) "l'",App (Just (33,38)-(33,48)) (Var (Just (33,38)-(33,44)) "bigAdd") [Var (Just (33,45)-(33,46)) "l",Var (Just (33,47)-(33,48)) "l"])] (App (Just (33,52)-(33,73)) (Var (Just (33,52)-(33,62)) "mulByDigit") [Bop (Just (33,63)-(33,70)) Minus (Var (Just (33,64)-(33,65)) "i") (Lit (Just (33,68)-(33,69)) (LI 1)),Var (Just (33,71)-(33,73)) "l'"])
*)

(* typed spans
(33,28)-(33,74)
*)

(* correct types
int list
*)

(* bad types
int list
*)
