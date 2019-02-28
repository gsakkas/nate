
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let sizDif = (List.length l1) - (List.length l2) in
  if sizDif > 0
  then let pad = clone 0 sizDif in (l1, (pad @ l2))
  else (let pad = clone 0 (- sizDif) in ((pad @ l1), l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h == 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (x1,x2) = x in
      let (a1,a2) = a in
      if ((x1 + x2) + a1) >= 10
      then (1, ((((x1 + x2) + a1) - 10) :: a2))
      else (0, (((x1 + x2) + a1) :: a2)) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (carry,res) = List.fold_left f base args in carry :: res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l = if i > 0 then mulByDigit (i - 1) bigAdd l l else l;;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let sizDif = (List.length l1) - (List.length l2) in
  if sizDif > 0
  then let pad = clone 0 sizDif in (l1, (pad @ l2))
  else (let pad = clone 0 (- sizDif) in ((pad @ l1), l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h == 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (x1,x2) = x in
      let (a1,a2) = a in
      if ((x1 + x2) + a1) >= 10
      then (1, ((((x1 + x2) + a1) - 10) :: a2))
      else (0, (((x1 + x2) + a1) :: a2)) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (carry,res) = List.fold_left f base args in carry :: res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l = if i > 0 then mulByDigit (i - 1) (bigAdd l l) else l;;

*)

(* changed spans
(26,39)-(26,68)
mulByDigit (i - 1) (bigAdd l
                           l)
AppG (fromList [AppG (fromList [EmptyG]),BopG EmptyG EmptyG])

*)

(* changed exprs
App (Just (26,39)-(26,70)) (Var (Just (26,39)-(26,49)) "mulByDigit") [Bop (Just (26,50)-(26,57)) Minus (Var (Just (26,51)-(26,52)) "i") (Lit (Just (26,55)-(26,56)) (LI 1)),App (Just (26,58)-(26,70)) (Var (Just (26,59)-(26,65)) "bigAdd") [Var (Just (26,66)-(26,67)) "l",Var (Just (26,68)-(26,69)) "l"]]
*)

(* typed spans
(26,39)-(26,70)
*)

(* correct types
int list
*)

(* bad types
int list -> int list -> int list
*)
