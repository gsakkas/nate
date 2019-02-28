
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let rec padZero l1 l2 =
  let diffsize = (List.length l1) - (List.length l2) in
  if diffsize > 0
  then (l1, (List.append (clone 0 diffsize) l2))
  else ((List.append (clone 0 ((-1) * diffsize)) l1), l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match x with
      | (x1,x2) ->
          (match a with
           | (_,h2::t2) ->
               let sum = (x1 + x2) + h2 in
               ((sum / 10), ((sum / 10) :: (sum mod 10) :: t2))
           | (_,_) -> (0, [0])) in
    let base = (0, [0]) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l = bigAdd bigAdd (l l) (mulByDigit (i - 1) l);;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let rec padZero l1 l2 =
  let diffsize = (List.length l1) - (List.length l2) in
  if diffsize > 0
  then (l1, (List.append (clone 0 diffsize) l2))
  else ((List.append (clone 0 ((-1) * diffsize)) l1), l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match x with
      | (x1,x2) ->
          (match a with
           | (_,h2::t2) ->
               let sum = (x1 + x2) + h2 in
               ((sum / 10), ((sum / 10) :: (sum mod 10) :: t2))
           | (_,_) -> (0, [0])) in
    let base = (0, [0]) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  match i with | 0 -> [] | _ -> bigAdd (bigAdd l l) (mulByDigit (i - 1) l);;

*)

(* changed spans
(28,25)-(28,67)
match i with
| 0 -> []
| _ -> bigAdd (bigAdd l l)
              (mulByDigit (i - 1) l)
CaseG VarG (fromList [(Nothing,AppG (fromList [EmptyG])),(Nothing,ListG EmptyG)])

*)

(* changed exprs
Case (Just (29,2)-(29,74)) (Var (Just (29,8)-(29,9)) "i") [(LitPat (Just (29,17)-(29,18)) (LI 0),Nothing,List (Just (29,22)-(29,24)) [] Nothing),(WildPat (Just (29,27)-(29,28)),Nothing,App (Just (29,32)-(29,74)) (Var (Just (29,32)-(29,38)) "bigAdd") [App (Just (29,39)-(29,51)) (Var (Just (29,40)-(29,46)) "bigAdd") [Var (Just (29,47)-(29,48)) "l",Var (Just (29,49)-(29,50)) "l"],App (Just (29,52)-(29,74)) (Var (Just (29,53)-(29,63)) "mulByDigit") [Bop (Just (29,64)-(29,71)) Minus (Var (Just (29,65)-(29,66)) "i") (Lit (Just (29,69)-(29,70)) (LI 1)),Var (Just (29,72)-(29,73)) "l"]])]
*)

(* typed spans
(29,2)-(29,74)
*)

(* correct types
int list
*)

(* bad types
'a
*)
