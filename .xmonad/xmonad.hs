-- default desktop configuration for Fedora

import System.Posix.Env (getEnv)
import Data.Maybe (maybe)

import XMonad
import XMonad.Config.Desktop
import XMonad.Config.Gnome
import XMonad.Config.Kde
import XMonad.Config.Xfce

main = do
     session <- getEnv "DESKTOP_SESSION"
     xmonad  $ desktopConfig {
        focusFollowsMouse = False
     }
