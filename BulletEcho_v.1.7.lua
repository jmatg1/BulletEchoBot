--gg.clearAll()
---------------------------------------------------------------------------------------
--🔻🔻🔻🔻🔻🔻🔻🔻 Start 🔻🔻🔻🔻🔻🔻🔻🔻--
--------------------------------------------------------------------------------------
gg.clearResults()
gg.clearList()
gg.setVisible(true)
local z = {0,0,0}
---------------------------------------------------------------------------------------
--♻️♻️♻️♻️♻️♻️♻️ System Functions ♻️♻️♻️♻️♻️♻️♻️--
---------------------------------------------------------------------------------------
function tomainmenu()
   gg.clearResults()
   gg.setVisible(true)
end


---------------------------------------------------------------------------------------
--📋📋📋📋📋📋📋 Main Menu 📋📋📋📋📋📋📋--
---------------------------------------------------------------------------------------
function mainmenu()
   mm1 = gg.multiChoice({
   lang_game['NightMod'],
   lang_game['Zoom'],
   lang_game['review'],
   lang_game['fonarik'],
   lang_game['Cards_for_gold'],
   lang_game['info'],
   lang_game['exit'],
   },nil,lang_game['version'], Rama, '')
   if mm1 == nil then gg.setVisible(false) else
       
   if mm1[1] == true then night() end
   
   if mm1[2] == true then zoomfunc() end

   if mm1[3] == true then overviewfunc() end
   
   if mm1[4] == true then yellowfonarik() end
   
   if mm1[5] == true then cardgold() end

   if mm1[6] == true then infofunc() end
   
   if mm1[7] == true then Exit() end
end
end

---------------------------------------------------------------------------------------
--📋📋📋📋📋📋📋 Weapon Menu 📋📋📋📋📋📋📋--
---------------------------------------------------------------------------------------



---------------------------------------------------------------------------------------
--📋📋📋📋📋📋📋 Zoom Menu 📋📋📋📋📋📋📋--
---------------------------------------------------------------------------------------

function zoomfunc()
   zfm1 = gg.multiChoice({
      "+50%",
      "+75%",
      "+100%",
      "+150%",
      lang_game['Back']
      },nil,lang_game['InfoChoice'], Rama, '')
      if zfm1 == nil then gg.setVisible(false) else
          
      if zfm1[1] == true then ekran1() end
      
      if zfm1[2] == true then ekran2() end
   
      if zfm1[3] == true then ekran3() end

      if zfm1[4] == true then ekran4() end
   
      if zfm1[5] == true then tomainmenu() end
   end
end

---------------------------------------------------------------------------------------
--📋📋📋📋📋📋📋 Info Men 📋📋📋📋📋📋📋--
---------------------------------------------------------------------------------------
function yellowfonarik()

   fonar = gg.multiChoice({
      lang_game['Dim'],
      lang_game['Bright'],
      lang_game['Back'],
      },nil,"🔦🔦🔦", Rama, '')
      if fonar == nil then gg.setVisible(false) else
          
      if fonar[1] == true then FonarikDim() end
      
      if fonar[2] == true then FonarikBright() end
   
      if fonar[3] == true then tomainmenu() end
   end
end

function FonarikDim()
   gg.setRanges(gg.REGION_C_ALLOC)
   gg.searchNumber("4559804549716298957Q;0.78", gg.TYPE_FLOAT)
   gg.refineNumber("0.78", gg.TYPE_FLOAT)
   gg.getResults(100)
   gg.editAll("0.1", gg.TYPE_FLOAT)
   gg.clearResults(true)
   gg.toast("Activated",true)
end

function FonarikBright()
   gg.setRanges(gg.REGION_C_ALLOC)
   gg.searchNumber("4559804549716298957Q;0.78", gg.TYPE_FLOAT)
   gg.refineNumber("0.78", gg.TYPE_FLOAT)
   gg.getResults(100)
   gg.editAll("1.5", gg.TYPE_FLOAT)
   gg.clearResults(true)
   gg.toast("Activated",true)
end

---------------------------------------------------------------------------------------
--📋📋📋📋📋📋📋 Info Menu 📋📋📋📋📋📋📋--
---------------------------------------------------------------------------------------

function infofunc()
   ifm1 = gg.multiChoice({
   lang_game['InfoChoice1'],
   lang_game['PodderjatAvtora'],
   lang_game['SviazSAvtorom'],
   lang_game['Pomogli'],
   lang_game['Back']
   },nil,'Version script 1.7', Rama, '')
   if ifm1 == nil then gg.setVisible(false) else
       
   if ifm1[1] == true then info1() end
   
   if ifm1[2] == true then info2() end

   if ifm1[3] == true then info3() end
   
   if ifm1[4] == true then info4() end

   if ifm1[5] == true then tomainmenu() end
end
end

---------------------------------------------------------------------------------------
--📋📋📋📋📋📋📋 Info2 Menu 📋📋📋📋📋📋📋--
---------------------------------------------------------------------------------------

function info2()
   if z[2] == 0 then
      gg.alert(lang_game['alert2'])
      z[2] = 1 end
   donate = gg.choice({'💸Яндекс деньги','🥝Qiwi','💳PayPal',lang_game['Back']},nil,lang_game['POJERTV'], Rama, '')
   if donate == 1 then donate1() end
   if donate == 2 then donate2() end
   if donate == 3 then donate3() end
end
---------------------------------------------------------------------------------------
--📋📋📋📋📋📋📋 Info3 Menu 📋📋📋📋📋📋📋--
---------------------------------------------------------------------------------------

function info3()
   sviaz = gg.choice({'✉Telegram','🔴YouTube Channel',lang_game['Back']},nil,lang_game['POJERTV1'], Rama, '')
   if sviaz == 1 then sviaz1() end
   if sviaz == 2 then sviaz2() end
end

---------------------------------------------------------------------------------------
--📋📋📋📋📋📋📋 Pomogli Menu 📋📋📋📋📋📋📋--
---------------------------------------------------------------------------------------

function info4()
   menu_pomog = gg.choice({'SaSiAmi for help with translation into Arabic. @SaSiLsn',
     'Носок for help finding the function',
 'GameKiller for your great help in developing the script.',
                           lang_game['Back']},
   nil,lang_game['Kto_Pomog'], Rama, '')
   if menu_pomog == 1 then menu_pomog1() end
   if menu_pomog == 2 then menu_pomog2() end
   if menu_pomog == 3 then menu_pomog3() end
   if menu_pomog == 4 then infofunc() end
end

function menu_pomog1()
   gg.alert('telegram:@SaSiLsn ')
   gg.copyText('@SaSiLsn')
end

function menu_pomog2()
   gg.alert('telegram:@? ')
   gg.copyText('@?')
end

function menu_pomog3()
   gg.alert('YT: GameKiller ')
   gg.copyText('https://www.youtube.com/channel/UCq_cLlB8Nu63ACkxbfncIrA/featured')
end


----------------------------------------------------------------------------
--============= Functions==============--
----------------------------------------------------------------------------


function night()
   gg.setRanges(gg.REGION_C_ALLOC)
   gg.searchNumber("1632087572596Q;100D", gg.TYPE_DWORD)
   gg.refineNumber("100", gg.TYPE_DWORD)
   gg.getResults(100)
   gg.editAll("200", gg.TYPE_DWORD)
   gg.clearResults(true)
   gg.toast("Activated",true)
end

----------------------------------------------------------------------------
--=============Cards_for_gold Functions==============--
----------------------------------------------------------------------------
function cardgold()
   if z[1] == 0 then
   gg.alert(lang_game['alert8'])
   z[1] = 1 end
   wfm3 = gg.multiChoice({
   "Ghost, Stalker",
   "Blot, Satoshi",
   "Sparkle, Freddie, Firefly",
   "Bastion, Angel, Hurricane",
   "Levi, Slayer",
   "Cyclops, Raven",
   "Dragoon, Arnie",
   "Mirage",
   "Doc, Smog",
   "Leviathan",
   "Berta",
   lang_game['Back'],
   },nil,lang_game['version'], Rama, '')
   if wfm3 == nil then gg.setVisible(false) else
       
   if wfm3[1] == true then Ghost_Stalker() end
   
   if wfm3[2] == true then Blot_Satoshi() end
   
   if wfm3[3] == true then Sparkle_Freddie_Firefly() end
   
   if wfm3[4] == true then Bastion_Angel_Hurricane() end
   
   if wfm3[5] == true then Levi_Slayer() end

   if wfm3[6] == true then Cyclops_Raven() end
   
   if wfm3[7] == true then Dragoon_Arnie() end
   
   if wfm3[8] == true then Mirage() end
   
   if wfm3[9] == true then Doc_Smog() end
   
   if wfm3[10] == true then Leviathan() end
   
   if wfm3[11] == true then Berta() end
   
   if wfm3[12] == true then tomainmenu() end
end
end

function Ghost_Stalker()
g = "1~6D;1 851 880 972D;6 845 289D::9"
cardgold1()
end

function Blot_Satoshi()
g = "1~6D;1 768 452 898D;1 600 416 869D::9"
cardgold1()
end

function Sparkle_Freddie_Firefly()
g = "1~6D;1 701 996 302D;1 701 077 358D::9"
cardgold1()
end

function Bastion_Angel_Hurricane()
g = "1~6D;1 768 452 876D;6 581 349D::9"
cardgold1()
end

function Levi_Slayer()
g = "1~6D;1 818 326 800D;1 667 328 108D::9"
cardgold1()
end

function Cyclops_Raven()
g = "1~6D;1 986 359 820D;7 102 821D::9"
cardgold1()
end

function Dragoon_Arnie()
g = "1~6D;1 768 710 666D;27 502D::9"
cardgold1()
end

function Mirage()
g = "1~6D;1 936 286 738D;1 634 168 421D::9"
cardgold1()
end

function Doc_Smog()
g = "1~6D;1 668 248 076D;7 628 139D::9"
cardgold1()
end

function Leviathan()
g = "1~6D;1 920 300 056D;1 601 463 666D::9"
cardgold1()
end

function Berta()
g = "1~6D;1 819 632 152D;1 601 463 660D::9"
cardgold1()
end
----------------------------------------------
function cardgold1()
   gg.setRanges(gg.REGION_C_ALLOC)
   gg.searchNumber((g), gg.TYPE_DWORD)
   gg.refineNumber("1~6", gg.TYPE_DWORD)
   gg.getResults(1000)
   gg.editAll("7", gg.TYPE_DWORD)
   gg.clearResults(true)
   gg.toast("Activated",true)
end


----------------------------------------------------------------------------
--=============Zoom Functions==============--
----------------------------------------------------------------------------

function ekran1()
   b2="1.5"
   ekran()
end

function ekran2()
   b2="1.75"
   ekran()
end

function ekran3()
   b2="2"
   ekran()
end

function ekran4()
   b2="2.5"
   ekran()
end

function ekran()
   gg.setRanges(gg.REGION_C_ALLOC)
   gg.searchNumber("4611686019472608461Q;1F", gg.TYPE_FLOAT)
   gg.refineNumber("1", gg.TYPE_FLOAT)
   gg.getResults(1000)
   gg.editAll((b2), gg.TYPE_FLOAT)
   gg.clearResults(true)
   gg.toast(lang_game['toast2'], true)
end

----------------------------------------------------------------------------
--=============Overview Functions==============--
----------------------------------------------------------------------------

function overviewfunc()
   if z[3] == 0 then
   gg.alert(lang_game['alert3'])
   z[3] = 1 end
   gg.setRanges(gg.REGION_C_ALLOC)
   gg.searchNumber("100F;0~~0;0~~0;0~~0;2;2::21", gg.TYPE_FLOAT)
   gg.refineNumber("100", gg.TYPE_FLOAT)
   gg.getResults(10000)
   gg.editAll("700", gg.TYPE_FLOAT)
   gg.clearResults(true)
   gg.toast(lang_game['toast3'], true)
end

----------------------------------------------------------------------------
--=============Info Functions==============--
----------------------------------------------------------------------------

function info1()
   gg.alert(lang_game['alert4'])
end

function donate1()
   gg.copyText('https://money.yandex.ru/to/410017385236791')
   gg.alert(lang_game['alert5'])
end

function donate2()
   gg.copyText('https://qiwi.com/n/SLUGLORE')
   gg.alert(lang_game['alert5'])
end

function donate3()
   gg.copyText('https://www.paypal.com/paypalme/RedRoy89')
   gg.alert(lang_game['alert5'])
end

function sviaz1()
   gg.alert('@red_roy')
   gg.copyText('@red_roy')
end

function sviaz2()
   gg.copyText('https://www.youtube.com/channel/UCs9CQq4VufjeaKOzRhJIFjw/videos?view_as=subscriber')
   gg.alert(lang_game['alert6'])
end

----------------------------------------------------------------------------
--=============Settings==============--
----------------------------------------------------------------------------

  
--------------------------------------------------------------------------------------
--🧻🧻🧻🧻🧻🧻🧻🧻 Text 🧻🧻🧻🧻🧻🧻🧻🧻--
--------------------------------------------------------------------------------------
local VERSION_RUS = [[Версия 1.7|by Red Roy]]

local VERSION_ENG = [[Version 1.7|by Red Roy]]

local VERSION_AR = [[الاصدار 1.7|من Red Roy, مع مساعدة GameKiller]]
--------------------------------------------------------------------------------------
local ALERT1_RUS = [[
Внимание антиразброс некорректно работает на большинстве персонажей во время бега, рекомендуется стоять или медленно идти во время стрельбы.
]]
local ALERT1_ENG = [[
Attention anti-scatter does not work correctly on most characters while running, it is recommended to stand or walk slowly while shootings.
]]
local ALERT1_AR = [[ 
ملاحظة هاك الثبات ، ما راح يشتغل زين في كل الشخصيات لازم تمشي بشويش عشان يشتغل زين  
]] 
--------------------------------------------------------------------------------------
local InfoChoice_RUS = [[Выберите насколько хотите отдалить экран. Функция работает на всех персонажах.]]

local InfoChoice_ENG = [[Select how far you want to move the screen. This feature works on all characters.]]

local InfoChoice_AR = [[اختار كم المدى الي تحتاجه ، هذا الهاك يشتغل على كل الشخصيات]] 
--------------------------------------------------------------------------------------
local ALERT2_RUS = [[Приветствую✋. В данном разделе вы можете пожертвовать любую сумму автору скрипта (RedRoy)]]

local ALERT2_ENG = [[Welcome✋. In this section, you can donate any amount to the script author (RedRoy)]]

local ALERT2_AR = [[مرحبا في هذا الاختيار يمكنك ان تدعم المصمم (RedRoy)]] 
--------------------------------------------------------------------------------------
local POJERTV_RUS = [[Приветствую✋. В данном разделе вы можете пожертвовать любую сумму автору скрипта (RedRoy)]]

local POJERTV_ENG = [[Welcome✋. In this section, you can donate any amount to the script author (RedRoy)]]

local POJERTV_AR = [[اهلا في هذا الاختيار يمكنك ان تدعم المصمم(RedRoy)]] 
--------------------------------------------------------------------------------------
local POJERTV1_RUS = [[Пожертования автору помогает в развитии скрипта (добавления функционала, исправления багов)]]

local POJERTV1_ENG = [[Welcome✋. In this section, you can donate any amount to the script author (RedRoy)]]

local POJERTV1_AR = [[اهلا في هذا الاختيار يمكن ان تدعم المصمم(RedRoy)]] 
--------------------------------------------------------------------------------------
local ALERT3_RUS = [[Функция "🔘360 обзор", увеличивает зону видимости персонажа, что дает возможность видеть врагов и предметы дальше и во все стороны.]]

local ALERT3_ENG = [[The "🔘360 view" function increases the visibility of the character, which makes it possible to see enemies and objects further and in all directions.]]

local ALERT3_AR = [[ال "رؤية ٣٦٠ درجة" تتيح لك رؤية الاعبين من حولك ، الذين لا يمكنك رؤيتهم ]] 
--------------------------------------------------------------------------------------
local ALERT4_RUS = [[Приписка [Лобби] означает что для коректной работы чита, данную функцию нужно активировать непосредственно находясь в стартовом меню игры, при приписке [Бой], соотвественно во время игры непосредственно на карте.]]

local ALERT4_ENG = [[PostScript [Lobby] means that for correct operation of the cheat, this function must be activated directly from the start menu of the game, with the PostScript [Battle], respectively, during the game directly on the map.]]

local ALERT4_AR = [[السكربت [اللوبي] يعني قبل ما تبدا القيم تفعل الاوامر [في القيم], يعني لمن تبدا قيم تفعل الاوامر ]]
--------------------------------------------------------------------------------------
local ALERT8_RUS = [[Функция делает ваши карточки ультимативными визуально, после перезапуска все станет как было.]]

local ALERT8_ENG = [[Function makes your cards the ultimate visually, after a restart everything will be as it was.]]

local ALERT8_AR = [[This feature allows you to get gold instead of cards when opening chests. Attention this feature does not make your characters ultimatum, it is visual, but the gold received is real.]]
--------------------------------------------------------------------------------------
--🌏🌏🌏🌏🌏🌏🌏🌏 Local 🌏🌏🌏🌏🌏🌏🌏🌏--
--------------------------------------------------------------------------------------
local game_ru = {
HackWeapon = "🎯Взлом оружие [Лобби]",
Zoom = "🔍Зум [Бой]",
review = "🔘360 обзор [Лобби] ",
info = "📜Информация",
fonarik = "🔦Желтый фонарик [Лобби]",
settings = "⚙Настройки",
Cards_for_gold = "🃏Ультимативные карты [Лобби] [Beta]",
exit = "🏃‍♂️Выход",

version = VERSION_RUS,
alert1 = ALERT1_RUS,
alert2 = ALERT2_RUS,
alert3 = ALERT3_RUS,
alert4 = ALERT4_RUS,
alert5 = "Ссылка скопирована в буфер обмена. Вставьте её в браузер.🌐",
alert6 = "Ссылка скопирована в буфер обмена. Вставьте её в браузер.🌐Канал на ютубе RedRoy",
alert7 = "Режим работы для Nox эмулятора включен.",
alert8 = ALERT8_RUS,
InfoChoice = InfoChoice_RUS,
POJERTV = POJERTV_RUS,
POJERTV1 = POJERTV_RUS,
HelpPers = HelpPers_RUS,

Stalker = "1.Сталкер",
Blot = "2.Блот",
Ghost = "3.Призрак",
Raven = "4.Ворон",
Dragoon = "5.Драгун",
Sparkle = "6.Искра",
Cyclops = "7.Циклоп",
Bastion = "8.Бастион",
Levi = "9.Леви",
Freddie = "10.Фредди",
Mirage = "11.Мираж",
Satoshi = "12.Сатоши",
Doc = "13.Док",
Firefly ="14.Огонёк",
Arnie = "15.Арни",
Slayer = "16.Губитель",
Hurricane = "17.Ураган",
Shotgun = "18.Дополнительный дробовик",
Pistol = "19.Пистолет",
SinglePistol = "20.Однозарядный пистолет",
LEVIATHAN = "21.Левиафан",
SMOG = "22.Смог",
ANGEL = "23.Ангел",


Back = "🔙Назад",

InfoChoice1 = "❓ Что значит [Лобби] и [Бой]",
PodderjatAvtora = "🤝 Поддержать автора",
SviazSAvtorom = "🔗 Связь с автором скрипта",

toast1 = "Антиразброс и дальность активированы",
toast2 = "🔍Экран отдален",
toast3 = "Функция 🔘360 обзор активировано",
poka = "Вы покинули скрипт на Bullet Echo👋",

Nox = "Включить режим работы Nox эмулятора",
Pomogli = "👨Люди внесшие вклад в развитие скрипта",
Dim = "🔅Тусклый",
Bright = "🔆Яркий",
NightMod = "🌑Ночной режим [Бой]",
}
    
local game_en = {
HackWeapon = "🎯Hacking weapons [Lobby]",
Zoom = "🔍Zoom [Battle]",
review = "🔘360 review [Lobby]",
info = "📜Information",
fonarik = "🔦Yellow flashlight [Lobby]",
settings = "⚙Settings",
Cards_for_gold = "🃏Ultimatum cards [Lobby] [Visual]",
exit = "🏃‍♂️Exit",

version = VERSION_ENG,
alert1 = ALERT1_ENG,
alert2 = ALERT2_ENG,
alert3 = ALERT3_ENG,
alert4 = ALERT4_ENG,
alert5 = "The link was copied to the clipboard. Insert it in the browser.🌐",
alert6 = "The link was copied to the clipboard. Insert it in the browser.🌐Channel on YouTube RedRoy.",
alert7 = "The operating mode for The Nox emulator is enabled.",
alert8 = ALERT8_ENG,
InfoChoice = InfoChoice_ENG,
POJERTV = POJERTV_ENG,
POJERTV1 = POJERTV_ENG,
HelpPers = HelpPers_ENG,

Stalker = "1.Stalker",
Blot = "2.Blot",
Ghost = "3.Ghost",
Raven = "4.Raven",
Dragoon = "5.Dragoon",
Sparkle = "6.Sparkle",
Cyclops = "7.Cyclops",
Bastion = "8.Bastion",
Levi = "9.Levi",
Freddie = "10.Freddie",
Mirage = "11.Mirage",
Satoshi = "12.Satoshi",
Doc = "13.Doc",
Firefly ="14.Firefly",
Arnie = "15.Arnie",
Slayer = "16.Slayer",
Hurricane = "17.Hurricane",
Shotgun = "18.Secondary shotgun",
Pistol = "19.Pistol",
SinglePistol = "20.Single-shot pistol",
LEVIATHAN = "21.Leviathan",
SMOG = "22.Smog",
ANGEL = "23.Angel",

Back = "🔙Back",

InfoChoice1 = "❓ What does [Lobby] and [Battle] mean",
PodderjatAvtora = "🤝 Support the author",
SviazSAvtorom = "🔗 Link to the script author",

toast1 = "Anti-scatter and range activated",
toast2 = "🔍The screen is remote",
toast3 = "360 view function activated",
poka = "You left the script on Bullet Echo👋",

Nox = "Enable the Nox emulator mode",
Pomogli = "👨People who contributed to the development of the script",
Dim = "🔅Dim",
Bright = "🔆Bright",
NightMod = "🌑Night mod [Battle]",
}

local game_ar = {
HackWeapon = "هاك الاسلحة🛑[اللوبي]", 
Zoom = "🔍الزوم [في القيم]", 
review = "🔘رؤية ٣٦٠ درجة [اللوبي]", 
info = "📜المعلومات",
fonarik = "🔦Yellow flashlight [Lobby]",
settings = "⚙Settings",
Cards_for_gold = "🃏Ultimatum cards [Lobby] [Visual]",
exit = "🏃‍♂️الخروج", 
 
version = VERSION_AR, 
alert1 = ALERT1_AR, 
alert2 = ALERT2_AR, 
alert3 = ALERT3_AR, 
alert4 = ALERT4_AR, 
alert5 = "The link was copied to the clipboard. Insert it in the browser.🌐", 
alert6 = "The link was copied to the clipboard. Insert it in the browser.🌐Channel on YouTube RedRoy.",
alert7 = "The operating mode for The Nox emulator is enabled.",
alert8 = ALERT8_AR,
InfoChoice = InfoChoice_AR, 
POJERTV = POJERTV_AR, 
POJERTV1 = POJERTV_AR, 
HelpPers = HelpPers_AR, 
 
Stalker = "1.Stalker", 
Blot = "2.Blot", 
Ghost = "3.Ghost", 
Raven = "4.Raven", 
Dragoon = "5.Dragoon", 
Sparkle = "6.Sparkle", 
Cyclops = "7.Cyclops", 
Bastion = "8.Bastion", 
Levi = "9.Levi", 
Freddie = "10.Freddie", 
Mirage = "11.Mirage", 
Satoshi = "12.Satoshi", 
Doc = "13.Doc", 
Firefly ="14.Firefly", 
Arnie = "15.Arnie", 
Slayer = "16.Slayer", 
Hurricane = "17.Hurricane", 
Shotgun = "18.Secondary shotgun", 
Pistol = "19.Pistol", 
SinglePistol = "20.Single-shot pistol", 
LEVIATHAN = "21.Leviathan", 
SMOG = "22.Smog", 
ANGEL = "23.Angel", 
 
Back = "🔙الرجوع", 
 
InfoChoice1 = "❓ ماذا تعني [اللوبي] و [في القيم]", 
PodderjatAvtora = "🤝 ادعم المصمم", 
SviazSAvtorom = "🔗 رابط مصمم السكربت", 
 
toast1 = "تم تفعيل هاك الاسلحة 🛑", 
toast2 = "🔍تم التحكم في الشاشة", 
toast3 = "تم تفعيل رؤية ٣٦٠ درجة", 
poka = "لقد خرجت من سكربت بوليت ايكو 👋",

Nox = "Enable the Nox emulator mode",
Pomogli = "👨People who contributed to the development of the script",
Dim = "🔅Dim",
Bright = "🔆Bright",
NightMod = "🌑Night mod [Battle]",
}
--------------------------------------------------------------------------------------
--🇬🇧🇷🇺🇬🇧🇷🇺🇬🇧🇷🇺 Language 🇷🇺🇬🇧🇷🇺🇬🇧🇷🇺🇬🇧--
--------------------------------------------------------------------------------------
lang_game = game_en
local t = gg.getLocale() 
if t == "ru" then lang_game = game_ru end
if t == "ar" then lang_game = game_ar end

---------------------------------------------------------------------------------------
--🚪🚪🚪🚪🚪🚪🚪🚪 Exit 🚪🚪🚪🚪🚪🚪🚪🚪--
---------------------------------------------------------------------------------------
function Exit()
   gg.toast(lang_game['poka'])
   gg.clearResults() 
   gg.clearList() 
   os.exit()
end
---------------------------------------------------------------------------------------
--🔰🔰🔰🔰🔰🔰🔰🔰 Over 🔰🔰🔰🔰🔰🔰🔰🔰--
---------------------------------------------------------------------------------------

while(true) do
menuend=0
if gg.isVisible(true) then
gg.setVisible(false)
menuend=1
end
if menuend==1 then mainmenu() end
end		

---------------------------------------------------------------------------------------
--🔺🔺🔺🔺🔺🔺🔺🔺 End 🔺🔺🔺🔺🔺🔺🔺🔺--
---------------------------------------------------------------------------------------