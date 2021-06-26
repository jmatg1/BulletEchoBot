import os
from datetime import datetime
from PIL import Image
from tkinter import Tk, Button, Text, END
import threading

tkWindow = Tk()
tkWindow.geometry('400x250')
tkWindow.title('GetColor')

# im = Image.open("bride.jpg")
# im.rotate(45).show()

class Bot:
    work = 1
    screenshot = 0
    t1 = 0

    # def __init__(self):

    def getXYByColor(self, color):
        img = self.screenshot
        coordinates = []
        for x in range(img.size[0]):
            for y in range(img.size[1]):
                if img.getpixel((x, y))[:3] == color:
                    print('FOUNDDDDDDD')
                    coordinates = (x, y)
                    continue
        return coordinates

    def pixelSearch(self, x1, y1, color): # x2=1600, y2=900,
        # im = ImageOps.crop(im, (x1, y1, x2, y2))
        colorPixel = self.screenshot.getpixel((x1, y1))[:3]
        if colorPixel == color:
            return True
        else:
            return False

    def getScreen(self):
        os.system('hd-adb shell /system/bin/screencap -p /sdcard/screenshot.png')
        # Using the adb command to upload the screenshot of the mobile phone to the current directory
        os.system('hd-adb pull /sdcard/screenshot.png')
        self.screenshot = Image.open("screenshot.png")

    def getPixelColor(self, x1, y1):
        self.getScreen()
        im = Image.open("screenshot.png")
        # im1 = ImageOps.crop(im, (0, 0, 1000, 300))
        # im1.show()
        pixelRGB = im.getpixel((x1, y1))[:3]
        print(pixelRGB)
        return pixelRGB

    def start(self):
        self.work = 1
        val = text1.get("1.0", "end-1c")
        xy = val.split(',')
        print(val, xy)
        colorPixel = self.getPixelColor(int(xy[0]), int(xy[1]))

        self.log(colorPixel)
        self.log(self.getXYByColor(colorPixel))

    def stop(self):
        self.work = 0
        self.t1.join()

    def closeWindow(self):
        self.work = 0
        tkWindow.destroy()

    def log(self, value):
        text.insert(END, f"{value}\r\n" )
        text.see("end")

bot = Bot()
buttonStart = Button(tkWindow, text='Start', command=bot.start)
buttonStart.pack()
buttonStop = Button(tkWindow, text='Stop', command=bot.stop)
buttonStop.pack()

tkWindow.protocol("WM_DELETE_WINDOW", bot.closeWindow)

text1 = Text(tkWindow, height=1, width=10)
text1.pack()
text = Text(tkWindow, height=10, width=50)
text.pack()
tkWindow.mainloop()
