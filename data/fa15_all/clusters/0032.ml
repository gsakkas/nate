LetG NonRec (fromList [LamG EmptyG]) (AppG (fromList [EmptyG]))
let foo =
  fun b ->
    (let result = f b in
     if result = b
     then (result , false)
     else (result , true)) in
wwhile (foo , b)
let funt =
  fun b ->
    if f b
    then (b , true)
    else (b , false) in
wwhile (funt , b)
let funt =
  fun x -> (f b , f b = b) in
wwhile (funt , b)
let fs =
  fun x -> (f b , f b = b) in
wwhile (fs , b)
let base = fun f -> 0 in
List.fold_left f base fs
let add =
  fun (l1 , l2) ->
    (let f =
       fun a ->
         fun x ->
           match x with
           | (l1e , l2e) -> match a with
                            | (carry , list) -> (let num =
                                                   (l1e + l2e) + carry in
                                                 if num < 10
                                                 then (0 , [num] @ list)
                                                 else if num = 10
                                                      then (1 , [0] @ list)
                                                      else (num / 10 , [num mod 10] @ list)) in
     let base = (0 , []) in
     let args =
       List.combine (List.rev ([0] @ l1))
                    (List.rev ([0] @ l2)) in
     let (_ , res) =
       List.fold_left f base args in
     res) in
removeZero (add (padZero l1
                         l2))
let fix =
  fun l ->
    fun x -> List.map f l in
sepConcat "[" l
let g =
  fun x ->
    (let n = f x in
     (n , n = x)) in
wwhile (g , b)
let base = fun x -> x in
List.fold_left f base fs
let combine =
  fun (a , b) -> a + b in
List.map combine
         (List.rev (List.combine l1
                                 l2))
let f' =
  fun b' ->
    (f b' , f b' <> b') in
wwhile (f' , b)
let helper =
  fun b ->
    if f b = b
    then (true , f b)
    else (false , f b) in
wwhile (helper , b)
let helper =
  fun b ->
    if f b = b
    then (b , false)
    else (f b , true) in
wwhile (helper , b)
let add =
  fun (l1 , l2) ->
    (let f =
       fun a ->
         fun x ->
           (let (x1 , x2) = x in
            let (c , a1 :: a2) = a in
            let v = (x1 + x2) + c in
            (v / 10 , [v / 10] @ ([v mod 10] @ a2))) in
     let base = (0 , [0]) in
     let args =
       List.rev (List.combine l1
                              l2) in
     let (_ , res) =
       List.fold_left f base args in
     res) in
removeZero (add (padZero l1
                         l2))
