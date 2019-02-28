
let rec removeZero l =
  match l with
  | [] -> []
  | _ -> let h::t = l in (match h with | 0 -> removeZero t | _ -> l);;

let rec mulByDigit i l =
  let mul (i,l) =
    let f a x =
      let (a1,a2) = a in
      let val1 = (x * i) + a1 in
      if val1 > 9
      then ((val1 / 10), ((val1 mod 10) :: a2))
      else (0, (val1 :: a2)) in
    let base = (0, []) in
    let args = List.rev (0 :: l) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (mul i l);;


(* fix

let rec removeZero l =
  match l with
  | [] -> []
  | _ -> let h::t = l in (match h with | 0 -> removeZero t | _ -> l);;

let rec mulByDigit i l =
  let mul (i,l) =
    let f a x =
      let (a1,a2) = a in
      let val1 = (x * i) + a1 in
      if val1 > 9
      then ((val1 / 10), ((val1 mod 10) :: a2))
      else (0, (val1 :: a2)) in
    let base = (0, []) in
    let args = List.rev (0 :: l) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (mul (i, l));;

*)

(* changed spans
(18,13)-(18,22)
mul (i , l)
AppG (fromList [TupleG (fromList [EmptyG])])

*)

(* changed exprs
App (Just (18,13)-(18,25)) (Var (Just (18,14)-(18,17)) "mul") [Tuple (Just (18,18)-(18,24)) [Var (Just (18,19)-(18,20)) "i",Var (Just (18,22)-(18,23)) "l"]]
*)

(* typed spans
(18,13)-(18,25)
*)

(* correct types
int list
*)

(* bad types
int list
*)
