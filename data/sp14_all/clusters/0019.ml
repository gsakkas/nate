LamG (LamG EmptyG)
fun x ->
  fun y ->
    match y with
    | [] -> [x]
    | h :: t -> h :: (append x t)
fun x -> fun a -> x a
fun x -> fun a -> x a
fun x -> fun a -> x a
fun x -> fun a -> x a
fun x -> fun a -> x a
fun x -> fun a -> a
fun x -> fun a -> a
fun a -> fun x -> a x
fun i ->
  fun l ->
    fun acc ->
      match i with
      | 0 -> [0]
      | 1 -> l
      | _ -> helper (i - 1) l
                    (bigAdd acc l)
fun i ->
  fun l ->
    fun acc ->
      match i with
      | 0 -> [0]
      | 1 -> l
      | _ -> helper (i - 1) l
                    (bigAdd acc l)
fun i ->
  fun l ->
    fun acc ->
      match i with
      | 0 -> [0]
      | 1 -> l
      | _ -> helper (i - 1) l
                    (bigAdd acc l)
fun x ->
  fun f -> fun a -> f a x
fun f ->
  fun x ->
    fun f -> fun a -> f a x
fun f -> fun a -> f a x
fun n ->
  fun x ->
    if n = 0
    then x
    else loop (n / 10)
              ((n mod 10) :: x)
fun x ->
  fun l ->
    fun acc ->
      match x with
      | [] -> l
      | h :: t -> helper t l
                         (h :: acc)
fun x ->
  fun l ->
    fun acc ->
      match x with
      | [] -> l
      | h :: t -> helper t l
                         (h :: acc)
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
fun i ->
  fun l ->
    (let comb =
       fun a ->
         fun b ->
           match b with
           | [] -> [a]
           | hd :: tl -> List.append [a + hd]
                                     tl in
     let rec mBDhelper =
       fun i ->
         fun x ->
           match x with
           | [] -> []
           | hd :: tl -> if (hd * i) > 9
                         then ((hd * i) / 10) :: (comb ((hd * i) mod 10)
                                                       (mBDhelper i
                                                                  tl))
                         else (hd * i) :: (mBDhelper i
                                                     tl) in
     mBDhelper i l)
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
fun i ->
  fun l ->
    (let comb =
       fun a ->
         fun b ->
           match b with
           | [] -> [a]
           | hd :: tl -> List.append [a + hd]
                                     tl in
     let rec mBDhelper =
       fun i ->
         fun x ->
           match x with
           | [] -> []
           | hd :: tl -> if (hd * i) > 9
                         then ((hd * i) / 10) :: (comb ((hd * i) mod 10)
                                                       (mBDhelper i
                                                                  tl))
                         else (hd * i) :: (mBDhelper i
                                                     tl) in
     mBDhelper i l)
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
fun absNum ->
  fun persCount ->
    if absNum < 10
    then (persCount , absNum)
    else (let xs =
            digits absNum in
          let theSum = sumList xs in
          additivePersAndRoot theSum
                              (persCount + 1))
fun h ->
  fun x ->
    (let xx = h x in
     (xx , xx = h x))
fun h ->
  fun x ->
    (let xx = h x in
     (xx , xx = h x))
fun h ->
  fun x ->
    (let xx = h x in
     (xx , xx = h x))
fun h ->
  fun x ->
    (let xx = h x in
     (xx , xx = h x))
fun h ->
  fun x ->
    (let xx = h x in
     (xx , xx = h x))
fun h ->
  fun x ->
    (let xx = h x in
     (xx , xx = h x))
fun h ->
  fun x ->
    (let xx = h x in
     (xx , xx = h x))
fun l1 ->
  fun l2 ->
    match List.length l1 = List.length l2 with
    | true -> (l1 , l2)
    | false -> (let lendiff =
                  List.length l1 - List.length l2 in
                match lendiff > 0 with
                | true -> (l1 , clone 0
                                      lendiff @ l2)
                | false -> (clone 0
                                  (- lendiff) @ l1 , l2))
fun l1 ->
  fun l2 ->
    (let add =
       fun (l1 , l2) ->
         (let f =
            fun a ->
              fun (x , y) ->
                match a with
                | [] -> (x + y) :: a
                | h :: t -> [(x + y) + (h / 10) ; h mod 10] @ t in
          let base = [] in
          let args =
            List.rev ((0 , 0) :: (List.combine l1
                                               l2)) in
          let res =
            List.fold_left f base args in
          res) in
     removeZero (add (padZero l1
                              l2)))
fun sep ->
  fun sl ->
    match sl with
    | [] -> ""
    | h :: t -> (let f =
                   fun a ->
                     fun x -> a ^ (sep ^ x) in
                 let base = h in
                 let l = t in
                 List.fold_left f base l)
fun x ->
  fun n ->
    (let accum = [] in
     let rec helper =
       fun accum ->
         fun n ->
           if n < 1
           then accum
           else helper (x :: accum)
                       (n - 1) in
     helper accum n)
fun x ->
  fun n ->
    (let accum = [] in
     let rec helper =
       fun accum ->
         fun n ->
           if n < 1
           then accum
           else helper (x :: accum)
                       (n - 1) in
     helper accum n)
fun x ->
  fun n ->
    (let accum = [] in
     let rec helper =
       fun accum ->
         fun n ->
           if n < 1
           then accum
           else helper (x :: accum)
                       (n - 1) in
     helper accum n)
fun x ->
  fun n ->
    (let accum = [] in
     let rec helper =
       fun accum ->
         fun n ->
           if n < 1
           then accum
           else helper (x :: accum)
                       (n - 1) in
     helper accum n)
fun sep ->
  fun sl ->
    match sl with
    | [] -> ""
    | h :: t -> (let f =
                   fun a ->
                     fun x -> a ^ (sep ^ x) in
                 let base = h in
                 let l = t in
                 List.fold_left f base l)
fun sep ->
  fun sl ->
    match sl with
    | [] -> ""
    | h :: t -> (let f =
                   fun a ->
                     fun x -> a ^ (sep ^ x) in
                 let base = h in
                 let l = t in
                 List.fold_left f base l)
fun sep ->
  fun sl ->
    match sl with
    | [] -> ""
    | h :: t -> (let f =
                   fun a ->
                     fun x -> a ^ (sep ^ x) in
                 let base = h in
                 let l = t in
                 List.fold_left f base l)
fun f ->
  fun l ->
    "[" ^ (stringOfList f
                        (List.map f l) ^ "]")
fun a -> fun x -> x
fun a -> fun x -> x
fun a -> fun x -> x
fun a -> fun x -> x
fun x ->
  fun n ->
    if n > 0
    then x :: (clone x (n - 1))
    else []
fun l1 ->
  fun l2 ->
    (let add =
       fun (l1 , l2) ->
         (let f =
            fun a ->
              fun x ->
                match x with
                | (v1 , v2) -> match a with
                               | (list1 , list2) -> match list1 with
                                                    | [] -> (((v1 + v2) / 10) :: list1 , ((v1 + v2) mod 10) :: list2)
                                                    | h :: t -> ((((v1 + v2) + h) / 10) :: list1 , (((v1 + v2) + h) mod 10) :: list2) in
          let base = ([] , []) in
          let args =
            List.append (List.rev (List.combine l1
                                                l2))
                        [(0 , 0)] in
          let (_ , res) =
            List.fold_left f base args in
          res) in
     removeZero (add (padZero l1
                              l2)))
fun l1 ->
  fun l2 ->
    (let f =
       fun a ->
         fun x ->
           match x with
           | (k , v) -> match a with
                        | (c , d) -> (c , bigAdd d
                                                 (mulByDigit k
                                                             v)) in
     let base = ([] , [0]) in
     let args =
       (let rec helper =
          fun acc ->
            fun l1 ->
              fun l2 ->
                match l1 with
                | [] -> acc
                | h :: t -> helper ((h , l2) :: acc)
                                   (List.map (fun x ->
                                                x * 10) t)
                                   l2 in
        helper [] (List.rev l1) l2) in
     let (_ , res) =
       List.fold_left f base args in
     res)
fun x ->
  fun n ->
    if n > 0
    then x :: (clone x (n - 1))
    else []
fun l1 ->
  fun l2 ->
    (let add =
       fun (l1 , l2) ->
         (let f =
            fun a ->
              fun x ->
                match x with
                | (v1 , v2) -> match a with
                               | (list1 , list2) -> match list1 with
                                                    | [] -> (((v1 + v2) / 10) :: list1 , ((v1 + v2) mod 10) :: list2)
                                                    | h :: t -> ((((v1 + v2) + h) / 10) :: list1 , (((v1 + v2) + h) mod 10) :: list2) in
          let base = ([] , []) in
          let args =
            List.append (List.rev (List.combine l1
                                                l2))
                        [(0 , 0)] in
          let (_ , res) =
            List.fold_left f base args in
          res) in
     removeZero (add (padZero l1
                              l2)))
fun i ->
  fun l ->
    match List.rev l with
    | [] -> []
    | h :: t -> (let rec helper =
                   fun acc ->
                     fun v ->
                       if v = 0
                       then acc
                       else helper ((v mod 10) :: acc)
                                   (v / 10) in
                 bigAdd (mulByDigit i
                                    (List.rev (List.map (fun x ->
                                                           x * 10)
                                                        t)))
                        (helper [] (h * i)))
fun l1 ->
  fun l2 ->
    (let f =
       fun a ->
         fun x ->
           match x with
           | (k , v) -> match a with
                        | (c , d) -> (c , bigAdd d
                                                 (mulByDigit k
                                                             v)) in
     let base = ([] , [0]) in
     let args =
       (let rec helper =
          fun acc ->
            fun l1 ->
              fun l2 ->
                match l1 with
                | [] -> acc
                | h :: t -> helper ((h , l2) :: acc)
                                   (List.map (fun x ->
                                                x * 10) t)
                                   l2 in
        helper [] (List.rev l1) l2) in
     let (_ , res) =
       List.fold_left f base args in
     res)
fun x ->
  fun n ->
    if n > 0
    then x :: (clone x (n - 1))
    else []
fun l1 ->
  fun l2 ->
    (let add =
       fun (l1 , l2) ->
         (let f =
            fun a ->
              fun x ->
                match x with
                | (v1 , v2) -> match a with
                               | (list1 , list2) -> match list1 with
                                                    | [] -> (((v1 + v2) / 10) :: list1 , ((v1 + v2) mod 10) :: list2)
                                                    | h :: t -> ((((v1 + v2) + h) / 10) :: list1 , (((v1 + v2) + h) mod 10) :: list2) in
          let base = ([] , []) in
          let args =
            List.append (List.rev (List.combine l1
                                                l2))
                        [(0 , 0)] in
          let (_ , res) =
            List.fold_left f base args in
          res) in
     removeZero (add (padZero l1
                              l2)))
fun i ->
  fun l ->
    match List.rev l with
    | [] -> []
    | h :: t -> (let rec helper =
                   fun acc ->
                     fun v ->
                       if v = 0
                       then acc
                       else helper ((v mod 10) :: acc)
                                   (v / 10) in
                 bigAdd (mulByDigit i
                                    (List.rev (List.map (fun x ->
                                                           x * 10)
                                                        t)))
                        (helper [] (h * i)))
fun l1 ->
  fun l2 ->
    (let f =
       fun a ->
         fun x ->
           match x with
           | (k , v) -> match a with
                        | (c , d) -> (c , bigAdd d
                                                 (mulByDigit k
                                                             v)) in
     let base = ([] , [0]) in
     let args =
       (let rec helper =
          fun acc ->
            fun l1 ->
              fun l2 ->
                match l1 with
                | [] -> acc
                | h :: t -> helper ((h , l2) :: acc)
                                   (List.map (fun x ->
                                                x * 10) t)
                                   l2 in
        helper [] (List.rev l1) l2) in
     let (_ , res) =
       List.fold_left f base args in
     res)
fun l1 ->
  fun l2 ->
    (let add =
       fun (l1 , l2) ->
         (let f =
            fun a ->
              fun x ->
                match x with
                | (v1 , v2) -> match a with
                               | (list1 , list2) -> match list1 with
                                                    | [] -> (((v1 + v2) / 10) :: list1 , ((v1 + v2) mod 10) :: list2)
                                                    | h :: t -> ((((v1 + v2) + h) / 10) :: list1 , (((v1 + v2) + h) mod 10) :: list2) in
          let base = ([] , []) in
          let args =
            List.append (List.rev (List.combine l1
                                                l2))
                        [(0 , 0)] in
          let (_ , res) =
            List.fold_left f base args in
          res) in
     removeZero (add (padZero l1
                              l2)))
fun x -> fun a -> x a
fun list ->
  fun digInt -> n mod 10
fun list ->
  fun digInt -> n mod 10
fun x -> fun x -> (0 , true)
fun x -> fun x -> (0 , true)
fun x -> fun x -> (0 , true)
fun x -> fun x -> (0 , true)
fun x -> fun x -> (0 , true)
fun x -> fun x -> (0 , true)
fun x -> fun x -> (0 , true)
fun x -> fun x -> (0 , true)
fun x -> fun x -> (0 , true)
fun x -> fun x -> (0 , true)
fun i ->
  fun acc ->
    fun l ->
      if i > 0
      then helper i (bigAdd acc l) l
      else acc
fun i ->
  fun acc ->
    fun l ->
      if i > 0
      then helper i (bigAdd acc l) l
      else acc
