;
; 									GTA V Online Useful Macros
; AutoHotkey Version: v1.1.33.02
; Language:      Russian
; Platform:      Windows 10 Professional (64 bit)
; Author:        palipoka
;
;	
; Функция скрипта: Предоставляет горячие клавиши для открытия меню закусок, экипировки броней, перехода в пассивный режим 
; 		 и регистрации вашей организации. Не дает вам погибнуть, как сучке, во время ограблений.
; 		 Позволяет вам быть дерзким в смертельных схватках.
;	
; Общие замечания: Работает при передвижении пешком и в транспортных средствах. Не работает на конспиративных квартирах, 
;		 где присутствует опция "Пригласить в квартиру".
;		 Похоже, что меню взаимодействия иногда не открывается при первом использовании горячих клавиш после загрузки в
;		 режим свободного перемещения или ограбления. Вы можете открыть меню взаимодействия или запустить макрос один 
;		 раз, чтобы предотвратить повторение этого.
;
;		 Чтобы изменить горячую клавишу для макроса или настроить параметры задержки, просто замените назначенное значение
;		 в разделе "Назначить горячую клавишу и задержку" на новое значение. 
; 		 Список неалфавитно-цифровых клавиш можно найти в справке autohotkey в разделе "Основы использования и синтаксис" 
;		 под названием "Список клавиш".
; 		 Их также можно найти по адресу https://www.autohotkey.com/docs/KeyList.htm
;
; Протестирован 22 августа 2024 года без каких-либо серьезных проблем.

#NoEnv  			; Рекомендуется для повышения производительности и совместимости с будущими версиями AutoHotkey.
SetWorkingDir %A_ScriptDir%  	; Обеспечивает согласованную начальную директорию.
#IfWinActive ahk_class grcWindow  ; Отключает горячие клавиши при нажатии alt-tab или при закрытии GTA.



; 								---------Назначение горячих клавиш и задержки---------

HealthKey := "F1" 		; Установите привязку клавиш для макроса здесь. Открыть меню закусок.
ArmorKey := "F2"		; Установите привязку клавиш для макроса здесь. Открыть меню брони.
PassiveKey := "F3"		; Установите привязку клавиш для макроса здесь. Стать пассивным пидором.
DicOrgKey := "F4"		; Установите привязку клавиш для макроса здесь. Распустить оргу или клуб.
RegCEOKey := "F5"		; Установите привязку клавиш для макроса здесь. Регистрация орги.
RegMCKey := "F6"		; Установите привязку клавиш для макроса здесь. Регистрация клуб.
MissHealthKey := "F7" 	; Установите привязку клавиш для макроса здесь. Открыть меню закусок (на миссии).
MissArmorKey := "F8"	; Установите привязку клавиш для макроса здесь. Открыть меню брони (на миссии).
BSTDropKey := "F9"		; Установите привязку клавиш для макроса здесь. Дроп BST (VIP-персона/генеральный директор или вице-президент).

IntMenuDelay := 120		; Устанавливает значение (мс) дополнительной задержки после открытия меню взаимодействия.
KeySendDelay := 25		; Устанавливает значение (мс) задержки между отправкой команд.
KeyPressDuration := 5	; Устанавливает значение (мс) для продолжительности удерживания нажатой клавиши при каждом нажатии.




; 									----Сам скрипт и настройка(не влезай, обсупримишся)----


Hotkey, %HealthKey%, Health	; Assigns above value to hotkey. Do not change this line.
Hotkey, %ArmorKey%, Armor	; Assigns above value to hotkey. Do not change this line.
Hotkey, %PassiveKey%, Passive	; Assigns above value to hotkey. Do not change this line.
Hotkey, %DicOrgKey%, DicOrg	; Assigns above value to hotkey. Do not change this line.
Hotkey, %RegCEOKey%, RegCEO	; Assigns above value to hotkey. Do not change this line.
Hotkey, %RegMCKey%, RegMC	; Assigns above value to hotkey. Do not change this line.
Hotkey, %MissHealthKey%, OrgHealth	; Assigns above value to hotkey. Do not change this line.
Hotkey, %MissArmorKey%, OrgArmor	; Assigns above value to hotkey. Do not change this line.
Hotkey, %BSTDropKey%, BSTDrop	; Assigns above value to hotkey. Do not change this line.
Return


setkeydelay, KeySendDelay, KeyPressDuration 		; Sets delay(ms) between keystrokes issued. Arguments are delay between keystrokes and press duration, respectively. 
							; They might be able to go lower but these values are pretty fast and work reliably.


;									  ----Macro Code Section----


; 									     ----Health---- 
; 							Opens up snack menu for manual selection of snacks.



Health: 				; Health Macro.
			
Send {m} 			; Opens Interaction Menu.
sleep, IntMenuDelay		; Necessary delay to allow interaction menu to open properly while keeping keystroke delay short.
				; Try to keep this value + the keystroke delay at least 80 ms for proper function.

Send {Down}{Down}{Down}{Down}{Enter}{Down}{Down}{Enter}   ; Opens Snack Menu.

return				; Separates Hotkey Entries.





; 									     ----Armor---- 
; 							 Equips super heavy armor and exits menu automatically.



Armor: 				; Armor Macro.
Send {m}			; Opens Interaction Menu.
sleep, IntMenuDelay		; Necessary delay to allow interaction menu to open properly while keeping keystroke delay short.
				; Try to keep this value + the keystroke delay at least 80 ms for proper function.

Send {Down}{{Down}{Down}{Down}{Enter}{Down}{Enter}		; Opens Armor Menu.
Send {Down}{Down}{Down}{Down}{Enter}{m} 			; Equips super heavy armor and exits automatically. This line can be changed to pick different armor types.

return				; Separates Hotkey Entries.

										



;								          ----Passive Mode---- 
; 								      Enters and exits passive mode.



Passive: 			; Passive Macro.
Send {m}			; Opens Interaction Menu.
sleep, IntMenuDelay		; Necessary delay to allow interaction menu to open properly while keeping keystroke delay short.
				; Try to keep this value + the keystroke delay at least 80 ms for proper function.



Send {Up}{Enter}{m}		; Toggles Passive Mode and exits automatically.
return				; Separates Hotkey Entries.





;								      ----Disband CEO or MC---- 
; 							       Disband your CEO organization or MC club.	



DicOrg: 			; Disband Organization Macro.
Send {m}			; Opens Interaction Menu.
sleep, IntMenuDelay		; Necessary delay to allow interaction menu to open properly while keeping keystroke delay short.
				; Try to keep this value + the keystroke delay at least 80 ms for proper function.

Send {Enter}{Up}{Enter}{m}				; Requests vehicle and exits automatically.
return									; Separates Hotkey Entries.





;								      ----Register as CEO---- 
; 								   Register your CEO organization.		



RegCEO: 			; CEO Register Macro.
Send {m}			; Opens Interaction Menu.
sleep, IntMenuDelay		; Necessary delay to allow interaction menu to open properly while keeping keystroke delay short.
				; Try to keep this value + the keystroke delay at least 80 ms for proper function.

Send {Down}{Enter}{Enter}{Enter}{m} 		; Returns vehicle and exits automatically.
return									; Separates Hotkey Entries.





;								      ----Register as MC---- 
; 								      Register your MC club.			



RegMC: 				; MC Register Macro.
Send {m}			; Opens Interaction Menu.
sleep, IntMenuDelay		; Necessary delay to allow interaction menu to open properly while keeping keystroke delay short.
				; Try to keep this value + the keystroke delay at least 80 ms for proper function.

Send {Down}{Enter}{Down}{Enter}{Enter}{m} 	; Returns vehicle and exits automatically.
return									; Separates Hotkey Entries.





; 									     ----Mission Health---- 
; 								Opens up snack menu for manual selection of snacks.



OrgHealth: 			; Mission Health Macro.
			
Send {m} 			; Opens Interaction Menu.
sleep, IntMenuDelay		; Necessary delay to allow interaction menu to open properly while keeping keystroke delay short.
				; Try to keep this value + the keystroke delay at least 80 ms for proper function.

Send {Down}{Down}{Down}{Enter}{Down}{Down}{Enter}   ; Opens Snack Menu.

return				; Separates Hotkey Entries.





; 									     ----Mission Armor---- 
; 								Equips super heavy armor and exits menu automatically.



OrgArmor: 			; Mission Armor Macro.
Send {m}			; Opens Interaction Menu.
sleep, IntMenuDelay		; Necessary delay to allow interaction menu to open properly while keeping keystroke delay short.
				; Try to keep this value + the keystroke delay at least 80 ms for proper function.

Send {Down}{Down}{Down}{Enter}{Down}{Enter}		; Opens Armor Menu.
Send {Down}{Down}{Down}{Down}{Enter}{m} 			; Equips super heavy armor and exits automatically. This line can be changed to pick different armor types.

return				; Separates Hotkey Entries.





; 									     ----BST Drop---- 
;			   As a VIP/CEO or Vice President, spawn a Bull Shark Testosterone closer to the player. Increase your health and damage. Cost $1,000.
;					    The effect of Bull Shark Testosterone lasts only 60 seconds before they wear off.
;				A countdown timer is displayed in the lower right side of the screen after the player picks up the package.



BSTDrop: 			; BST Drop Macro.
Send {m}			; Opens Interaction Menu.
sleep, IntMenuDelay		; Necessary delay to allow interaction menu to open properly while keeping keystroke delay short.
				; Try to keep this value + the keystroke delay at least 80 ms for proper function.

Send {Enter}{Down}{Down}{Down}{Down}{Enter}	; Open VIP/CEO or Vice President Abilities Menu.
Send {Down}{Enter}{m} 	; Drops Bull Shark Testosterone package near to the player.

return				; Separates Hotkey Entries.