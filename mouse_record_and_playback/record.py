import pyautogui
import time

screenWidth, screenHeight = pyautogui.size()
print('width: ' + str(screenWidth))
print('height: ' + str(screenHeight))
while(True):
    currentMouseX, currentMouseY = pyautogui.position()
    print(str(currentMouseX) + 'x' + str(currentMouseY))
    time.sleep(0.25)

