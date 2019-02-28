
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let x1 = List.length l1 in
  let x2 = List.length l2 in
  if x1 < x2
  then (((clone 0 (x2 - x1)) @ l1), l2)
  else (l1, ((clone 0 (x1 - x2)) @ l2));;

let rec removeZero l =
  match l with
  | [] -> []
  | h::[] -> if h <> 0 then l else []
  | h::t -> if h <> 0 then l else removeZero t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (x1,x2) = x in
      let (carry,res) = a in
      if res <> []
      then
        let lastTens::rest = res in
        (if carry <> []
         then
           let ch::_ = carry in
           let tens = ((x1 + x2) + ch) / 10 in
           let ones = ((x1 + x2) + ch) mod 10 in
           ([tens], (tens :: ones :: rest))
         else
           (let tens = (x1 + x2) / 10 in
            let ones = (x1 + x2) mod 10 in ([tens], (tens :: ones :: rest))))
      else
        if carry <> []
        then
          (let ch::_ = carry in
           let tens = ((x1 + x2) + ch) / 10 in
           let ones = ((x1 + x2) + ch) mod 10 in
           ([tens], (tens :: ones :: res)))
        else
          (let tens = (x1 + x2) / 10 in
           let ones = (x1 + x2) mod 10 in ([tens], (tens :: ones :: res))) in
    let base = ([], []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l = if i <> 0 then mulByDigit (i - 1) bigAdd l l else l;;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let x1 = List.length l1 in
  let x2 = List.length l2 in
  if x1 < x2
  then (((clone 0 (x2 - x1)) @ l1), l2)
  else (l1, ((clone 0 (x1 - x2)) @ l2));;

let rec removeZero l =
  match l with
  | [] -> []
  | h::[] -> if h <> 0 then l else []
  | h::t -> if h <> 0 then l else removeZero t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (x1,x2) = x in
      let (carry,res) = a in
      if res <> []
      then
        let lastTens::rest = res in
        (if carry <> []
         then
           let ch::_ = carry in
           let tens = ((x1 + x2) + ch) / 10 in
           let ones = ((x1 + x2) + ch) mod 10 in
           ([tens], (tens :: ones :: rest))
         else
           (let tens = (x1 + x2) / 10 in
            let ones = (x1 + x2) mod 10 in ([tens], (tens :: ones :: rest))))
      else
        if carry <> []
        then
          (let ch::_ = carry in
           let tens = ((x1 + x2) + ch) / 10 in
           let ones = ((x1 + x2) + ch) mod 10 in
           ([tens], (tens :: ones :: res)))
        else
          (let tens = (x1 + x2) / 10 in
           let ones = (x1 + x2) mod 10 in ([tens], (tens :: ones :: res))) in
    let base = ([], []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  if i <> 0 then mulByDigit (i - 1) (bigAdd l l) else l;;

*)

(* changed spans
(49,40)-(49,69)
mulByDigit (i - 1) (bigAdd l
                           l)
AppG (fromList [AppG (fromList [EmptyG]),BopG EmptyG EmptyG])

*)

(* changed exprs
App (Just (50,17)-(50,48)) (Var (Just (50,17)-(50,27)) "mulByDigit") [Bop (Just (50,28)-(50,35)) Minus (Var (Just (50,29)-(50,30)) "i") (Lit (Just (50,33)-(50,34)) (LI 1)),App (Just (50,36)-(50,48)) (Var (Just (50,37)-(50,43)) "bigAdd") [Var (Just (50,44)-(50,45)) "l",Var (Just (50,46)-(50,47)) "l"]]
*)

(* typed spans
(50,17)-(50,48)
*)

(* correct types
int list
*)

(* bad types
int list -> int list -> int list
*)
