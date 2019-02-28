
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
          if o = 0
          then (if x < 10 then (0, (x :: l)) else (1, (l :: (x mod 10))))
          else
            if (x + 1) < 10
            then (0, ((x + 1) :: l))
            else (1, ((x + (1 mod 10)) :: l)) in
    let base = (0, []) in
    let args =
      let combine (a,b) = a + b in
      List.map combine (List.rev (List.combine l1 l2)) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


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
          if o = 0
          then (if x < 10 then (0, (l @ [x])) else (1, (l @ [x mod 10])))
          else
            if (x + 1) < 10
            then (0, ((x + 1) :: l))
            else (1, ((x + (1 mod 10)) :: l)) in
    let base = (0, []) in
    let args =
      let combine (a,b) = a + b in
      List.map combine (List.rev (List.combine l1 l2)) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(22,35)-(22,43)
l @ [x]
AppG (fromList [VarG,ListG EmptyG])

(22,54)-(22,71)
l @ [x mod 10]
AppG (fromList [VarG,ListG EmptyG])

*)

(* changed exprs
App (Just (22,35)-(22,44)) (Var (Just (22,38)-(22,39)) "@") [Var (Just (22,36)-(22,37)) "l",List (Just (22,40)-(22,43)) [Var (Just (22,41)-(22,42)) "x"] Nothing]
App (Just (22,55)-(22,71)) (Var (Just (22,58)-(22,59)) "@") [Var (Just (22,56)-(22,57)) "l",List (Just (22,60)-(22,70)) [Bop (Just (22,61)-(22,69)) Mod (Var (Just (22,61)-(22,62)) "x") (Lit (Just (22,67)-(22,69)) (LI 10))] Nothing]
*)

(* typed spans
(22,35)-(22,44)
(22,55)-(22,71)
*)

(* correct types
int list
int list
*)

(* bad types
int list
int list list
*)
