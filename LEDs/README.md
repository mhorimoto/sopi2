SOPi2 LEDs
==========

SOPi2のLED操作のプログラム群

# 内蔵LED

## status_led_heartbeat

eth0のインタフェースがupしたら内蔵の赤色LEDがハートビート点滅する。

### インストール

install status_led_heartbeat /etc/network/if-up.d

# D1,D2,D3

## D1

直近の監視対象(OLT)とのping応答が確認できたら点灯。
ping応答が確認できなければ消灯。

## D2

ログサーバなど(TUP)とのping応答が確認できたら点灯。
ping応答が確認できなければ消灯。

## D3

デフォルトゲートウェイとのping応答が確認できたら点灯。
ping応答が確認できなければ消灯。

### How to Install

    /usr/local/etc/D1.ipconf に監視対象のIPアドレスを1個入れる
    /etc/local/etc/D2.ipconf にログサーバのIPアドレスを1個入れる
    /etc/local/etc/D3.ipconf にDefault GatewayのIPアドレスを1個入れる
    # ./install.sh
    # systemctl restart ope_LED123
    
