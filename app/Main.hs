module Main where

import Hinfo.Hpack

main :: IO ()
main = do
  app <- loadDefault
  print app