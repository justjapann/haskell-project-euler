{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -Wno-missing-safe-haskell-mode #-}
module Paths_estudo (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/home/japan/Desktop/haskell-estudo/estudo/.stack-work/install/x86_64-linux-tinfo6/968a341dc2999437e9b957e252f72fa7020ab7b29055b87b29eebf9971308336/9.0.2/bin"
libdir     = "/home/japan/Desktop/haskell-estudo/estudo/.stack-work/install/x86_64-linux-tinfo6/968a341dc2999437e9b957e252f72fa7020ab7b29055b87b29eebf9971308336/9.0.2/lib/x86_64-linux-ghc-9.0.2/estudo-0.1.0.0-A69vrJPyiWNBlclGzmun8O-estudo"
dynlibdir  = "/home/japan/Desktop/haskell-estudo/estudo/.stack-work/install/x86_64-linux-tinfo6/968a341dc2999437e9b957e252f72fa7020ab7b29055b87b29eebf9971308336/9.0.2/lib/x86_64-linux-ghc-9.0.2"
datadir    = "/home/japan/Desktop/haskell-estudo/estudo/.stack-work/install/x86_64-linux-tinfo6/968a341dc2999437e9b957e252f72fa7020ab7b29055b87b29eebf9971308336/9.0.2/share/x86_64-linux-ghc-9.0.2/estudo-0.1.0.0"
libexecdir = "/home/japan/Desktop/haskell-estudo/estudo/.stack-work/install/x86_64-linux-tinfo6/968a341dc2999437e9b957e252f72fa7020ab7b29055b87b29eebf9971308336/9.0.2/libexec/x86_64-linux-ghc-9.0.2/estudo-0.1.0.0"
sysconfdir = "/home/japan/Desktop/haskell-estudo/estudo/.stack-work/install/x86_64-linux-tinfo6/968a341dc2999437e9b957e252f72fa7020ab7b29055b87b29eebf9971308336/9.0.2/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "estudo_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "estudo_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "estudo_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "estudo_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "estudo_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "estudo_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
