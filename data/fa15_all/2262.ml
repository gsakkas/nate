
let rec removeZero l =
  match l with | [] -> l | h::t -> if h = 0 then removeZero t else h :: t;;

let rec mulByDigit i l =
  let mult (i,l) =
    let f a x =
      match a with
      | (o,l) ->
          let prod = x + o in
          if prod < 10 then (0, (prod :: l)) else (1, ((prod - 10) :: l)) in
    let base = (0, []) in
    let args = l in let (_,res) = List.fold_left f base args in res in
  removeZero (mult i l);;


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

let rec mulByDigit i l = if i = 0 then [0] else bigAdd l l;;

*)

(* changed spans
(2,19)-(3,73)
fun l1 ->
  fun l2 ->
    (let difference =
       List.length l1 - List.length l2 in
     if difference > 0
     then (l1 , clone 0
                      difference @ l2)
     else if difference < 0
          then (clone 0
                      ((-1) * difference) @ l1 , l2)
          else (l1 , l2))
LamG (LamG EmptyG)

(5,19)-(14,23)
EMPTY
EmptyG

(5,21)-(14,23)
EMPTY
EmptyG

(6,2)-(14,23)
EMPTY
EmptyG

(6,12)-(13,67)
fun l1 ->
  fun l2 ->
    (let add =
       fun (l1 , l2) ->
         (let f =
            fun a ->
              fun x ->
                match a with
                | (o , l) -> (let sum =
                                x + o in
                              if sum < 10
                              then (0 , sum :: l)
                              else (1 , (sum - 10) :: l)) in
          let base = (0 , []) in
          let args =
            (let combine =
               fun (a , b) -> a + b in
             List.map combine
                      (List.rev (List.combine l1
                                              l2)) @ [0]) in
          let (_ , res) =
            List.fold_left f base args in
          res) in
     removeZero (add (padZero l1
                              l2)))
LamG (LamG EmptyG)

(7,4)-(13,67)
fun l2 ->
  (let add =
     fun (l1 , l2) ->
       (let f =
          fun a ->
            fun x ->
              match a with
              | (o , l) -> (let sum =
                              x + o in
                            if sum < 10
                            then (0 , sum :: l)
                            else (1 , (sum - 10) :: l)) in
        let base = (0 , []) in
        let args =
          (let combine =
             fun (a , b) -> a + b in
           List.map combine
                    (List.rev (List.combine l1
                                            l2)) @ [0]) in
        let (_ , res) =
          List.fold_left f base args in
        res) in
   removeZero (add (padZero l1
                            l2)))
LamG (LetG NonRec (fromList [EmptyG]) EmptyG)

(10,10)-(11,73)
let sum = x + o in
if sum < 10
then (0 , sum :: l)
else (1 , (sum - 10) :: l)
LetG NonRec (fromList [BopG EmptyG EmptyG]) (IteG EmptyG EmptyG EmptyG)

(11,13)-(11,17)
sum
VarG

(11,33)-(11,37)
sum
VarG

(11,56)-(11,60)
sum
VarG

(13,15)-(13,16)
let combine =
  fun (a , b) -> a + b in
List.map combine
         (List.rev (List.combine l1
                                 l2)) @ [0]
LetG NonRec (fromList [LamG EmptyG]) (AppG (fromList [EmptyG]))

(13,20)-(13,67)
List.map combine
         (List.rev (List.combine l1
                                 l2)) @ [0]
AppG (fromList [AppG (fromList [EmptyG]),ListG EmptyG Nothing])

(14,13)-(14,23)
add (padZero l1 l2)
AppG (fromList [AppG (fromList [EmptyG])])

(14,14)-(14,18)
padZero
VarG

(14,19)-(14,20)
fun i ->
  fun l ->
    if i = 0
    then [0]
    else bigAdd l l
LamG (LamG EmptyG)

(14,21)-(14,22)
bigAdd l l
AppG (fromList [VarG])

*)
