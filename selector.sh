#! /bin/bash
 
RESULT=$(whiptail --title "CUI/GUIセレクター" --menu "モードを選んでください:" 0 0 0 \
"1" "一時的にCUIにする。" \
"2" "一時的にGUIにする。" \
"3" "半永久的にCUIにする。" \
"4" "半永久的にGUIにする。" 3>&1 1>&2 2>&3)

if [ $RESULT -eq 1 ] || [ $RESULT -eq 2 ] || [ $RESULT -eq 3 ] || [ $RESULT -eq 4 ] 
then
  echo $RESULT
else
  echo "何も起きなかった。"
fi

case $RESULT in
  1)
    systemctl isolate multi-user.target
    ;;
  2)
    systemctl isolate graphical.target
    ;;
  3)
 if whiptail --yesno --title "確認" "このプログラムを実行すると再起動が入りますがよろしいですか？" 0 0 ;then
  sudo systemctl set-default multi-user.target
  sudo systemctl reboot
  else
  echo "何も起きなかった。"
  fi
    ;;
  4)
     if whiptail --yesno --title "確認" "このプログラムを実行すると再起動が入りますがよろしいですか？" 0 0 ;then
  sudo systemctl set-default graphical.target
  sudo systemctl reboot
  else
  echo "何も起きなかった。"
  fi
esac