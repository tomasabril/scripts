import pyautogui
import time

screenWidth, screenHeight = pyautogui.size()
print('width: ' + str(screenWidth))
print('height: ' + str(screenHeight))
while(True):
    pyautogui.moveTo(1419, 189)
    pyautogui.click()
    time.sleep(0.3)
    pyautogui.moveTo(1458, 311)
    pyautogui.click()
    time.sleep(0.3)
    pyautogui.moveTo(1964, 460)
    pyautogui.click()
    time.sleep(0.4)

