ptr n m = (m*m-n*n, 2*n*m, n*n+m*m)
sumtriple (x,y,z) = x+y+z
prod (x,y,z) = x*y*z
main = do
  putStrLn $ show $ take 1 $ dropWhile (\(x,y) -> x /= 1000) ptrSumProd
    where ptrSumProd = [(sumtriple (ptr m n), prod (ptr m n)) | m<-[1..20], n<-[m+1..20]]
