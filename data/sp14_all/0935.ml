
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let leng1 = List.length l1 in
  let leng2 = List.length l2 in
  (((clone 0 (leng2 - leng1)) @ l1), ((clone 0 (leng1 - leng2)) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      ((((fst x) + (snd x)) / 10), (((fst a) + (((fst x) + (snd x)) mod 10))
        :: (snd a))) in
    let base = (0, []) in
    let args = List.rev List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let leng1 = List.length l1 in
  let leng2 = List.length l2 in
  (((clone 0 (leng2 - leng1)) @ l1), ((clone 0 (leng1 - leng2)) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      ((((fst x) + (snd x)) / 10), (((fst a) + (((fst x) + (snd x)) mod 10))
        :: (snd a))) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(18,15)-(18,42)
List.rev (List.combine l1 l2)
AppG (fromList [AppG (fromList [EmptyG])])

*)

(* changed exprs
App (Just (18,15)-(18,44)) (Var (Just (18,15)-(18,23)) "List.rev") [App (Just (18,24)-(18,44)) (Var (Just (18,25)-(18,37)) "List.combine") [Var (Just (18,38)-(18,40)) "l1",Var (Just (18,41)-(18,43)) "l2"]]
*)

(* typed spans
(18,15)-(18,44)
*)

(* correct types
(int * int) list
*)

(* bad types
(int * int) list
*)
