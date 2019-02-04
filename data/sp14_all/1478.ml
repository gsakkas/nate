
let bigMul l1 l2 =
  let f a x = l1 in
  let base = (0, []) in
  let args =
    let rec argmaker x y =
      match y with
      | hd::tl -> if tl = [] then [(x, hd)] else (x, hd) @ (argmaker x tl) in
    argmaker l1 l2 in
  let (_,res) = List.fold_left f base args in res;;


(* fix

let rec clone x n =
  let rec clonehelper tx tn =
    match tn = 0 with
    | true  -> []
    | false  -> tx :: (clonehelper tx (tn - 1)) in
  clonehelper x (abs n);;

let padZero l1 l2 =
  match (List.length l1) > (List.length l2) with
  | true  ->
      (l1, (List.append (clone 0 ((List.length l1) - (List.length l2))) l2))
  | false  ->
      ((List.append (clone 0 ((List.length l2) - (List.length l1))) l1), l2);;

let rec removeZero l =
  let rec removeZH templ =
    match templ with
    | [] -> []
    | hd::tl -> if hd = 0 then removeZH tl else hd :: tl in
  removeZH l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match x with
      | (addend_a,addend_b) ->
          let prevcarry = match a with | (x,y) -> x in
          let new_carry = ((prevcarry + addend_a) + addend_b) / 10 in
          let digit = ((prevcarry + addend_a) + addend_b) mod 10 in
          (match a with
           | (x,c::d::y) -> (new_carry, (new_carry :: digit :: d :: y))
           | _ -> (new_carry, [new_carry; digit])) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  let comb a b = match b with | [] -> [a] | hd::tl -> List.append [a + hd] tl in
  let rec mBDhelper i x =
    match x with
    | [] -> []
    | hd::tl ->
        if (hd * i) > 9
        then ((hd * i) / 10) :: (comb ((hd * i) mod 10) (mBDhelper i tl))
        else (hd * i) :: (mBDhelper i tl) in
  mBDhelper i l;;

let bigMul l1 l2 =
  let f a x =
    match x with
    | (l2digit,templ1) ->
        let (l2digit2,templ12) = a in
        let multres = mulByDigit l2digit templ1 in
        (0, (bigAdd (templ12 @ [0]) multres)) in
  let base = (0, []) in
  let args =
    let rec argmaker x y =
      match y with
      | [] -> []
      | hd::tl -> if tl = [] then [(hd, x)] else (hd, x) :: (argmaker x tl) in
    argmaker l1 l2 in
  let (_,res) = List.fold_left f base args in res;;

*)

(* changed spans
(2,11)-(10,49)
fun x ->
  fun n ->
    (let rec clonehelper =
       fun tx ->
         fun tn ->
           match tn = 0 with
           | true -> []
           | false -> tx :: (clonehelper tx
                                         (tn - 1)) in
     clonehelper x (abs n))
LamG (LamG EmptyG)

(3,2)-(10,49)
fun l1 ->
  fun l2 ->
    (let add =
       fun (l1 , l2) ->
         (let f =
            fun a ->
              fun x ->
                match x with
                | (addend_a , addend_b) -> (let prevcarry =
                                              match a with
                                              | (x , y) -> x in
                                            let new_carry =
                                              ((prevcarry + addend_a) + addend_b) / 10 in
                                            let digit =
                                              ((prevcarry + addend_a) + addend_b) mod 10 in
                                            match a with
                                            | (x , c :: d :: y) -> (new_carry , new_carry :: (digit :: (d :: y)))
                                            | _ -> (new_carry , [new_carry ; digit])) in
          let base = (0 , []) in
          let args =
            List.rev (List.combine l1
                                   l2) in
          let (_ , res) =
            List.fold_left f base args in
          res) in
     removeZero (add (padZero l1
                              l2)))
LamG (LamG EmptyG)

(3,14)-(3,16)
match x with
| (addend_a , addend_b) -> (let prevcarry =
                              match a with
                              | (x , y) -> x in
                            let new_carry =
                              ((prevcarry + addend_a) + addend_b) / 10 in
                            let digit =
                              ((prevcarry + addend_a) + addend_b) mod 10 in
                            match a with
                            | (x , c :: d :: y) -> (new_carry , new_carry :: (digit :: (d :: y)))
                            | _ -> (new_carry , [new_carry ; digit]))
CaseG VarG (fromList [(Nothing,LetG NonRec (fromList [EmptyG]) EmptyG)])

(4,2)-(10,49)
fun l1 ->
  fun l2 ->
    (let f =
       fun a ->
         fun x ->
           match x with
           | (l2digit , templ1) -> (let (l2digit2 , templ12) =
                                      a in
                                    let multres =
                                      mulByDigit l2digit
                                                 templ1 in
                                    (0 , bigAdd (templ12 @ [0])
                                                multres)) in
     let base = (0 , []) in
     let args =
       (let rec argmaker =
          fun x ->
            fun y ->
              match y with
              | [] -> []
              | hd :: tl -> if tl = []
                            then [(hd , x)]
                            else (hd , x) :: (argmaker x
                                                       tl) in
        argmaker l1 l2) in
     let (_ , res) =
       List.fold_left f base args in
     res)
LamG (LamG EmptyG)

(7,6)-(8,74)
match y with
| [] -> []
| hd :: tl -> if tl = []
              then [(hd , x)]
              else (hd , x) :: (argmaker x
                                         tl)
CaseG VarG (fromList [(Nothing,IteG EmptyG EmptyG EmptyG),(Nothing,ListG EmptyG Nothing)])

(8,18)-(8,74)
[]
ListG EmptyG Nothing

(8,36)-(8,37)
EMPTY
EmptyG

(8,49)-(8,56)
EMPTY
EmptyG

(8,49)-(8,74)
EMPTY
EmptyG

(8,53)-(8,55)
(hd , x)
TupleG (fromList [VarG])

(8,57)-(8,58)
EMPTY
EmptyG

(8,59)-(8,74)
x
VarG

*)
