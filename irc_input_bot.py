#!/usr/bin/env python


import irc_credentials
Addr       = irc_credentials.Addr
Port       = irc_credentials.Port
NickName   = irc_credentials.NickName
UserName   = irc_credentials.UserName
Password   = irc_credentials.Password
HostName   = irc_credentials.HostName
ServerName = irc_credentials.ServerName
RealName   = irc_credentials.RealName
Channel    = irc_credentials.Channel

democratic_mode = False
print_irc_messages = True

buttonchecks = [
                ('PRIVMSG ' + Channel + ' :up', 'UP'),
                ('PRIVMSG ' + Channel + ' :down', 'DOWN'),
                ('PRIVMSG ' + Channel + ' :left', 'LEFT'),
                ('PRIVMSG ' + Channel + ' :right', 'RIGHT'),
                ('PRIVMSG ' + Channel + ' :a', 'A'),
                ('PRIVMSG ' + Channel + ' :b', 'B'),
                ('PRIVMSG ' + Channel + ' :x', 'X'),
                ('PRIVMSG ' + Channel + ' :y', 'Y'),
                ('PRIVMSG ' + Channel + ' :l', 'L'),
                ('PRIVMSG ' + Channel + ' :r', 'R'),
                ('PRIVMSG ' + Channel + ' :start', 'START'),
                ('PRIVMSG ' + Channel + ' :select', 'SELECT'),
                ]


# keyboard scancodes
SCANCODE_ACCENT = 0x29
SCANCODE_3 = 0x04
SCANCODE_6 = 0x07
SCANCODE_9 = 0x0A
SCANCODE_EQUAL = 0x0D
SCANCODE_Q = 0x10
SCANCODE_R = 0x13
SCANCODE_U = 0x16
SCANCODE_P = 0x19
SCANCODE_BACKSLASH = 0x2B
SCANCODE_S = 0x1F
SCANCODE_G = 0x22
SCANCODE_K = 0x25
SCANCODE_APOSTROPHE = 0x28
SCANCODE_SHIFT_LEFT = 0x2A
SCANCODE_X = 0x2D
SCANCODE_B = 0x30
SCANCODE_COMMA = 0x33
SCANCODE_SHIFT_RIGHT = 0x36
SCANCODE_SPACE = 0x39
SCANCODE_NUMPAD_1 = 0x4F
SCANCODE_NUMPAD_5 = 0x4C
SCANCODE_NUMPAD_3 = 0x51
SCANCODE_NUMPAD_PLUS = 0x4E
SCANCODE_F1 = 0x3B
SCANCODE_F4 = 0x3E
SCANCODE_F7 = 0x41
SCANCODE_F10 = 0x44
SCANCODE_1 = 0x02
SCANCODE_4 = 0x05
SCANCODE_7 = 0x08
SCANCODE_0 = 0x0B
SCANCODE_BACKSPACE = 0x0E
SCANCODE_W = 0x11
SCANCODE_T = 0x14
SCANCODE_I = 0x17
SCANCODE_LEFT_BRACKET = 0x1A
SCANCODE_CAPS_LOCK = 0x3A
SCANCODE_D = 0x20
SCANCODE_H = 0x23
SCANCODE_L = 0x26
SCANCODE_HASH = 0x2B
SCANCODE_BACKSLASH_ALT = 0xD5
SCANCODE_C = 0x2E
SCANCODE_N = 0x31
SCANCODE_PERIOD = 0x34
SCANCODE_CTRL_LEFT = 0x1D
SCANCODE_NUMPAD_7 = 0x47
SCANCODE_NUMPAD_2 = 0x50
SCANCODE_NUMPAD_9 = 0x49
SCANCODE_NUMPAD_PERIOD = 0x53
SCANCODE_F2 = 0x3C
SCANCODE_F5 = 0x3F
SCANCODE_F8 = 0x42
SCANCODE_F11 = 0xD9
SCANCODE_SCROLL_LOCK = 0x46
SCANCODE_2 = 0x03
SCANCODE_5 = 0x06
SCANCODE_8 = 0x09
SCANCODE_MINUS = 0x0C
SCANCODE_TAB = 0x0F
SCANCODE_E = 0x12
SCANCODE_Y = 0x15
SCANCODE_O = 0x18
SCANCODE_RIGHT_BRACKET = 0x1B
SCANCODE_A = 0x1E
SCANCODE_F = 0x21
SCANCODE_J = 0x24
SCANCODE_SEMICOLON = 0x27
SCANCODE_ENTER = 0x1C
SCANCODE_Z = 0x2C
SCANCODE_V = 0x2F
SCANCODE_M = 0x32
SCANCODE_SLASH = 0x35
SCANCODE_ALT_LEFT = 0x38
SCANCODE_NUMPAD_4 = 0x4B
SCANCODE_NUMPAD_8 = 0x48
SCANCODE_NUMPAD_0 = 0x52
SCANCODE_NUMPAD_6 = 0x4D
SCANCODE_NUMPAD_MINUS = 0x4A
SCANCODE_ESC = 0x01
SCANCODE_F3 = 0x3D
SCANCODE_F6 = 0x40
SCANCODE_F9 = 0x43
SCANCODE_F12 = 0xDA

# these codes require the KEYEVENTF_EXTENDEDKEY flag when passing them
SCANCODE_EXTENDED_INSERT = 0x52
SCANCODE_EXTENDED_HOME = 0x47
SCANCODE_EXTENDED_PAGEUP = 0x49
SCANCODE_EXTENDED_NUMPAD_MULTIPLY = 0x37
SCANCODE_EXTENDED_ALT_RIGHT = 0x38
SCANCODE_EXTENDED_DELETE = 0x53
SCANCODE_EXTENDED_END = 0x4F
SCANCODE_EXTENDED_PAGEDOWN = 0x51
SCANCODE_EXTENDED_NUMPAD_DIVIDE = 0x35
SCANCODE_EXTENDED_NUMPAD_ENTER = 0x1C
SCANCODE_EXTENDED_CTRL_RIGHT = 0x1D
SCANCODE_EXTENDED_LEFT = 0x4B
SCANCODE_EXTENDED_UP = 0x48
SCANCODE_EXTENDED_RIGHT = 0x4D
SCANCODE_EXTENDED_DOWN = 0x50

#SCANCODE_ = 0x45,C5 note 1	Num Lock
#SCANCODE_ = 0x2A,37	Prnt, Scrn

import ctypes

LONG = ctypes.c_long
DWORD = ctypes.c_ulong
ULONG_PTR = ctypes.POINTER(DWORD)
WORD = ctypes.c_ushort

class MOUSEINPUT(ctypes.Structure):
    _fields_ = (('dx', LONG),
                ('dy', LONG),
                ('mouseData', DWORD),
                ('dwFlags', DWORD),
                ('time', DWORD),
                ('dwExtraInfo', ULONG_PTR))

class KEYBDINPUT(ctypes.Structure):
    _fields_ = (('wVk', WORD),
                ('wScan', WORD),
                ('dwFlags', DWORD),
                ('time', DWORD),
                ('dwExtraInfo', ULONG_PTR))

class HARDWAREINPUT(ctypes.Structure):
    _fields_ = (('uMsg', DWORD),
                ('wParamL', WORD),
                ('wParamH', WORD))

class _INPUTunion(ctypes.Union):
    _fields_ = (('mi', MOUSEINPUT),
                ('ki', KEYBDINPUT),
                ('hi', HARDWAREINPUT))

class INPUT(ctypes.Structure):
    _fields_ = (('type', DWORD),
                ('union', _INPUTunion))

def SendInput(*inputs):
    nInputs = len(inputs)
    LPINPUT = INPUT * nInputs
    pInputs = LPINPUT(*inputs)
    cbSize = ctypes.c_int(ctypes.sizeof(INPUT))
    return ctypes.windll.user32.SendInput(nInputs, pInputs, cbSize)

INPUT_MOUSE = 0
INPUT_KEYBOARD = 1
INPUT_HARDWARD = 2

def Input(structure):
    if isinstance(structure, MOUSEINPUT):
        return INPUT(INPUT_MOUSE, _INPUTunion(mi=structure))
    if isinstance(structure, KEYBDINPUT):
        return INPUT(INPUT_KEYBOARD, _INPUTunion(ki=structure))
    if isinstance(structure, HARDWAREINPUT):
        return INPUT(INPUT_HARDWARE, _INPUTunion(hi=structure))
    raise TypeError('Cannot create INPUT structure!')

WHEEL_DELTA = 120
XBUTTON1 = 0x0001
XBUTTON2 = 0x0002
MOUSEEVENTF_ABSOLUTE = 0x8000
MOUSEEVENTF_HWHEEL = 0x01000
MOUSEEVENTF_MOVE = 0x0001
MOUSEEVENTF_MOVE_NOCOALESCE = 0x2000
MOUSEEVENTF_LEFTDOWN = 0x0002
MOUSEEVENTF_LEFTUP = 0x0004
MOUSEEVENTF_RIGHTDOWN = 0x0008
MOUSEEVENTF_RIGHTUP = 0x0010
MOUSEEVENTF_MIDDLEDOWN = 0x0020
MOUSEEVENTF_MIDDLEUP = 0x0040
MOUSEEVENTF_VIRTUALDESK = 0x4000
MOUSEEVENTF_WHEEL = 0x0800
MOUSEEVENTF_XDOWN = 0x0080
MOUSEEVENTF_XUP = 0x0100

def MouseInput(flags, x, y, data):
    return MOUSEINPUT(x, y, data, flags, 0, None)

VK_LBUTTON = 0x01               # Left mouse button
VK_RBUTTON = 0x02               # Right mouse button
VK_CANCEL = 0x03                # Control-break processing
VK_MBUTTON = 0x04               # Middle mouse button (three-button mouse)
VK_XBUTTON1 = 0x05              # X1 mouse button
VK_XBUTTON2 = 0x06              # X2 mouse button
VK_BACK = 0x08                  # BACKSPACE key
VK_TAB = 0x09                   # TAB key
VK_CLEAR = 0x0C                 # CLEAR key
VK_RETURN = 0x0D                # ENTER key
VK_SHIFT = 0x10                 # SHIFT key
VK_CONTROL = 0x11               # CTRL key
VK_MENU = 0x12                  # ALT key
VK_PAUSE = 0x13                 # PAUSE key
VK_CAPITAL = 0x14               # CAPS LOCK key
VK_KANA = 0x15                  # IME Kana mode
VK_HANGUL = 0x15                # IME Hangul mode
VK_JUNJA = 0x17                 # IME Junja mode
VK_FINAL = 0x18                 # IME final mode
VK_HANJA = 0x19                 # IME Hanja mode
VK_KANJI = 0x19                 # IME Kanji mode
VK_ESCAPE = 0x1B                # ESC key
VK_CONVERT = 0x1C               # IME convert
VK_NONCONVERT = 0x1D            # IME nonconvert
VK_ACCEPT = 0x1E                # IME accept
VK_MODECHANGE = 0x1F            # IME mode change request
VK_SPACE = 0x20                 # SPACEBAR
VK_PRIOR = 0x21                 # PAGE UP key
VK_NEXT = 0x22                  # PAGE DOWN key
VK_END = 0x23                   # END key
VK_HOME = 0x24                  # HOME key
VK_LEFT = 0x25                  # LEFT ARROW key
VK_UP = 0x26                    # UP ARROW key
VK_RIGHT = 0x27                 # RIGHT ARROW key
VK_DOWN = 0x28                  # DOWN ARROW key
VK_SELECT = 0x29                # SELECT key
VK_PRINT = 0x2A                 # PRINT key
VK_EXECUTE = 0x2B               # EXECUTE key
VK_SNAPSHOT = 0x2C              # PRINT SCREEN key
VK_INSERT = 0x2D                # INS key
VK_DELETE = 0x2E                # DEL key
VK_HELP = 0x2F                  # HELP key
VK_LWIN = 0x5B                  # Left Windows key (Natural keyboard)
VK_RWIN = 0x5C                  # Right Windows key (Natural keyboard)
VK_APPS = 0x5D                  # Applications key (Natural keyboard)
VK_SLEEP = 0x5F                 # Computer Sleep key
VK_NUMPAD0 = 0x60               # Numeric keypad 0 key
VK_NUMPAD1 = 0x61               # Numeric keypad 1 key
VK_NUMPAD2 = 0x62               # Numeric keypad 2 key
VK_NUMPAD3 = 0x63               # Numeric keypad 3 key
VK_NUMPAD4 = 0x64               # Numeric keypad 4 key
VK_NUMPAD5 = 0x65               # Numeric keypad 5 key
VK_NUMPAD6 = 0x66               # Numeric keypad 6 key
VK_NUMPAD7 = 0x67               # Numeric keypad 7 key
VK_NUMPAD8 = 0x68               # Numeric keypad 8 key
VK_NUMPAD9 = 0x69               # Numeric keypad 9 key
VK_MULTIPLY = 0x6A              # Multiply key
VK_ADD = 0x6B                   # Add key
VK_SEPARATOR = 0x6C             # Separator key
VK_SUBTRACT = 0x6D              # Subtract key
VK_DECIMAL = 0x6E               # Decimal key
VK_DIVIDE = 0x6F                # Divide key
VK_F1 = 0x70                    # F1 key
VK_F2 = 0x71                    # F2 key
VK_F3 = 0x72                    # F3 key
VK_F4 = 0x73                    # F4 key
VK_F5 = 0x74                    # F5 key
VK_F6 = 0x75                    # F6 key
VK_F7 = 0x76                    # F7 key
VK_F8 = 0x77                    # F8 key
VK_F9 = 0x78                    # F9 key
VK_F10 = 0x79                   # F10 key
VK_F11 = 0x7A                   # F11 key
VK_F12 = 0x7B                   # F12 key
VK_F13 = 0x7C                   # F13 key
VK_F14 = 0x7D                   # F14 key
VK_F15 = 0x7E                   # F15 key
VK_F16 = 0x7F                   # F16 key
VK_F17 = 0x80                   # F17 key
VK_F18 = 0x81                   # F18 key
VK_F19 = 0x82                   # F19 key
VK_F20 = 0x83                   # F20 key
VK_F21 = 0x84                   # F21 key
VK_F22 = 0x85                   # F22 key
VK_F23 = 0x86                   # F23 key
VK_F24 = 0x87                   # F24 key
VK_NUMLOCK = 0x90               # NUM LOCK key
VK_SCROLL = 0x91                # SCROLL LOCK key
VK_LSHIFT = 0xA0                # Left SHIFT key
VK_RSHIFT = 0xA1                # Right SHIFT key
VK_LCONTROL = 0xA2              # Left CONTROL key
VK_RCONTROL = 0xA3              # Right CONTROL key
VK_LMENU = 0xA4                 # Left MENU key
VK_RMENU = 0xA5                 # Right MENU key
VK_BROWSER_BACK = 0xA6          # Browser Back key
VK_BROWSER_FORWARD = 0xA7       # Browser Forward key
VK_BROWSER_REFRESH = 0xA8       # Browser Refresh key
VK_BROWSER_STOP = 0xA9          # Browser Stop key
VK_BROWSER_SEARCH = 0xAA        # Browser Search key
VK_BROWSER_FAVORITES = 0xAB     # Browser Favorites key
VK_BROWSER_HOME = 0xAC          # Browser Start and Home key
VK_VOLUME_MUTE = 0xAD           # Volume Mute key
VK_VOLUME_DOWN = 0xAE           # Volume Down key
VK_VOLUME_UP = 0xAF             # Volume Up key
VK_MEDIA_NEXT_TRACK = 0xB0      # Next Track key
VK_MEDIA_PREV_TRACK = 0xB1      # Previous Track key
VK_MEDIA_STOP = 0xB2            # Stop Media key
VK_MEDIA_PLAY_PAUSE = 0xB3      # Play/Pause Media key
VK_LAUNCH_MAIL = 0xB4           # Start Mail key
VK_LAUNCH_MEDIA_SELECT = 0xB5   # Select Media key
VK_LAUNCH_APP1 = 0xB6           # Start Application 1 key
VK_LAUNCH_APP2 = 0xB7           # Start Application 2 key
VK_OEM_1 = 0xBA                 # Used for miscellaneous characters; it can vary by keyboard.
                                # For the US standard keyboard, the ';:' key
VK_OEM_PLUS = 0xBB              # For any country/region, the '+' key
VK_OEM_COMMA = 0xBC             # For any country/region, the ',' key
VK_OEM_MINUS = 0xBD             # For any country/region, the '-' key
VK_OEM_PERIOD = 0xBE            # For any country/region, the '.' key
VK_OEM_2 = 0xBF                 # Used for miscellaneous characters; it can vary by keyboard.
                                # For the US standard keyboard, the '/?' key
VK_OEM_3 = 0xC0                 # Used for miscellaneous characters; it can vary by keyboard.
                                # For the US standard keyboard, the '`~' key
VK_OEM_4 = 0xDB                 # Used for miscellaneous characters; it can vary by keyboard.
                                # For the US standard keyboard, the '[{' key
VK_OEM_5 = 0xDC                 # Used for miscellaneous characters; it can vary by keyboard.
                                # For the US standard keyboard, the '\|' key
VK_OEM_6 = 0xDD                 # Used for miscellaneous characters; it can vary by keyboard.
                                # For the US standard keyboard, the ']}' key
VK_OEM_7 = 0xDE                 # Used for miscellaneous characters; it can vary by keyboard.
                                # For the US standard keyboard, the 'single-quote/double-quote' key
VK_OEM_8 = 0xDF                 # Used for miscellaneous characters; it can vary by keyboard.
VK_OEM_102 = 0xE2               # Either the angle bracket key or the backslash key on the RT 102-key keyboard
VK_PROCESSKEY = 0xE5            # IME PROCESS key
VK_PACKET = 0xE7                # Used to pass Unicode characters as if they were keystrokes. The VK_PACKET key is the low word of a 32-bit Virtual Key value used for non-keyboard input methods. For more information, see Remark in KEYBDINPUT, SendInput, WM_KEYDOWN, and WM_KEYUP
VK_ATTN = 0xF6                  # Attn key
VK_CRSEL = 0xF7                 # CrSel key
VK_EXSEL = 0xF8                 # ExSel key
VK_EREOF = 0xF9                 # Erase EOF key
VK_PLAY = 0xFA                  # Play key
VK_ZOOM = 0xFB                  # Zoom key
VK_PA1 = 0xFD                   # PA1 key
VK_OEM_CLEAR = 0xFE             # Clear key

KEYEVENTF_EXTENDEDKEY = 0x0001
KEYEVENTF_KEYUP = 0x0002
KEYEVENTF_SCANCODE = 0x0008
KEYEVENTF_UNICODE = 0x0004

KEY_0 = 0x30
KEY_1 = 0x31
KEY_2 = 0x32
KEY_3 = 0x33
KEY_4 = 0x34
KEY_5 = 0x35
KEY_6 = 0x36
KEY_7 = 0x37
KEY_8 = 0x38
KEY_9 = 0x39
KEY_A = 0x41
KEY_B = 0x42
KEY_C = 0x43
KEY_D = 0x44
KEY_E = 0x45
KEY_F = 0x46
KEY_G = 0x47
KEY_H = 0x48
KEY_I = 0x49
KEY_J = 0x4A
KEY_K = 0x4B
KEY_L = 0x4C
KEY_M = 0x4D
KEY_N = 0x4E
KEY_O = 0x4F
KEY_P = 0x50
KEY_Q = 0x51
KEY_R = 0x52
KEY_S = 0x53
KEY_T = 0x54
KEY_U = 0x55
KEY_V = 0x56
KEY_W = 0x57
KEY_X = 0x58
KEY_Y = 0x59
KEY_Z = 0x5A

def KeybdInput(code, flags):
    return KEYBDINPUT(code, code, flags, 0, None)

def HardwareInput(message, parameter):
    return HARDWAREINPUT(message & 0xFFFFFFFF,
                         parameter & 0xFFFF,
                         parameter >> 16 & 0xFFFF)

def Mouse(flags, x=0, y=0, data=0):
    return Input(MouseInput(flags, x, y, data))

def Keyboard(code, flags=0):
    return Input(KeybdInput(code, flags))

def Hardware(message, parameter=0):
    return Input(HardwareInput(message, parameter))

import string

UPPER = frozenset('~!@#$%^&*()_+QWERTYUIOP{}|ASDFGHJKL:"ZXCVBNM<>?')
LOWER = frozenset("`1234567890-=qwertyuiop[]\\asdfghjkl;'zxcvbnm,./")
ORDER = string.ascii_letters + string.digits + ' \b\r\t'
ALTER = dict(zip('!@#$%^&*()', '1234567890'))
OTHER = {'`': VK_OEM_3,
         '~': VK_OEM_3,
         '-': VK_OEM_MINUS,
         '_': VK_OEM_MINUS,
         '=': VK_OEM_PLUS,
         '+': VK_OEM_PLUS,
         '[': VK_OEM_4,
         '{': VK_OEM_4,
         ']': VK_OEM_6,
         '}': VK_OEM_6,
         '\\': VK_OEM_5,
         '|': VK_OEM_5,
         ';': VK_OEM_1,
         ':': VK_OEM_1,
         "'": VK_OEM_7,
         '"': VK_OEM_7,
         ',': VK_OEM_COMMA,
         '<': VK_OEM_COMMA,
         '.': VK_OEM_PERIOD,
         '>': VK_OEM_PERIOD,
         '/': VK_OEM_2,
         '?': VK_OEM_2}


################################################################################

import time, sys, threading, operator
from socket import *

def send_input(input):

    scancode = 0x2C
    additional_flags = 0
    if input == 'UP':
        scancode = SCANCODE_EXTENDED_UP
        additional_flags = KEYEVENTF_EXTENDEDKEY
    elif input == 'DOWN':
        scancode = SCANCODE_EXTENDED_DOWN
        additional_flags = KEYEVENTF_EXTENDEDKEY
    elif input == 'LEFT':
        scancode = SCANCODE_EXTENDED_LEFT
        additional_flags = KEYEVENTF_EXTENDEDKEY
    elif input == 'RIGHT':
        scancode = SCANCODE_EXTENDED_RIGHT
        additional_flags = KEYEVENTF_EXTENDEDKEY
    elif input == 'A':
        scancode = SCANCODE_Z
    elif input == 'B':
        scancode = SCANCODE_X
    elif input == 'X':
        scancode = SCANCODE_C
    elif input == 'Y':
        scancode = SCANCODE_V
    elif input == 'SELECT':
        scancode = SCANCODE_A
    elif input == 'START':
        scancode = SCANCODE_S
    elif input == 'L':
        scancode = SCANCODE_D
    elif input == 'R':
        scancode = SCANCODE_F


    print time.strftime('%H:%M:%S', time.gmtime()) + ': ' + input
    SendInput(Input(KeybdInput(scancode, additional_flags|KEYEVENTF_SCANCODE)))
    time.sleep(0.5)
    SendInput(Input(KeybdInput(scancode, additional_flags|KEYEVENTF_SCANCODE|KEYEVENTF_KEYUP)))


    pass

def send_no_input():
    print time.strftime('%H:%M:%S', time.gmtime()) + ': No input'
    pass

def process_button_input(input):
    global input_list
    global democratic_mode

    if democratic_mode:
        input_lock.acquire()
        input_list.append(input)
        input_lock.release()
    else:
        send_input(input)

def input_timeout():
    #print 'INPUT TIMEOUT'
    global input_list
    input_lock.acquire()
    
    inputs = {}
    for x in input_list:
        if not inputs.has_key(x):
            inputs[x] = 0
        inputs[x] = inputs[x] + 1

    input_list = []
    input_lock.release()

    sorted_inputs = sorted(inputs.iteritems(), key=operator.itemgetter(1), reverse=True)

    #for x in sorted_inputs:
    #    print x

    if len(sorted_inputs) > 0:
        send_input(sorted_inputs[0][0])
    else:
        send_no_input()

    threading.Timer(1, input_timeout).start()

input_list = []
input_lock = threading.Lock()

irc = socket( AF_INET, SOCK_STREAM )
irc.connect ( (Addr, Port) )
if Password is not None:
    irc.send( 'PASS ' + Password + '\r\n' )
irc.send( 'NICK ' + NickName + '\r\n' )
irc.send( 'USER ' + UserName + ' ' + HostName + ' ' + ServerName + ' :' + RealName + '\r\n' )
irc.send( 'JOIN ' + Channel + '\r\n' )

if democratic_mode:
    input_timeout()

while True:
    data = irc.recv ( 4096 )

    for line in data.splitlines():
        if print_irc_messages:
            print line

        # answer PING command when it arrives
        if line.startswith('PING :'):
            irc.send( 'PONG :' + line[6:] + '\r\n'  )

        # join channel after connected to server
        if '---------- END OF MESSAGE(S) OF THE DAY ----------' in line:
            irc.send( 'JOIN ' + Channel + '\r\n' )
        if ' :End of MOTD command' in line:
            irc.send( 'JOIN ' + Channel + '\r\n' )

        for chk in buttonchecks:
            if line.endswith(chk[0]):
                process_button_input(chk[1])


