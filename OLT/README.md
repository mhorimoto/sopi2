OLT メンテナンス
================

OLTのCONT-4にシリアルケーブルを接続してOLTのメンテンナンスを行う専用Userを設定する。

# Install

## Userの追加

     # useradd -u 1001 -g dialout -m -s /bin/sh console
     # passwd console
       パスワードを設定する

## minicomの設定

     # apt update
     # apt install minicom
     # cp minirc.dfl /etc/minicom

## sudoの設定

     # visudo を起動して sudoers.append を追記する

## .profileの設定

     # echo sudo /usr/bin/minicom >> ~console/.profile
     # echo exit >> ~console/.profile

