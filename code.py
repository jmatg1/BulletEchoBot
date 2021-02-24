import os
import time
from datetime import datetime
from PIL import Image
from tkinter import Tk, Button, Text, END
from tkinter import ttk

import threading
from subprocess import check_output

tkWindow = Tk()
tkWindow.geometry('400x250')
tkWindow.title('Bullet ECho Bot v 1.1 By Jmatg1')

class Bot:
    work = 1
    screenshot = 0
    t1 = 0
    fight = 1
    device = 0
    controlsUnderBuilding = [(576, 431), (1059, 768)]
    # def __init__(self):
    def shadeVariation(self, col, col2, shade = 0):
        if shade == 0:
            return col == col2
        rezult = (abs(col[0] - col2[0]), abs(col[1] - col2[1]), abs(col[2] - col2[2]))
        shadowCount = 0
        for rgb in rezult:
            if rgb <= shade:
                shadowCount += 1
        return shadowCount == 3

    def getXYByColor(self, color, isGetSCreen=True, shade = 0, startXY = (0,0), endXY=(0,0)):
        if (isGetSCreen):
            self.getScreen()
        img = self.screenshot
        coordinates = False


        if endXY[0] == 0 and endXY[1] == 0:
            endXY = (img.size[0], img.size[1])
        for x in range(img.size[0]):
            if not(startXY[0] < x < endXY[0]):
                continue

            for y in range(img.size[1]):
                if not(startXY[1] < y < endXY[1]):
                    continue
                if self.shadeVariation(img.getpixel((x, y))[:3],  color, shade):
                    coordinates = (x, y)
                    continue
        return coordinates

    def pixelSearch(self, x1, y1, color):  # x2=1600, y2=900,
        # im = ImageOps.crop(im, (x1, y1, x2, y2))
        colorPixel = self.screenshot.getpixel((x1, y1))[:3]
        if colorPixel == color:
            return True
        else:
            return False

    def getScreen(self):
        self.shell(f'/system/bin/screencap -p /sdcard/{self.device}-screenshot.png')
        # os.system('hd-adb shell /system/bin/screencap -p /sdcard/screenshot.png')
        # Using the adb command to upload the screenshot of the mobile phone to the current directory

        os.system(f'hd-adb -s {self.device} pull /sdcard/{self.device}-screenshot.png')
        try:
            self.screenshot = Image.open(f"{self.device}-screenshot.png")
        except ValueError:
            print(ValueError)
            self.getScreen()

    def getPixelColor(self, x1, y1):
        self.getScreen()
        im = Image.open(f"{self.device}-screenshot.png")
        # im1 = ImageOps.crop(im, (0, 0, 1000, 300))
        # im1.show()
        pixelRGB = im.getpixel((x1, y1))[:3]
        return pixelRGB

    def click(self, x, y, timer=True):
        if (timer):
            time.sleep(1)
        # os.system(f'hd-adb shell input tap {x} {y}')
        self.shell(f'input tap {x} {y}')
        if (timer):
            time.sleep(1)

    def main(self):
        while self.work:
            # self.log('Get ScreenShot')
            self.getScreen()

            # self.log('Scan')

            self.skipAds()

            if self.isMainScreen():
                self.log('Main Screen')
                if self.isEventActive():
                    self.log('isEventActive')
                    self.openEvent()
                    self.eventBot()
                elif self.isMissionsActive():
                    self.click(120, 555)
                    self.missionBot()
                    self.clickBack()
                else:
                    self.clickPlay()
                continue

            if self.isEventScreen():
                self.log('Event Screen')
                self.eventBot()
                continue

            if self.isFightScreen():
                self.log('Fight Screen')
                self.click(1280, 450) # 1 skill
                self.keyW(10000)
                self.click(1480, 335) # 2 skill
                continue

            if self.isCollectScreen():
                self.log('Collect Screen')
                self.click(611, 669) # Skip Series
                self.click(803, 769) # Collect
                self.click(803, 769) # Next
                self.getScreen()
                continue

            if self.isTableRezultScreen():
                self.log('Table Screen')
                self.click(803, 769) # Next
                self.getScreen()
                continue

            if self.isFriendsScreen():
                self.log('Friends Screen') # enothe
                continue

            if self.isMissionsScreen():
                self.log('Missions Screen')
                self.missionBot()
                self.clickBack()
                continue

            if self.isHeroesScreen():
                self.log('Heroes Screen')
                self.click(67, 50)
                continue

            if self.isShopScreen():
                self.log('Shop Screen')
                self.click(67, 50)
                continue



    def skipAds(self):
        self.getPixelColor(446, 166)
        if self.pixelSearch(446, 166, (47, 77, 129)): # Повышение level
            self.click(1034, 782)
        if self.pixelSearch(446, 166, (251, 164, 20)): # Повышение рейтинга
            self.clickBack()
        if self.pixelSearch(530, 290, (17, 115, 202)): # Autokick
            self.log('Autockic detected')
            self.keyBack()
        if self.pixelSearch(530, 290, (17, 114, 201)): # Autokick
            self.log('Autockic detected')
            self.keyBack()
        if self.pixelSearch(446, 166, (82, 58, 215)): # Братья по оружию
            self.click(1238, 171)
            time.sleep(1)
            self.getScreen()
            if self.isMainScreen() == False:
                self.click(657, 588)

    def isMainScreen(self):
        if self.pixelSearch(1345, 35, (9, 41, 118)): # 1340, 30, 1350, 40,
            return True
        else:
            return False

    def isEventScreen(self):
        if self.pixelSearch(1345, 35, (8, 8, 19)):
            return True
        else:
            return False

    def isEventActive(self):
        x1 = 196
        y1 = 306
        # self.getPixelColor(x1, y1)
        if self.pixelSearch(x1, y1, (255, 210, 31)):
            return True
        else:
            return False

    def isMissionsActive(self):
        x1 = 196
        y1 = 514
        self.getPixelColor(x1, y1)
        if self.pixelSearch(x1, y1, (255, 210, 31)):
            return True
        else:
            return False

    def eventBot(self):
        self.missionBot()
        self.clickPlay()
        time.sleep(1)
        if self.isTicketsOver():
            self.log('Tickets is Over')
            self.click(1060, 275)
            self.click(67, 50)

    def missionBot(self):
        hasMission = True
        while hasMission:
            self.getScreen()
            cord = self.getXYByColor((254, 171, 39))
            if cord:
                self.click(cord[0], cord[1])
                time.sleep(1)
                self.keyBack()
            else:
                hasMission = False

    def isTicketsOver(self):
        self.getScreen()
        x1 = 515
        y1 = 290
        # self.getPixelColor(x1, y1)
        if self.pixelSearch(x1, y1, (17, 113, 201)):
            return True
        else:
            return False

    def isCollectScreen(self):
        count = 0
        x1 = 230
        y1 = 42
        # self.getPixelColor(x1, y1)
        if self.pixelSearch(x1, y1, (40, 40, 81)):
            count = count + 1
        if self.pixelSearch(x1, y1, (46, 38, 91)):
            count = count + 1
        if self.pixelSearch(x1, y1, (56, 37, 53)):
            count = count + 1
        return count > 0

    def isTableRezultScreen(self):
        x1 = 380
        y1 = 105
        # self.getPixelColor(x1, y1)
        if self.pixelSearch(x1, y1, (0, 55, 112)):
            return True
        else:
            return False

    def isFightScreen(self):
        x1 = 1108
        y1 = 803
        # self.getPixelColor(x1, y1)
        if self.pixelSearch(x1, y1, (156, 201, 228)): # (46, 5, 15)
            return True
        else:
            return False

    def isFriendsScreen(self):
        if self.pixelSearch(1345, 35, (9, 19, 35)):
            return True
        else:
            return False

    def isMissionsScreen(self):
        x1 = 570
        y1 = 120
        # self.getPixelColor(x1, y1)
        if self.pixelSearch(x1, y1, (18, 150, 234)):
            return True
        else:
            return False

    def isHeroesScreen(self):
        x1 = 275
        y1 = 417
        # self.getPixelColor(x1, y1)
        if self.pixelSearch(x1, y1, (187, 104, 24)): # кулачек
            return True
        else:
            return False

    def isShopScreen(self):
        x1 = 930
        y1 = 840
        # self.getPixelColor(x1, y1)
        if self.pixelSearch(x1, y1, (1, 88, 153)):
            return True
        else:
            return False

    def openEvent(self):
        self.click(120, 337)

    def clickPlay(self):
        self.click(1366, 866)

    def clickBack(self):
        self.click(67, 50)

    def keyW(self, ms):
        self.shell(f'input swipe 250 700 250 600 {ms}')

    def keyQ(self):
        self.shell(f'input keyevent 45')

    def keyE(self):
        self.shell(f'input keyevent 33')

    def keyBack(self):
        self.shell(f'input keyevent 4')

    def start(self):
        self.device = inputDevice.get()
        self.work = 1
        self.t1 = threading.Thread(target=self.main, args=[])
        self.t1.start()

    def stop(self):
        self.work = 0
        self.t1.join()

    def closeWindow(self):
        self.work = 0
        tkWindow.destroy()

    def shell(self, cmd):
        os.system(f'hd-adb -s {self.device} shell {cmd}')

    def log(self, value):
        timeVal = datetime.now().strftime("%D %H:%M:%S")
        logString = "%s %s" % (timeVal, value)
        text.insert(END, logString + " \r\n")
        text.see("end")
        f = open("log.txt", "a")
        f.write(logString + " \r")
        f.close()

    def selectedDevice(self, event):
        self.device = inputDevice.get()

bot = Bot()
buttonStart = Button(tkWindow, text='Start', command=bot.start)
buttonStart.pack()
buttonStop = Button(tkWindow, text='Stop', command=bot.stop)
buttonStop.pack()

tkWindow.protocol("WM_DELETE_WINDOW", bot.closeWindow)
devList = check_output(["hd-adb", "devices"])
text = Text(tkWindow, height=10, width=50)
text.insert(END, devList)




devListArr = str(devList).replace('\\r\\n', ';').replace('\\t', ';').split(';')
rezArr = []
for x in devListArr:
    if (x.startswith('emulator-')):
        rezArr.append(x)
print(rezArr)

inputDevice = ttk.Combobox(tkWindow, width=15)
inputDevice['values'] = rezArr
inputDevice.bind("<<ComboboxSelected>>", bot.selectedDevice)
inputDevice.current(0)
inputDevice.pack()
text.pack()

tkWindow.mainloop()
